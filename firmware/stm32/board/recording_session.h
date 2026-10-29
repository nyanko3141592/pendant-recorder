#ifndef PENDANT_RECORDING_SESSION_H
#define PENDANT_RECORDING_SESSION_H
#include "storage_handoff.h"
#include "../crypto/recording_store.h"
#include "../core/recording_handoff.h"
/* Main-task-only wiring for recording and USB handoff. All members must outlive
 * calls. Capture hook establishes the real DMA/IRQ stop barrier; this adapter
 * cannot establish it on behalf of the board driver. */
typedef struct {
 recording_store *store;
 storage_handoff *filesystem;
 bool (*stop_and_drain)(void *ctx);
 void *capture_ctx;
} recording_session;
/* Pipeline/queue must already be initialized. Refuses pending or failed audio;
 * does not reset either object or erase cumulative committed sample counts. */
bool recording_session_can_start(recording_session *s,recording_pipeline *p,audio_queue *q);
bool recording_session_service(recording_session *s,recording_pipeline *p,audio_queue *q);
unsigned recording_session_handoff(recording_session *s,recording_pipeline *p,audio_queue *q);
#endif
