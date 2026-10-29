#include "../core/cooperative_pipeline.h"
#include <assert.h>
#include <string.h>
#include <stdio.h>
static cooperative_pipeline p;
static audio_queue q;
static wav_chunk expected;
static int16_t block[AUDIO_BLOCK_SAMPLES],reference[AUDIO_BLOCK_SAMPLES];
static uint64_t produced,stored;
static unsigned inject;
static bool should_fail;
static uint32_t hash(const uint8_t *s,size_t n){uint32_t h=2166136261U;while(n--)h=(h^*s++)*16777619U;return h;}
static void produce(void){
 for(unsigned i=0;i<AUDIO_BLOCK_SAMPLES;i++)block[i]=(int16_t)((produced+i)%30000);
 (void)audio_queue_push(&q,block);produced+=AUDIO_BLOCK_SAMPLES;
}
static bool sink(void *ctx,const uint8_t *data,size_t bytes,uint32_t samples){
 (void)ctx;wav_chunk_begin(&expected);
 for(uint32_t pos=0;pos<samples;){
  size_t n=samples-pos;if(n>AUDIO_BLOCK_SAMPLES)n=AUDIO_BLOCK_SAMPLES;
  for(size_t i=0;i<n;i++)reference[i]=(int16_t)((stored+pos+i)%30000);
  assert(wav_chunk_append(&expected,reference,n)==n);pos+=(uint32_t)n;
 }
 assert(wav_chunk_finish(&expected)==bytes);assert(!memcmp(expected.bytes,data,bytes));
 uint32_t before=hash(data,bytes);unsigned count=inject;inject=0;
 for(unsigned i=0;i<count;i++){
  produce();bool ok=cooperative_pipeline_pump(&p,&q);
  if(!ok)assert(should_fail);
  assert(hash(data,bytes)==before); /* Saving buffer remains immutable. */
 }
 stored+=samples;return true;
}
static void run(unsigned delayed_blocks,bool fail){
 cooperative_pipeline_init(&p);audio_queue_init(&q);produced=stored=0;
 inject=delayed_blocks;should_fail=fail;
 unsigned initial=(WAV_CHUNK_SAMPLES+AUDIO_BLOCK_SAMPLES-1)/AUDIO_BLOCK_SAMPLES;
 for(unsigned i=0;i<initial;i++){
  produce();bool ok=cooperative_pipeline_service(&p,&q,sink,0);
  if(i+1==initial)assert(ok!=fail);else assert(ok);
 }
 if(fail){assert(p.failed&&audio_queue_failed(&q));assert(!cooperative_pipeline_finish(&p,&q,sink,0));}
 else{assert(cooperative_pipeline_finish(&p,&q,sink,0));assert(stored==produced&&p.committed_samples==produced);}
 printf("cooperative %u delayed DMA blocks: %s\n",delayed_blocks,fail?"explicit bounded-capacity failure":"ordered samples preserved");
}
int main(void){run(19,false);run(70,false);run(98,true);}
