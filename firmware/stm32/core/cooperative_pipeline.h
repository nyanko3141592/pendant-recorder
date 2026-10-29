#ifndef PENDANT_COOPERATIVE_PIPELINE_H
#define PENDANT_COOPERATIVE_PIPELINE_H
#include "audio_queue.h"
#include "wav_chunk.h"
#include "recording_sink.h"
/* Main-context only. During sink, progress may pump capture but MUST NOT
 * recursively service/finish or access filesystem. Not yet wired to board. */
typedef struct {
 wav_chunk chunks[2];
 int16_t block[AUDIO_BLOCK_SAMPLES];
 size_t offset,count;
 unsigned active;
 bool saving,failed;
 uint64_t committed_samples;
} cooperative_pipeline;
void cooperative_pipeline_init(cooperative_pipeline *p);
bool cooperative_pipeline_pump(cooperative_pipeline *p,audio_queue *q);
bool cooperative_pipeline_service(cooperative_pipeline *p,audio_queue *q,recording_sink sink,void *ctx);
/* Capture must already be stopped and its final DMA tail queued. */
bool cooperative_pipeline_finish(cooperative_pipeline *p,audio_queue *q,recording_sink sink,void *ctx);
#endif
