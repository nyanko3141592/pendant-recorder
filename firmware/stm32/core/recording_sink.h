#ifndef PENDANT_RECORDING_SINK_H
#define PENDANT_RECORDING_SINK_H
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
typedef bool (*recording_sink)(void *,const uint8_t *,size_t,uint32_t);
#endif
