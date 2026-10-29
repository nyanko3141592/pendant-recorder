#include "recording_store.h"
static bool permitted(recording_store *s){
 return s->owner && (owner_device_can_access(s->owner)||owner_device_can_finalize(s->owner));
}
static bool random_bytes(void *ctx,uint8_t *out,size_t bytes){
 recording_store *s=ctx;return permitted(s)&&s->rng(s->rng_ctx,out,bytes);
}
static bool ciphertext(void *ctx,const uint8_t *data,size_t bytes){
 recording_store *s=ctx;return permitted(s)&&s->write(s->io_ctx,data,bytes);
}
bool recording_store_save(void *ctx,const uint8_t *wav,size_t bytes,uint32_t samples){
 recording_store *s=ctx;
 if(!s || s->active)return false;
 if(s->failed || !s->recipient_provisioned || !wav || !bytes || !samples ||
    !permitted(s) || !s->rng || !s->begin || !s->write || !s->commit || !s->abort){
  s->failed=true;return false;
 }
 s->active=true;
 bool opened=s->begin(s->io_ctx);
 bool ok=opened && permitted(s) && age_write_recording(s->recipient,wav,bytes,random_bytes,ciphertext,s);
 if(ok)ok=permitted(s)&&s->commit(s->io_ctx);
 if(!ok){
  /* begin may have created an incomplete file even if it reports failure. */
  s->abort(s->io_ctx);s->failed=true;
 }
 s->active=false;return ok;
}
