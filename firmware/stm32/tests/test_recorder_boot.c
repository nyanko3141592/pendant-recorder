#include "../board/recorder_boot.h"
#include <assert.h>
#include <string.h>
static recorder_app app;
static recorder_boot_stage failure;
static unsigned inhibited,unmounted,cleared;
RCC_TypeDef test_rcc;
unsigned __get_IPSR(void){return 0;}
unsigned __get_PRIMASK(void){return 0;}
static bool pass(recorder_boot_stage stage){assert(app.stage==stage);return failure!=stage;}
void board_charge_inhibit_init(void){inhibited++;}
uint32_t HAL_RCC_GetHCLKFreq(void){return pass(BOOT_CLOCK)?16000000U:8000000U;}
bool board_rng_init(pendant_rng *r){assert(r==&app.rng);return pass(BOOT_RNG);}
bool board_storage_power_startup(void){return pass(BOOT_STORAGE_POWER);}
bool board_storage_open(board_storage *d,storage_owner *o){assert(d==&app.disk&&o==&app.owner);d->owner=o;d->ready=true;return pass(BOOT_STORAGE_PROBE);}
bool storage_mount_recordings(board_storage *d,FATFS *fs,fatfs_recording *files,storage_handoff *h,uint64_t *bytes){
 assert(d==&app.disk&&fs==&app.fs&&files==&app.files);if(!pass(BOOT_FILESYSTEM))return false;
 *h=(storage_handoff){.owner=&app.owner,.recording=files,.mounted=true};*bytes=999;return true;
}
HAL_StatusTypeDef pendant_audio_configure(MDF_HandleTypeDef *h,MDF_FilterConfigTypeDef *f,uint32_t edge){assert(h==&app.audio&&f==&app.filter&&edge==42);return pass(BOOT_AUDIO)?HAL_OK:HAL_ERROR;}
HAL_StatusTypeDef pendant_audio_dma_init(MDF_HandleTypeDef *h){assert(h==&app.audio);return pass(BOOT_DMA)?HAL_OK:HAL_ERROR;}
void pendant_audio_fault_stop(MDF_HandleTypeDef *h){assert(h==&app.audio);}
bool recorder_runtime_start(recorder_runtime *r){
 assert(r==&app.runtime&&r->recording==&app.session&&r->pipeline==&app.pipeline&&r->queue==&app.queue);
 assert(r->audio==&app.audio&&r->disk==&app.disk&&r->fs==&app.fs&&r->free_bytes==999);
 assert(app.store.rng==board_rng_bytes&&app.store.rng_ctx==&app.rng&&app.store.io_ctx==&app.files);
 assert(app.store.recipient_provisioned&&app.store.recipient[0]==7);
 return pass(BOOT_CAPTURE);
}
void recording_pipeline_init(recording_pipeline *p){assert(p==&app.pipeline);}
void audio_queue_init(audio_queue *q){assert(q==&app.queue);}
bool board_rng_bytes(void *ctx,uint8_t *out,size_t n){(void)ctx;(void)out;(void)n;return false;}
bool fatfs_recording_begin(void *c){(void)c;return false;}
bool fatfs_recording_write(void *c,const uint8_t *p,size_t n){(void)c;(void)p;(void)n;return false;}
bool fatfs_recording_commit(void *c){(void)c;return false;}
void fatfs_recording_abort(void *c){(void)c;}
FRESULT f_mount(FATFS *fs,const TCHAR *path,BYTE opt){assert(!fs&&!strcmp(path,"0:")&&!opt);unmounted++;return FR_OK;}
void storage_diskio_bind(board_storage *d){assert(!d);cleared++;}
int main(void){
 uint8_t key[32]={7};
 for(unsigned stage=BOOT_CLOCK;stage<=BOOT_RUNNING;stage++){
  if(stage==BOOT_KEY)continue;
  memset(&app,0,sizeof(app));inhibited=unmounted=cleared=0;failure=(recorder_boot_stage)stage;
  bool ok=recorder_boot_start(&app,key,42);assert(ok==(stage==BOOT_RUNNING));
  assert(inhibited==1&&app.stage==stage&&app.failed==!ok);
  if(!ok)assert(app.owner.fault_pending);
  if(stage>=BOOT_AUDIO&&stage<BOOT_RUNNING)assert(unmounted==1&&cleared==1&&!app.handoff.mounted);
  assert(!recorder_boot_start(&app,key,42)&&inhibited==1);
 }
 memset(&app,0,sizeof(app));memset(key,0,sizeof(key));
 assert(!recorder_boot_start(&app,key,42)&&app.stage==BOOT_KEY&&app.failed);
 return 0;
}
