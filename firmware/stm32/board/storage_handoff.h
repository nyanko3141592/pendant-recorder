#ifndef PENDANT_STORAGE_HANDOFF_H
#define PENDANT_STORAGE_HANDOFF_H
#include "../crypto/fatfs_recording.h"
#include "../core/storage_owner.h"
typedef struct {
 storage_owner *owner;
 fatfs_recording *recording;
 bool mounted;
} storage_handoff;
/* Main task only, sole filesystem client. Caller guarantees there are no other
 * open handles. Set mounted only after successful f_mount; rebind diskio before
 * recovery mount. These operations require DRAINING, never HOST access. */
bool storage_handoff_identity(void *ctx,const char *name,const uint8_t *data,size_t size);
bool storage_handoff_unmount(void *ctx);
#endif
