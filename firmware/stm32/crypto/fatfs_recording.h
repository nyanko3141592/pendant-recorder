#ifndef PENDANT_FATFS_RECORDING_H
#define PENDANT_FATFS_RECORDING_H
#include "ff.h"
#include <stdbool.h>
#include <stdint.h>
#include <stddef.h>
/* Each profile has a deliberately bounded ciphertext ceiling enforced by
 * write, so unexpected format growth fails closed.  The canonical cooperative
 * profile is ten seconds / 128KiB.  This reduces FAT allocation overhead so
 * thirty hours fits the selected 964MByte managed NAND. */
#ifdef PENDANT_COOPERATIVE_SAVE
#if !defined(WAV_CHUNK_SAMPLES) || WAV_CHUNK_SAMPLES != 160000U
#error Cooperative storage profile requires 160000-sample chunks
#endif
/* Ten-second WAV is about 81KiB; retain age framing margin. */
#define FATFS_RECORDING_MAX_BYTES 131072u
#else
#define FATFS_RECORDING_MAX_BYTES 131072u
#endif
typedef struct {
 FIL file;
 uint32_t next_id;
 uint32_t written_bytes;
 bool open,exhausted;
 /* Latched capacity-screen failure; cleared by recovery/begin, not abort. */
 bool capacity_exhausted;
 char pending[20],final[20];
} fatfs_recording;
/* Caller zero-initializes and calls recover after mount/recovery.
 * Scan legacy root and REC; reserve IDs of files/directories and incomplete TMPs.
 * New files go in REC to avoid the FAT16 fixed-root entry limit. Exclusive device FS access, main task only. No automatic delete.
 * Connect these hooks to recording_store.io_ctx after mount. */
bool fatfs_recording_recover(fatfs_recording *ctx);
bool fatfs_recording_begin(void *ctx);
bool fatfs_recording_write(void *ctx,const uint8_t *data,size_t size);
bool fatfs_recording_commit(void *ctx);
void fatfs_recording_abort(void *ctx);
/* Delete only committed AGE files in an inclusive generated-ID range while
 * device exclusively owns a mounted filesystem. Missing IDs are idempotent;
 * TMP files and non-recorder names are never touched. */
bool fatfs_recording_delete_range(fatfs_recording *ctx,uint32_t first,uint32_t last);
#endif
