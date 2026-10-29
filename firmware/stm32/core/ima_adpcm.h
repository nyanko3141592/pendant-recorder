#ifndef PENDANT_IMA_ADPCM_H
#define PENDANT_IMA_ADPCM_H
#include <stdint.h>
#include <stddef.h>
/* Standard mono IMA WAV block:1024bytes,2041samples. Caller records actual
 * count in WAV fact chunk; last sample pads an incomplete block. No malloc. */
int pendant_ima_block(const int16_t *pcm,size_t count,uint8_t out[1024],int *step_index);
#endif
