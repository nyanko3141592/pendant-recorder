#include "../core/recording_pipeline.h"
#include <assert.h>
static audio_queue q;
static recording_pipeline p;
static int16_t block[AUDIO_BLOCK_SAMPLES];
static unsigned calls,inject;
static uint64_t total;
static bool fail;
static bool sink(void *ctx,const uint8_t *wav,size_t size,uint32_t samples){
 (void)ctx;assert(size>=1084);assert(wav[0]=='R'&&wav[8]=='W');
 calls++;total+=samples;
 /* Model ISR capture during blocking crypto/storage. */
 for(unsigned i=0;i<inject;i++)audio_queue_push(&q,block);
 inject=0;return !fail;
}
int main(void){
 audio_queue_init(&q);recording_pipeline_init(&p);
 for(unsigned i=0;i<156;i++){
  assert(audio_queue_push(&q,block));assert(recording_pipeline_service(&p,&q,sink,0));
 }
 assert(calls==0);inject=3;
 assert(audio_queue_push(&q,block));assert(recording_pipeline_service(&p,&q,sink,0));
 assert(calls==1&&total==160000); /* 768 samples retained across file boundary. */
 assert(recording_pipeline_finish(&p,&q,sink,0));
 assert(calls==2&&total==160*1024&&p.committed_samples==total);
 audio_queue_init(&q);recording_pipeline_init(&p);calls=0;total=0;
 for(unsigned i=0;i<156;i++){assert(audio_queue_push(&q,block));assert(recording_pipeline_service(&p,&q,sink,0));}
 inject=AUDIO_QUEUE_BLOCKS+1;assert(audio_queue_push(&q,block));
 assert(!recording_pipeline_service(&p,&q,sink,0));assert(p.failed&&audio_queue_failed(&q));
 assert(!recording_pipeline_service(&p,&q,sink,0));
 /* Exercise every possible final DMA tail length, including file boundary. */
 for(size_t tail=1;tail<=AUDIO_BLOCK_SAMPLES;tail++){
  audio_queue_init(&q);recording_pipeline_init(&p);calls=0;total=0;
  for(unsigned i=0;i<156;i++){
   assert(audio_queue_push(&q,block));assert(recording_pipeline_service(&p,&q,sink,0));
  }
  assert(audio_queue_push_samples(&q,block,tail));
  assert(recording_pipeline_finish(&p,&q,sink,0));
  assert(total==156*1024+tail && p.committed_samples==total);
 }
 audio_queue_init(&q);recording_pipeline_init(&p);fail=true;
 assert(audio_queue_push(&q,block));assert(recording_pipeline_service(&p,&q,sink,0));
 assert(!recording_pipeline_finish(&p,&q,sink,0));assert(p.failed&&p.committed_samples==0);
}
