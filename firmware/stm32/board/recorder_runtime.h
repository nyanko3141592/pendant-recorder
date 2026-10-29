#ifndef PENDANT_RECORDER_RUNTIME_H
#define PENDANT_RECORDER_RUNTIME_H
#include "recording_capture.h"
#include "storage_mount.h"
#include "../usb/usb_session.h"
typedef struct {
 recording_session *recording;
 recording_pipeline *pipeline;
 audio_queue *queue;
 MDF_HandleTypeDef *audio;
 const MDF_FilterConfigTypeDef *filter;
 board_storage *disk;
 FATFS *fs;
 usb_session usb;
 bool initialized,usb_running,usb_inhibited;
 bool cleanup_pending;
 bool cleanup_button_down,cleanup_release_required;
 uint32_t cleanup_button_since;
 uint32_t cleanup_first,cleanup_last;
 uint64_t free_bytes;
} recorder_runtime;
/* Zero-initialize and supply all pointers, persistent for runtime lifetime.
 * Prerequisites: clocks/rails/mic, ADF/DMA, RNG/key, mounted/recovered filesystem,
 * pipeline/queue initialized. USB not running. Exclusive main task only.
 * This lifecycle module does not provision keys, format storage or enable charge. */
bool recorder_runtime_start(recorder_runtime *r);
/* Call frequently with interrupts/tick enabled; handles one USB event and at
 * most one recording chunk per call. No invocation from callbacks or IRQ. */
bool recorder_runtime_poll(recorder_runtime *r);
/* Controlled terminal stop; main task only. Returns false without touching
 * media if host/recovery owns it. Caller must retry after device ownership.
 * Success means drain/finalize/unmount and USB teardown completed. No restart. */
bool recorder_runtime_stop(recorder_runtime *r);
#endif
