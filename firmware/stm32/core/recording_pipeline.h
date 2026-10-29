#ifndef PENDANT_RECORDING_PIPELINE_H
#define PENDANT_RECORDING_PIPELINE_H
#include "audio_queue.h"
#include "wav_chunk.h"
/* Synchronous consumer. The sink MUST encrypt using standard age v1 before
 * writing storage and return true only after successful close/CTRL_SYNC.
 * Plaintext is borrowed RAM, valid only during the callback. DMA may continue
 * pushing the separate PCM queue while the sink runs. Never call in an ISR. */
#include "recording_sink.h"
#ifdef PENDANT_COOPERATIVE_SAVE
#include "cooperative_pipeline.h"
typedef cooperative_pipeline recording_pipeline;
#else
typedef struct {
 wav_chunk chunk;
 int16_t block[AUDIO_BLOCK_SAMPLES];
 size_t offset,count;
 bool failed;
 uint64_t committed_samples;
} recording_pipeline;
#endif
bool recording_pipeline_empty(const recording_pipeline *p);
void recording_pipeline_init(recording_pipeline *p);
/* Consume queued blocks, yield after one committed10second file or empty queue.
 * Return false on any queue/sink error; fault is sticky until stopped/reinit. */
bool recording_pipeline_service(recording_pipeline *p,audio_queue *q,
                                recording_sink sink,void *ctx);
/* Only after capture is stopped and all DMA samples (including partial tail)
 * have been delivered/drained. Does not stop DMA or establish that barrier. */
bool recording_pipeline_finish(recording_pipeline *p,audio_queue *q,
                               recording_sink sink,void *ctx);
#endif
