/* Deterministic DMA-arrival simulation during successful synchronous storage.
 * Not a card timing measurement. No sleeps or wall-clock scheduling dependency. */
#include "../core/recording_pipeline.h"
#include <assert.h>
#include <stdio.h>
static audio_queue q;
static recording_pipeline p;
static int16_t block[AUDIO_BLOCK_SAMPLES];
static unsigned waits, now_ms, next_dma_ms;
static bool slow_success(void *ctx,const uint8_t *wav,size_t bytes,uint32_t samples){
 (void)ctx;(void)wav;(void)bytes;assert(samples==160000);
 for(unsigned sector=0;sector<waits;sector++){
  unsigned end=now_ms+400; /* Each successful sector is below 500ms timeout. */
  while(next_dma_ms<=end){
   (void)audio_queue_push(&q,block);next_dma_ms+=64;
  }
  now_ms=end;
 }
 return true;
}
static void scenario(unsigned sectors,unsigned initial_backlog,bool success){
 audio_queue_init(&q);recording_pipeline_init(&p);
 waits=sectors;now_ms=0;next_dma_ms=1; /* Conservative DMA phase. */
 for(unsigned i=0;i<156;i++){
  assert(audio_queue_push(&q,block));
  assert(recording_pipeline_service(&p,&q,slow_success,0));
 }
 assert(audio_queue_push(&q,block));
 for(unsigned i=0;i<initial_backlog;i++)assert(audio_queue_push(&q,block));
 assert(recording_pipeline_service(&p,&q,slow_success,0)==success);
 assert(audio_queue_failed(&q)==!success);
 assert(p.failed==!success);
 assert(p.committed_samples==160000); /* Saved prefix is intact even on overrun. */
 if(!success)assert(!recording_pipeline_service(&p,&q,slow_success,0));
 printf("%u x 400ms, backlog %u blocks: %s, high-water %u\n",sectors,initial_backlog,success?"survives":"explicit overrun",audio_queue_high_water(&q));
}
int main(void){scenario(2,0,true);scenario(3,0,false);scenario(2,4,false);}
