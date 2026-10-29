#include "audio_queue.h"
#include <string.h>
_Static_assert(ATOMIC_INT_LOCK_FREE==2,"ISR counters must be lock-free");
_Static_assert(ATOMIC_BOOL_LOCK_FREE==2,"ISR fault flag must be lock-free");
void audio_queue_init(audio_queue *q) {
 atomic_init(&q->produced,0);atomic_init(&q->consumed,0);atomic_init(&q->fault,false);atomic_init(&q->high_water,0);
}
unsigned audio_queue_high_water(const audio_queue *q){return atomic_load_explicit(&q->high_water,memory_order_relaxed);}
void audio_queue_fail(audio_queue *q) {atomic_store_explicit(&q->fault,true,memory_order_release);}
bool audio_queue_failed(audio_queue *q) {return atomic_load_explicit(&q->fault,memory_order_acquire);}
bool audio_queue_push(audio_queue *q,const int16_t *block) {
 return audio_queue_push_samples(q,block,AUDIO_BLOCK_SAMPLES);
}
bool audio_queue_push_samples(audio_queue *q,const int16_t *block,size_t count) {
 if(audio_queue_failed(q))return false;
 if(!block || !count || count>AUDIO_BLOCK_SAMPLES){audio_queue_fail(q);return false;}
 unsigned p=atomic_load_explicit(&q->produced,memory_order_relaxed);
 unsigned c=atomic_load_explicit(&q->consumed,memory_order_acquire);
 if(p-c>=AUDIO_QUEUE_BLOCKS){audio_queue_fail(q);return false;}
 memcpy(q->pcm[p%AUDIO_QUEUE_BLOCKS],block,count*sizeof(*block));
 q->valid[p%AUDIO_QUEUE_BLOCKS]=count;
 unsigned occupied=p-c+1;
 if(occupied>atomic_load_explicit(&q->high_water,memory_order_relaxed))
  atomic_store_explicit(&q->high_water,occupied,memory_order_relaxed);
 atomic_store_explicit(&q->produced,p+1,memory_order_release);return true;
}
bool audio_queue_pop(audio_queue *q,int16_t *block,size_t *count) {
 if(!block || !count){audio_queue_fail(q);return false;}
 unsigned c=atomic_load_explicit(&q->consumed,memory_order_relaxed);
 unsigned p=atomic_load_explicit(&q->produced,memory_order_acquire);
 if(c==p)return false;
 *count=q->valid[c%AUDIO_QUEUE_BLOCKS];
 memcpy(block,q->pcm[c%AUDIO_QUEUE_BLOCKS],*count*sizeof(*block));
 atomic_store_explicit(&q->consumed,c+1,memory_order_release);return true;
}
