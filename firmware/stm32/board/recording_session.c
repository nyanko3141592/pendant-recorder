#include "recording_session.h"
static bool valid(const recording_session *s){
 return s&&s->store&&s->filesystem&&s->store->owner&&
 s->store->owner==s->filesystem->owner&&s->filesystem->mounted&&
 s->filesystem->recording&&s->store->io_ctx==s->filesystem->recording&&
 s->store->begin==fatfs_recording_begin&&s->store->write==fatfs_recording_write&&
 s->store->commit==fatfs_recording_commit&&s->store->abort==fatfs_recording_abort;
}
static bool stop(void *ctx){
 recording_session *s=ctx;
 return s->stop_and_drain&&s->stop_and_drain(s->capture_ctx);
}
static bool save(void *ctx,const uint8_t *wav,size_t bytes,uint32_t samples){
 return recording_store_save(((recording_session *)ctx)->store,wav,bytes,samples);
}
static bool identity(void *ctx,const char *name,const uint8_t *data,size_t bytes){
 return storage_handoff_identity(((recording_session *)ctx)->filesystem,name,data,bytes);
}
static bool unmount(void *ctx){
 return storage_handoff_unmount(((recording_session *)ctx)->filesystem);
}
bool recording_session_service(recording_session *s,recording_pipeline *p,audio_queue *q){
 if(!valid(s)||!p||!q||!owner_device_can_access(s->store->owner))return false;
 if(recording_pipeline_service(p,q,save,s))return true;
 (void)owner_step(s->store->owner,IO_FAILED);return false;
}
unsigned recording_session_handoff(recording_session *s,recording_pipeline *p,audio_queue *q){
 if(!valid(s)){
  if(s&&s->store&&s->store->owner)return owner_step(s->store->owner,IO_FAILED);
  return ACT_REPORT_FAULT;
 }
 const recording_handoff_ops ops={.stop_and_drain=stop,.encrypted_sink=save,
 .write_identity=identity,.sync_and_unmount=unmount,.ctx=s};
 return recording_handoff_finish(s->store->owner,p,q,&ops);
}

bool recording_session_can_start(recording_session *s,recording_pipeline *p,audio_queue *q){
 if(!valid(s)||!p||!q||!owner_device_can_access(s->store->owner))return false;
 return s->store->recipient_provisioned&&s->store->rng&&!s->store->failed&&
 !s->store->active&&!s->filesystem->recording->open&&!s->filesystem->recording->exhausted&&
 !p->failed&&recording_pipeline_empty(p)&&
 !audio_queue_failed(q)&&atomic_load(&q->produced)==atomic_load(&q->consumed);
}
