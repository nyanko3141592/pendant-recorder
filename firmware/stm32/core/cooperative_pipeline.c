#include "cooperative_pipeline.h"
#include <string.h>
void cooperative_pipeline_init(cooperative_pipeline *p){memset(p,0,sizeof(*p));}
bool cooperative_pipeline_pump(cooperative_pipeline *p,audio_queue *q){
 if(p->failed||audio_queue_failed(q)){p->failed=true;return false;}
 wav_chunk *c=&p->chunks[p->active];
 while(c->samples<WAV_CHUNK_SAMPLES){
  if(p->offset==p->count){
   if(!audio_queue_pop(q,p->block,&p->count))break;
   p->offset=0;
  }
  size_t n=wav_chunk_append(c,p->block+p->offset,p->count-p->offset);
  if(!n){p->failed=true;return false;}p->offset+=n;
 }
 if(audio_queue_failed(q)){p->failed=true;return false;}
 return true; /* Full staging chunk leaves residual PCM queued, never overwrites. */
}
static bool save(cooperative_pipeline *p,audio_queue *q,recording_sink sink,void *ctx){
 if(p->saving||!sink){p->failed=true;return false;}
 unsigned frozen=p->active;wav_chunk *c=&p->chunks[frozen];
 if(!c->samples)return true;
 uint32_t samples=c->samples;size_t bytes=wav_chunk_finish(c);
 if(!bytes){p->failed=true;return false;}
 p->active^=1U;p->saving=true;
 bool ok=sink(ctx,c->bytes,bytes,samples);
 p->saving=false;
 if(ok)p->committed_samples+=samples;
 volatile uint8_t *wipe=(volatile uint8_t *)c;
 for(size_t i=0;i<sizeof(*c);i++)wipe[i]=0;
 if(!ok||p->failed||audio_queue_failed(q)){p->failed=true;return false;}
 return true;
}
bool cooperative_pipeline_service(cooperative_pipeline *p,audio_queue *q,recording_sink sink,void *ctx){
 if(p->saving||!sink){p->failed=true;return false;}
 if(!cooperative_pipeline_pump(p,q))return false;
 return p->chunks[p->active].samples<WAV_CHUNK_SAMPLES||save(p,q,sink,ctx);
}
bool cooperative_pipeline_finish(cooperative_pipeline *p,audio_queue *q,recording_sink sink,void *ctx){
 do{if(!cooperative_pipeline_service(p,q,sink,ctx))return false;}
 while(p->offset<p->count||atomic_load(&q->produced)!=atomic_load(&q->consumed));
 return save(p,q,sink,ctx);
}
