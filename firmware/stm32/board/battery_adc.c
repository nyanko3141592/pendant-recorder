#include "stm32u5xx_hal.h"
#include "battery_adc.h"
#include "battery_io.h"
#include "battery_voltage.h"
_Static_assert(LL_ADC_DELAY_VREFINT_STAB_US<=1000,"Revisit VREFINT delay for SDK change");
static bool conversion(ADC_HandleTypeDef *adc,uint32_t channel,uint16_t *value){
 ADC_ChannelConfTypeDef c={0};
 c.Channel=channel;c.Rank=ADC_REGULAR_RANK_1;
 c.SamplingTime=ADC_SAMPLETIME_814CYCLES;c.SingleDiff=ADC_SINGLE_ENDED;
 c.OffsetNumber=ADC_OFFSET_NONE;
 if(HAL_ADC_ConfigChannel(adc,&c)!=HAL_OK)return false;
 /* ConfigChannel enables VREFINT but HAL does not wait for stabilization.
  * HAL tick delay1ms exceeds pinned LL5us requirement. IRQs remain enabled. */
 if(channel==ADC_CHANNEL_VREFINT)HAL_Delay(1);
 if(HAL_ADC_Start(adc)!=HAL_OK)return false;
 bool ok=HAL_ADC_PollForConversion(adc,5)==HAL_OK;
 uint32_t raw=ok?HAL_ADC_GetValue(adc):0;
 if(HAL_ADC_Stop(adc)!=HAL_OK)ok=false;
 if(!ok||raw>=16383)return false;
 *value=(uint16_t)raw;return true;
}
bool board_battery_measure_mv(uint16_t *mv){
 if(!mv||__get_IPSR()||__get_PRIMASK()||HAL_RCC_GetHCLKFreq()!=16000000)return false;
 uint16_t cal,bat,ref,result;
 if(!board_battery_reference_calibration(&cal))return false;
 /* This candidate owns ADC12 exclusively. Never call alongside another ADC. */
 RCC_PeriphCLKInitTypeDef clock={0};
 clock.PeriphClockSelection=RCC_PERIPHCLK_ADCDAC;
 clock.AdcDacClockSelection=RCC_ADCDACCLKSOURCE_HCLK;
 if(HAL_RCCEx_PeriphCLKConfig(&clock)!=HAL_OK)return false;
 __HAL_RCC_ADC12_CLK_ENABLE();
 ADC_HandleTypeDef adc={0};adc.Instance=ADC1;
 adc.Init.ClockPrescaler=ADC_CLOCK_ASYNC_DIV2;
 adc.Init.Resolution=ADC_RESOLUTION_14B;adc.Init.DataAlign=ADC_DATAALIGN_RIGHT;
 adc.Init.ScanConvMode=ADC_SCAN_DISABLE;adc.Init.EOCSelection=ADC_EOC_SINGLE_CONV;
 adc.Init.NbrOfConversion=1;adc.Init.ExternalTrigConv=ADC_SOFTWARE_START;
 adc.Init.ExternalTrigConvEdge=ADC_EXTERNALTRIGCONVEDGE_NONE;
 adc.Init.ConversionDataManagement=ADC_CONVERSIONDATA_DR;
 adc.Init.Overrun=ADC_OVR_DATA_PRESERVED;
 bool ok=HAL_ADC_Init(&adc)==HAL_OK;
 if(ok)ok=HAL_ADCEx_Calibration_Start(&adc,ADC_CALIB_OFFSET,ADC_SINGLE_ENDED)==HAL_OK;
 /* One PA1 acquisition before switching to VREFINT avoids repeated charge
  * sharing on the high-impedance divider. Calibration/settling needs bench data. */
 if(ok)ok=conversion(&adc,ADC_CHANNEL_6,&bat);
 if(ok)ok=conversion(&adc,ADC_CHANNEL_VREFINT,&ref);
 if(ok)ok=battery_voltage_mv(bat,ref,cal,&result);
 if(HAL_ADC_DeInit(&adc)!=HAL_OK)ok=false;
 __HAL_RCC_ADC12_CLK_DISABLE();
 if(ok)*mv=result;
 return ok;
}
