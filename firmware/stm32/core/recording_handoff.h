#ifndef PENDANT_RECORDING_HANDOFF_H
#define PENDANT_RECORDING_HANDOFF_H
#include "storage_owner.h"
#include "recording_pipeline.h"
typedef struct {
 /* Main task only. True means capture and its IRQ producer are quiescent and
  * every accepted sample, including the residual tail, is in pipeline/queue.
  * Must also succeed as a no-op when acquisition was already stopped. */
 bool (*stop_and_drain)(void *ctx);
 /* Same mandatory encrypted/durable contract as recording_sink. */
 recording_sink encrypted_sink;
 /* Write/replace the root identification file while device owns the FS.
  * Must consume all bytes and close the file; sync_and_unmount persists it.
  * No host-controlled paths: coordinator supplies the fixed root filename. */
 bool (*write_identity)(void *ctx,const char *name,const uint8_t *data,size_t size);
 /* Finish outstanding media writes, CTRL_SYNC, then unmount device FS.
  * True means no device file handles/IO can access the medium afterwards. */
 bool (*sync_and_unmount)(void *ctx);
 void *ctx;
} recording_handoff_ops;
/* Invoke once for ACT_STOP_AND_FLUSH, outside IRQ, serialized with owner events.
 * Hooks may pump USB disconnect events into owner on this same main task.
 * Return owner actions for the USB adapter; does not expose USB hardware itself.
 * Driver hooks must never recursively invoke this coordinator.
 * Missing/failing hooks fault closed. Invalid phase leaves state untouched. */
unsigned recording_handoff_finish(storage_owner *owner,recording_pipeline *pipeline,
                                  audio_queue *queue,const recording_handoff_ops *ops);
#endif
