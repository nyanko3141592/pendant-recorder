#include "audio_adf.h"

bool pendant_audio_stop_and_drain(void *ctx){
 MDF_HandleTypeDef *h=ctx;
 if(!h||!pendant_audio_dma_owns(h)||__get_IPSR()||__get_PRIMASK())return false;
 if(h->State==HAL_MDF_STATE_READY)return pendant_audio_boundary_stopped(h);
 if(h->State!=HAL_MDF_STATE_ACQUISITION)return false;
 if(!pendant_audio_request_boundary_stop(h)){pendant_audio_fault_stop(h);return false;}
 uint32_t start=HAL_GetTick();
 while(!pendant_audio_boundary_stopped(h)){
  if((uint32_t)(HAL_GetTick()-start)>=150U)break;
  __WFI();
 }
 /* Queue producer is disabled before main consumes/finalizes its final half.
  * HAL abort may clear residual DMA state; those post-boundary samples are
  * deliberately outside the accepted recording interval. */
 HAL_NVIC_DisableIRQ(LPDMA1_Channel0_IRQn);
 bool accepted=pendant_audio_boundary_stopped(h);
 HAL_StatusTypeDef result=pendant_audio_dma_stop(h);
 HAL_NVIC_ClearPendingIRQ(LPDMA1_Channel0_IRQn);
 bool ok=accepted&&result==HAL_OK&&pendant_audio_boundary_stopped(h);
 if(!ok)pendant_audio_fault_stop(h);
 return ok;
}
