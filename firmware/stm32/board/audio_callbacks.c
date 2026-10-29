#include "audio_adf.h"
#include "../core/audio_queue.h"
/* Consumer must copy/process queued blocks outside the interrupt. SRAM1
 * retention for the queue is a separate Stop2 integration requirement. */
#ifdef PENDANT_AUDIO_CALLBACK_HOST_TEST
#define CAPTURE_MEMORY __attribute__((aligned(32)))
#else
#define CAPTURE_MEMORY __attribute__((section(".lpbam"),aligned(32)))
#endif
CAPTURE_MEMORY static int16_t capture[2*AUDIO_BLOCK_SAMPLES];
static MDF_HandleTypeDef *owner;
static audio_queue *sink;
/* Only the serialized DMA IRQ touches phase after a stopped bind. */
static bool expect_second;
static bool start_armed;
static atomic_bool stop_requested, boundary_done;
bool pendant_audio_request_boundary_stop(MDF_HandleTypeDef *h){
 if(h!=owner||!sink||audio_queue_failed(sink))return false;
 atomic_store_explicit(&stop_requested,true,memory_order_release);return true;
}
bool pendant_audio_boundary_stopped(MDF_HandleTypeDef *h){
 return h==owner&&sink&&!audio_queue_failed(sink)&&
 atomic_load_explicit(&boundary_done,memory_order_acquire);
}
static void submit(const int16_t *samples){
 if(audio_queue_push(sink,samples)&&atomic_load_explicit(&stop_requested,memory_order_acquire))
  atomic_store_explicit(&boundary_done,true,memory_order_release);
}
static bool accept_half(MDF_HandleTypeDef *h,bool second){
 if(h!=owner||!sink||atomic_load_explicit(&boundary_done,memory_order_acquire))return false;
 if(audio_queue_failed(sink))return false;
 if(second!=expect_second){audio_queue_fail(sink);return false;}
 expect_second=!expect_second;return true;
}
int16_t *pendant_audio_bind_queue(MDF_HandleTypeDef *h,audio_queue *q) {
 if(!h || !q || h->State!=HAL_MDF_STATE_READY)return NULL;
 if(owner&&owner!=h&&owner->State!=HAL_MDF_STATE_READY)return NULL;
 owner=h;sink=q;expect_second=false;start_armed=true;
 atomic_init(&stop_requested,false);atomic_init(&boundary_done,false);
 audio_queue_init(q);return capture;
}
void HAL_MDF_AcqHalfCpltCallback(MDF_HandleTypeDef *h) {
 if(accept_half(h,false))submit(capture);
}
void HAL_MDF_AcqCpltCallback(MDF_HandleTypeDef *h) {
 if(accept_half(h,true))submit(capture+AUDIO_BLOCK_SAMPLES);
}
void HAL_MDF_ErrorCallback(MDF_HandleTypeDef *h) {
 if(h==owner && sink)audio_queue_fail(sink);
}
/* Boundary stop deliberately records through the next complete 64ms half.
 * After acknowledgment, later DMA samples are outside the recording interval.
 * Main must still physically stop DMA/IRQs before finalizing the pipeline. */

/* Main only, while stopped. A bind is consumed even if hardware start fails;
 * a retry must explicitly rebind/reset after reviewing the failure. */
bool pendant_audio_claim_buffer(MDF_HandleTypeDef *h,int16_t *buffer,uint32_t samples){
 if(h!=owner||!sink||!start_armed||h->State!=HAL_MDF_STATE_READY||
    buffer!=capture||samples!=2*AUDIO_BLOCK_SAMPLES||audio_queue_failed(sink))return false;
 start_armed=false;return true;
}
