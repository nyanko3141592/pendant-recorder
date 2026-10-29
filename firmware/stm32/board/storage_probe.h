#ifndef PENDANT_STORAGE_PROBE_H
#define PENDANT_STORAGE_PROBE_H
#include "../core/storage_owner.h"
#include <stdint.h>
#include "../core/sd_init.h"
typedef struct {
 storage_owner *owner; sd_card_info info; bool ready;
 /* Optional read-only supply guard, installed before probe and retained on
  * reopen. Must not perform IO or change owner. Checked at each SPI chunk.
  * NULL is used for ordinary battery-powered recording. */
 bool (*io_power_good)(void);
 /* Main-task capture pump only: no storage, RNG, USB or owner mutation. */
 bool (*progress)(void *ctx);
 void *progress_ctx;
 bool progress_active,progress_failed;
} board_storage;
/* Bind only outside active IO; NULL disables. Probe/reopen clears the hook. */
void board_storage_set_progress(board_storage *d,bool (*pump)(void *),void *ctx);
/* Device object must be zero-initialized before its first call.
 * Initial powered-media probe or explicit reinitialization after bus release.
 * Main task only, not concurrently with IRQ-driven MSC or storage operations.
 * Caller guarantees stable SD_V3, HSI ready and active HAL tick.
 * USB event handlers must enqueue events, not mutate owner during this call.
 * Failure faults owner; capacity output remains unchanged. No formatting. */
bool board_storage_open(board_storage *device,storage_owner *owner);
bool board_storage_read(board_storage *device,uint64_t lba,uint8_t out[512]);
bool board_storage_write(board_storage *device,uint64_t lba,const uint8_t data[512]);
/* MSC block backend: main-task serialized only, never call from USB IRQ.
 * Requires completed device release; no FatFs access in this ownership phase.
 * On failure ready becomes false and owner requires MSC revocation. */
bool board_storage_host_read(board_storage *device,uint64_t lba,uint8_t out[512]);
bool board_storage_host_write(board_storage *device,uint64_t lba,const uint8_t data[512]);
#endif
