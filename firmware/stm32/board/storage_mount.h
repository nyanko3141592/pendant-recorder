#ifndef PENDANT_STORAGE_MOUNT_H
#define PENDANT_STORAGE_MOUNT_H
#include "storage_probe.h"
#include "storage_handoff.h"
/* Single main-task filesystem owner; disk already powered/probed, no open
 * handles and no registered volume. fs/recording/handoff remain alive while
 * mounted. Allowed at startup or after HOST_RELEASED, never merely disconnect.
 * No formatting, deletion or repair. This is not a FAT consistency checker.
 * Success does NOT emit RECOVERY_OK: caller must finish other recovery gates.
 * free_bytes is a snapshot, not a recording-time or usable-capacity guarantee. */
bool storage_mount_recordings(board_storage *disk,FATFS *fs,fatfs_recording *recording,
                              storage_handoff *handoff,uint64_t *free_bytes);
#endif
