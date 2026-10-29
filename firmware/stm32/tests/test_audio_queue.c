#include "../core/audio_queue.h"
#include <assert.h>
#include <limits.h>
static audio_queue q;
int main(void) {
 size_t count;
 int16_t a[AUDIO_BLOCK_SAMPLES],b[AUDIO_BLOCK_SAMPLES];
 audio_queue_init(&q);assert(audio_queue_high_water(&q)==0);assert(!audio_queue_pop(&q,b,&count));
 /* Silence is a full valid block, not a reason to omit recording. */
 for(unsigned round=0;round<32;round++) {
  for(unsigned n=0;n<AUDIO_QUEUE_BLOCKS;n++) {
   for(unsigned i=0;i<AUDIO_BLOCK_SAMPLES;i++)a[i]=(int16_t)(round*AUDIO_QUEUE_BLOCKS+n);
   assert(audio_queue_push(&q,a));
  }
  for(unsigned n=0;n<AUDIO_QUEUE_BLOCKS;n++) {
   assert(audio_queue_pop(&q,b,&count));for(unsigned i=0;i<AUDIO_BLOCK_SAMPLES;i++)assert(b[i]==(int16_t)(round*AUDIO_QUEUE_BLOCKS+n));
  }
 }
 atomic_store(&q.produced,UINT_MAX-2);atomic_store(&q.consumed,UINT_MAX-2);
 for(unsigned n=0;n<AUDIO_QUEUE_BLOCKS;n++)assert(audio_queue_push(&q,a));
 assert(!audio_queue_push(&q,a));assert(audio_queue_failed(&q));assert(audio_queue_high_water(&q)==AUDIO_QUEUE_BLOCKS);
 for(unsigned n=0;n<AUDIO_QUEUE_BLOCKS;n++)assert(audio_queue_pop(&q,b,&count));
 assert(!audio_queue_push(&q,a)); /* fault cannot silently recover */
 audio_queue_init(&q);assert(audio_queue_high_water(&q)==0);
 for(size_t n=1;n<=AUDIO_BLOCK_SAMPLES;n++){
  b[n-1]=-1;assert(audio_queue_push_samples(&q,a,n));
  assert(audio_queue_pop(&q,b,&count)&&count==n);assert(audio_queue_high_water(&q)==1);
  for(size_t i=0;i<n;i++)assert(b[i]==a[i]);
 }
 assert(!audio_queue_push_samples(&q,a,0)&&audio_queue_failed(&q));
 return 0;
}
