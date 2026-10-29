#include "audio_adf.h"

bool pendant_audio_shutdown(MDF_HandleTypeDef *h){
 if(!h||h->Instance!=ADF1_Filter0||h->State!=HAL_MDF_STATE_READY||
    __get_IPSR()||__get_PRIMASK()||!pendant_audio_boundary_stopped(h))return false;
 /* AcqStop_DMA stops filter/DMA but does not disable CCK generation. */
 if(HAL_MDF_DeInit(h)!=HAL_OK)return false;
 __HAL_RCC_GPIOB_CLK_ENABLE();
 HAL_GPIO_WritePin(GPIOB,GPIO_PIN_3,GPIO_PIN_RESET);
 GPIO_InitTypeDef gpio={0};gpio.Pin=GPIO_PIN_3;
 gpio.Mode=GPIO_MODE_OUTPUT_PP;gpio.Pull=GPIO_NOPULL;gpio.Speed=GPIO_SPEED_FREQ_LOW;
 HAL_GPIO_Init(GPIOB,&gpio); /* IM69D130 clock-off mode requires CLK low. */
 gpio.Pin=GPIO_PIN_4;gpio.Mode=GPIO_MODE_ANALOG;HAL_GPIO_Init(GPIOB,&gpio);
 __HAL_RCC_ADF1_CLK_DISABLE();
 return true;
}
