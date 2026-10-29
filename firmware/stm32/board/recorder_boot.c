#include "recorder_boot.h"
#include "charge_inhibit.h"
#include "storage_power.h"
#include "storage_diskio.h"
#include <string.h>
static bool failed(recorder_app *a){
 a->failed=true;(void)owner_step(&a->owner,IO_FAILED);
 pendant_audio_fault_stop(&a->audio);
 if(a->handoff.mounted){
  (void)f_mount(NULL,"0:",0);storage_diskio_bind(NULL);a->handoff.mounted=false;
 }
 return false;
}
bool recorder_boot_start(recorder_app *a,const uint8_t recipient[32],uint32_t edge){
 if(!a||a->attempted||__get_IPSR()||__get_PRIMASK())return false;
 a->attempted=true;owner_init(&a->owner,true);board_charge_inhibit_init();
 a->stage=BOOT_KEY;uint8_t any=0;
 if(!recipient)return failed(a);
 for(unsigned i=0;i<32;i++)any|=recipient[i];
 if(!any)return failed(a);
 a->stage=BOOT_CLOCK;
 if(HAL_RCC_GetHCLKFreq()!=16000000U ||
    __HAL_RCC_GET_SYSCLK_SOURCE()!=RCC_SYSCLKSOURCE_STATUS_MSI ||
    __HAL_RCC_GET_FLAG(RCC_FLAG_HSIRDY)!=RESET)return failed(a);
 a->stage=BOOT_RNG;if(!board_rng_init(&a->rng))return failed(a);
 a->stage=BOOT_STORAGE_POWER;if(!board_storage_power_startup())return failed(a);
 a->stage=BOOT_STORAGE_PROBE;if(!board_storage_open(&a->disk,&a->owner))return failed(a);
 a->stage=BOOT_FILESYSTEM;
 if(!storage_mount_recordings(&a->disk,&a->fs,&a->files,&a->handoff,&a->runtime.free_bytes))return failed(a);
 a->store=(recording_store){.owner=&a->owner,.recipient_provisioned=true,
  .rng=board_rng_bytes,.rng_ctx=&a->rng,.begin=fatfs_recording_begin,
  .write=fatfs_recording_write,.commit=fatfs_recording_commit,.abort=fatfs_recording_abort,.io_ctx=&a->files};
 memcpy(a->store.recipient,recipient,32);
 a->session=(recording_session){.store=&a->store,.filesystem=&a->handoff};
 recording_pipeline_init(&a->pipeline);audio_queue_init(&a->queue);
 a->stage=BOOT_AUDIO;if(pendant_audio_configure(&a->audio,&a->filter,edge)!=HAL_OK)return failed(a);
 a->stage=BOOT_DMA;if(pendant_audio_dma_init(&a->audio)!=HAL_OK)return failed(a);
 a->runtime.recording=&a->session;a->runtime.pipeline=&a->pipeline;a->runtime.queue=&a->queue;
 a->runtime.audio=&a->audio;a->runtime.filter=&a->filter;a->runtime.disk=&a->disk;a->runtime.fs=&a->fs;
 a->stage=BOOT_CAPTURE;if(!recorder_runtime_start(&a->runtime))return failed(a);
 a->stage=BOOT_RUNNING;return true;
}
