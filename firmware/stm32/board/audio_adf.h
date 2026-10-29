#ifndef PENDANT_AUDIO_ADF_H
#define PENDANT_AUDIO_ADF_H
#include "stm32u5xx_hal.h"
#define PENDANT_AUDIO_RATE_HZ 16000U
#define PENDANT_MIC_CLOCK_HZ 768000U
/* Configure only while capture is stopped. DMA must be configured and linked
 * by the acquisition driver before starting. Edge/gain require mic bench check. */
HAL_StatusTypeDef pendant_audio_configure(MDF_HandleTypeDef *handle,
 MDF_FilterConfigTypeDef *filter, uint32_t sampling_edge);
HAL_StatusTypeDef pendant_audio_dma_init(MDF_HandleTypeDef *handle);
/* Requires the exact buffer returned by a fresh bind, exactly2048 samples.
 * Every start attempt consumes that bind; after failure/stop bind again. */
HAL_StatusTypeDef pendant_audio_dma_start(MDF_HandleTypeDef *handle, const MDF_FilterConfigTypeDef *filter, int16_t *buffer, uint32_t samples);
HAL_StatusTypeDef pendant_audio_dma_stop(MDF_HandleTypeDef *handle);
#include "../core/audio_queue.h"
/* Returned DMA buffer has2*AUDIO_BLOCK_SAMPLES samples. Bind only stopped. */
int16_t *pendant_audio_bind_queue(MDF_HandleTypeDef *handle,audio_queue *queue);
/* Main-task request, then poll acknowledgment. Bind resets both flags.
 * Acquires the next complete half, never discards a pre-request partial half. */
bool pendant_audio_request_boundary_stop(MDF_HandleTypeDef *handle);
bool pendant_audio_boundary_stopped(MDF_HandleTypeDef *handle);
/* recording_session stop hook: ctx is MDF_HandleTypeDef*. Main task only,
 * interrupts/tick enabled; capture must use the bound 2048-sample buffer.
 * Rebind before every new acquisition. Typical boundary wait <=64ms. */
bool pendant_audio_stop_and_drain(void *ctx);
bool pendant_audio_dma_owns(MDF_HandleTypeDef *handle);
/* Fault-only shutdown request; discards uncertain samples, never a successful
 * recording stop. Leaves ERROR state; explicit reset/reinitialization required. */
void pendant_audio_fault_stop(MDF_HandleTypeDef *handle);
/* Internal DMA start guard: exact bound buffer/size, once per stopped bind. */
bool pendant_audio_claim_buffer(MDF_HandleTypeDef *handle,int16_t *buffer,uint32_t samples);
/* Terminal shutdown after capture stop/drain; reset required to restart. */
bool pendant_audio_shutdown(MDF_HandleTypeDef *handle);
#endif
