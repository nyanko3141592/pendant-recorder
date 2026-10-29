#ifndef PENDANT_WAV_CHUNK_H
#define PENDANT_WAV_CHUNK_H
#include "ima_adpcm.h"
#include <stdbool.h>
#ifndef WAV_CHUNK_SAMPLES
#define WAV_CHUNK_SAMPLES 160000U
#endif
#define WAV_CHUNK_BYTES (60U+((WAV_CHUNK_SAMPLES+2040U)/2041U)*1024U)
/* Plaintext RAM only. Never pass this buffer to a disk writer; encrypt into
 * standard age v1 before storage. The pipeline uses one instance plus a PCM backlog queue while encrypting. */
typedef struct {
 uint8_t bytes[WAV_CHUNK_BYTES];
 int16_t pending[2041];
 uint32_t samples,blocks,pending_count;
 int index;
 bool closed;
} wav_chunk;
void wav_chunk_begin(wav_chunk *c);
size_t wav_chunk_append(wav_chunk *c,const int16_t *pcm,size_t count);
size_t wav_chunk_finish(wav_chunk *c);
#endif
