#ifndef PENDANT_RECORDER_BOOT_H
#define PENDANT_RECORDER_BOOT_H
#include "recorder_runtime.h"
#include "rng_board.h"
typedef enum {
 BOOT_NEW,BOOT_CLOCK,BOOT_KEY,BOOT_RNG,BOOT_STORAGE_POWER,BOOT_STORAGE_PROBE,
 BOOT_FILESYSTEM,BOOT_AUDIO,BOOT_DMA,BOOT_CAPTURE,BOOT_RUNNING
} recorder_boot_stage;
typedef struct {
 storage_owner owner;
 recording_pipeline pipeline;
 audio_queue queue;
 FATFS fs;
 fatfs_recording files;
 recording_store store;
 board_storage disk;
 storage_handoff handoff;
 recording_session session;
 pendant_rng rng;
 MDF_HandleTypeDef audio;
 MDF_FilterConfigTypeDef filter;
 recorder_runtime runtime;
 recorder_boot_stage stage;
 bool attempted,failed;
} recorder_app;
/* Zero-initialized static lifetime object, once per hardware reset. Caller has
 * called HAL_Init and configured qualified CPU/rail/flash clocks with live tick.
 * recipient is the provisioned public X25519 key (never a private key), decoded
 * and validated by provisioning. No filesystem is formatted and charge stays
 * inhibited. No other audio/storage/RNG/USB client may be active. */
bool recorder_boot_start(recorder_app *app,const uint8_t recipient[32],uint32_t pdm_edge);
#endif
