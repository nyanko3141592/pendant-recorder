#include "../board/audio_adf.h"
#include <assert.h>
void HAL_MDF_AcqHalfCpltCallback(MDF_HandleTypeDef *h);
void HAL_MDF_AcqCpltCallback(MDF_HandleTypeDef *h);
void HAL_MDF_ErrorCallback(MDF_HandleTypeDef *h);
static audio_queue q;
int main(void){
 MDF_HandleTypeDef h={.State=HAL_MDF_STATE_READY},other={.State=HAL_MDF_STATE_READY};
 int16_t *buf=pendant_audio_bind_queue(&h,&q),out[AUDIO_BLOCK_SAMPLES];size_t n;
 assert(buf);for(unsigned i=0;i<2*AUDIO_BLOCK_SAMPLES;i++)buf[i]=(int16_t)i;
 HAL_MDF_AcqCpltCallback(&other);assert(!audio_queue_failed(&q));
 HAL_MDF_AcqHalfCpltCallback(&h);HAL_MDF_AcqCpltCallback(&h);
 assert(audio_queue_pop(&q,out,&n)&&n==AUDIO_BLOCK_SAMPLES&&out[0]==0);
 assert(audio_queue_pop(&q,out,&n)&&out[0]==AUDIO_BLOCK_SAMPLES);
 HAL_MDF_AcqCpltCallback(&h);assert(audio_queue_failed(&q));
 unsigned count=atomic_load(&q.produced);HAL_MDF_AcqHalfCpltCallback(&h);
 assert(atomic_load(&q.produced)==count);
 assert(pendant_audio_bind_queue(&h,&q));HAL_MDF_AcqHalfCpltCallback(&h);
 HAL_MDF_AcqHalfCpltCallback(&h);assert(audio_queue_failed(&q));
 assert(pendant_audio_bind_queue(&h,&q));HAL_MDF_ErrorCallback(&h);
 HAL_MDF_AcqHalfCpltCallback(&h);assert(audio_queue_failed(&q)&&atomic_load(&q.produced)==0);
 /* Request in first or second half: include exactly the next whole half. */
 for(unsigned second=0;second<2;second++){
  assert(pendant_audio_bind_queue(&h,&q));
  if(second)HAL_MDF_AcqHalfCpltCallback(&h);
  assert(!pendant_audio_request_boundary_stop(&other));
  assert(pendant_audio_request_boundary_stop(&h));
  assert(!pendant_audio_boundary_stopped(&h));
  if(second)HAL_MDF_AcqCpltCallback(&h);else HAL_MDF_AcqHalfCpltCallback(&h);
  assert(pendant_audio_boundary_stopped(&h));
  unsigned accepted=atomic_load(&q.produced);assert(accepted==second+1);
  HAL_MDF_AcqHalfCpltCallback(&h);HAL_MDF_AcqCpltCallback(&h);
  assert(atomic_load(&q.produced)==accepted&&!audio_queue_failed(&q));
  assert(pendant_audio_request_boundary_stop(&h)&&pendant_audio_boundary_stopped(&h));
 }
 /* Queue overflow at the requested boundary must never acknowledge success. */
 assert(pendant_audio_bind_queue(&h,&q));
 for(unsigned i=0;i<AUDIO_QUEUE_BLOCKS;i++){
  if(i%2)HAL_MDF_AcqCpltCallback(&h);else HAL_MDF_AcqHalfCpltCallback(&h);
 }
 assert(pendant_audio_request_boundary_stop(&h));HAL_MDF_AcqHalfCpltCallback(&h);
 assert(audio_queue_failed(&q)&&!pendant_audio_boundary_stopped(&h));
 assert(pendant_audio_bind_queue(&h,&q));
 assert(!pendant_audio_claim_buffer(&other,buf,2*AUDIO_BLOCK_SAMPLES));
 assert(!pendant_audio_claim_buffer(&h,buf+1,2*AUDIO_BLOCK_SAMPLES));
 assert(!pendant_audio_claim_buffer(&h,buf,AUDIO_BLOCK_SAMPLES));
 assert(pendant_audio_claim_buffer(&h,buf,2*AUDIO_BLOCK_SAMPLES));
 assert(!pendant_audio_claim_buffer(&h,buf,2*AUDIO_BLOCK_SAMPLES));
 h.State=HAL_MDF_STATE_ACQUISITION;
 assert(!pendant_audio_bind_queue(&other,&q));
 h.State=HAL_MDF_STATE_READY;
 assert(pendant_audio_bind_queue(&h,&q));
 assert(pendant_audio_claim_buffer(&h,buf,2*AUDIO_BLOCK_SAMPLES));
 h.State=0;assert(!pendant_audio_bind_queue(&h,&q));
 return 0;
}
