#ifndef PENDANT_AUDIO_QUEUE_H
#define PENDANT_AUDIO_QUEUE_H
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
#include <stdatomic.h>
#define AUDIO_BLOCK_SAMPLES 1024U
#define AUDIO_QUEUE_BLOCKS 16U
/* Single ISR producer, single main-task consumer. Initialize only stopped.
 * 64ms blocks, 1024ms backlog capacity at16kHz. Overflow is sticky and fatal to
 * the recording session; the caller must mark a gap, never hide sample loss. */
typedef struct {
 atomic_uint produced,consumed;
 atomic_uint high_water; /* Producer-owned maximum occupancy; diagnostic only. */
 atomic_bool fault;
 size_t valid[AUDIO_QUEUE_BLOCKS];
 int16_t pcm[AUDIO_QUEUE_BLOCKS][AUDIO_BLOCK_SAMPLES];
} audio_queue;
void audio_queue_init(audio_queue *q);
/* Conservative maximum occupancy since stopped-state init; never clears live. */
unsigned audio_queue_high_water(const audio_queue *q);
bool audio_queue_push(audio_queue *q,const int16_t *block);
/* Same single producer; stop DMA/ISR before submitting a residual tail.
 * Count must be 1..1024. No padding is recorded as audio. */
bool audio_queue_push_samples(audio_queue *q,const int16_t *block,size_t count);
bool audio_queue_pop(audio_queue *q,int16_t *block,size_t *count);
void audio_queue_fail(audio_queue *q);
bool audio_queue_failed(audio_queue *q);
#endif
