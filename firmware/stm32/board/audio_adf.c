#include "audio_adf.h"
#include <string.h>
HAL_StatusTypeDef pendant_audio_configure(MDF_HandleTypeDef *h,
 MDF_FilterConfigTypeDef *f, uint32_t edge) {
 if(!h || !f || (edge!=MDF_BITSTREAM0_RISING && edge!=MDF_BITSTREAM0_FALLING))return HAL_ERROR;
 if(h->State!=HAL_MDF_STATE_RESET && h->State!=HAL_MDF_STATE_READY)return HAL_BUSY;
 RCC_OscInitTypeDef osc={0};
 osc.OscillatorType=RCC_OSCILLATORTYPE_MSIK;
 osc.MSIKState=RCC_MSIK_ON;
 osc.MSIKClockRange=RCC_MSIKRANGE_8; /*3.072MHz, no PLL for microphone clock*/
 if(HAL_RCC_OscConfig(&osc)!=HAL_OK)return HAL_ERROR;
 RCC_PeriphCLKInitTypeDef clocks={0};
 clocks.PeriphClockSelection=RCC_PERIPHCLK_ADF1;
 clocks.Adf1ClockSelection=RCC_ADF1CLKSOURCE_MSIK;
 if(HAL_RCCEx_PeriphCLKConfig(&clocks)!=HAL_OK)return HAL_ERROR;
 __HAL_RCC_GPIOB_CLK_ENABLE();__HAL_RCC_ADF1_CLK_ENABLE();
 GPIO_InitTypeDef gpio={0};gpio.Pin=GPIO_PIN_3|GPIO_PIN_4;
 gpio.Mode=GPIO_MODE_AF_PP;gpio.Pull=GPIO_NOPULL;
 gpio.Speed=GPIO_SPEED_FREQ_LOW;gpio.Alternate=GPIO_AF3_ADF1;
 HAL_GPIO_Init(GPIOB,&gpio);
 h->Instance=ADF1_Filter0;
 h->Init.CommonParam.ProcClockDivider=1;
 h->Init.CommonParam.OutputClock.Activation=ENABLE;
 h->Init.CommonParam.OutputClock.Pins=MDF_OUTPUT_CLOCK_0;
 h->Init.CommonParam.OutputClock.Divider=4;
 h->Init.CommonParam.OutputClock.Trigger.Activation=DISABLE;
 h->Init.SerialInterface.Activation=ENABLE;
 h->Init.SerialInterface.Mode=MDF_SITF_NORMAL_SPI_MODE;
 h->Init.SerialInterface.ClockSource=MDF_SITF_CCK0_SOURCE;
 h->Init.SerialInterface.Threshold=31;
 h->Init.FilterBistream=edge;
 if(HAL_MDF_Init(h)!=HAL_OK)return HAL_ERROR;
 memset(f,0,sizeof(*f));
 f->DataSource=MDF_DATA_SOURCE_BSMX;
 f->CicMode=MDF_ONE_FILTER_SINC4;
 f->DecimationRatio=48;
 f->Gain=0; /* Measurement must establish gain, headroom and passband response. */
 f->ReshapeFilter.Activation=DISABLE;
 f->HighPassFilter.Activation=DISABLE;
 f->SoundActivity.Activation=DISABLE; /* Never discard silence. */
 f->AcquisitionMode=MDF_MODE_ASYNC_CONT;
 f->FifoThreshold=MDF_FIFO_THRESHOLD_NOT_EMPTY;
 return HAL_OK;
}
_Static_assert(3072000U/4U/48U==PENDANT_AUDIO_RATE_HZ,"Audio clock mismatch");
