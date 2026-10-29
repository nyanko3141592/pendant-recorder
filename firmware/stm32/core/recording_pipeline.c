#include "recording_pipeline.h"
#include <string.h>
#ifdef PENDANT_COOPERATIVE_SAVE
void recording_pipeline_init(recording_pipeline *p){cooperative_pipeline_init(p);}
bool recording_pipeline_service(recording_pipeline *p,audio_queue *q,recording_sink s,void *c){return cooperative_pipeline_service(p,q,s,c);}
bool recording_pipeline_finish(recording_pipeline *p,audio_queue *q,recording_sink s,void *c){return cooperative_pipeline_finish(p,q,s,c);}
bool recording_pipeline_empty(const recording_pipeline *p){return !p->saving&&!p->chunks[0].samples&&!p->chunks[1].samples&&p->offset==p->count;}
#else
bool recording_pipeline_empty(const recording_pipeline *p){return !p->chunk.samples&&!p->chunk.pending_count&&p->offset==p->count;}
void recording_pipeline_init(recording_pipeline *p){
 memset(p,0,sizeof(*p));wav_chunk_begin(&p->chunk);
}
static bool commit(recording_pipeline *p,recording_sink sink,void *ctx){
 uint32_t samples=p->chunk.samples;
 if(!samples)return true;
 size_t size=wav_chunk_finish(&p->chunk);
 if(!size || !sink(ctx,p->chunk.bytes,size,samples)){
  p->failed=true;return false;
 }
 p->committed_samples+=samples;
 /* Clear plaintext after durable encrypted storage, including unused padding. */
 volatile uint8_t *wipe=(volatile uint8_t *)&p->chunk;
 for(size_t i=0;i<sizeof(p->chunk);i++)wipe[i]=0;
 wav_chunk_begin(&p->chunk);return true;
}
bool recording_pipeline_service(recording_pipeline *p,audio_queue *q,
                                recording_sink sink,void *ctx){
 if(!sink || p->failed || audio_queue_failed(q)){p->failed=true;return false;}
 for(;;){
  if(p->offset==p->count){
   if(!audio_queue_pop(q,p->block,&p->count)){
    if(audio_queue_failed(q)){p->failed=true;return false;}
    return true;
   }
   p->offset=0;
  }
  size_t added=wav_chunk_append(&p->chunk,p->block+p->offset,p->count-p->offset);
  p->offset+=added;
  if(p->chunk.samples==WAV_CHUNK_SAMPLES){
   if(!commit(p,sink,ctx))return false;
   if(audio_queue_failed(q)){p->failed=true;return false;}
   return true;
  }
  if(!added){p->failed=true;return false;}
 }
}
bool recording_pipeline_finish(recording_pipeline *p,audio_queue *q,
                               recording_sink sink,void *ctx){
 do {
  if(!recording_pipeline_service(p,q,sink,ctx))return false;
 } while(p->offset<p->count || atomic_load(&q->produced)!=atomic_load(&q->consumed));
 return commit(p,sink,ctx);
}

#endif
