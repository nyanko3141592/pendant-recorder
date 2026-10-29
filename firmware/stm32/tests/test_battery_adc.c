#include "stm32u5xx_hal.h"
#include "../board/battery_adc.h"
#include <assert.h>
unsigned mock_ipsr,mock_mask,mock_hclk=16000000;
static unsigned step,fail_at,channel,deinits,stops,waited;
static int enabled,cal_ok=1;
static int result(void){return ++step==fail_at?1:0;}
void mock_clock(int on){enabled=on;}
bool board_battery_reference_calibration(uint16_t *p){*p=6666;return cal_ok;}
int HAL_RCCEx_PeriphCLKConfig(RCC_PeriphCLKInitTypeDef *p){assert(p->AdcDacClockSelection==RCC_ADCDACCLKSOURCE_HCLK);return result();}
int HAL_ADC_Init(ADC_HandleTypeDef *p){assert(enabled&&p->Init.ClockPrescaler==ADC_CLOCK_ASYNC_DIV2&&p->Init.Resolution==ADC_RESOLUTION_14B);return result();}
int HAL_ADCEx_Calibration_Start(ADC_HandleTypeDef *p,uint32_t a,uint32_t b){(void)p;(void)a;(void)b;return result();}
int HAL_ADC_ConfigChannel(ADC_HandleTypeDef *p,ADC_ChannelConfTypeDef *c){(void)p;assert(c->SamplingTime==ADC_SAMPLETIME_814CYCLES);channel=c->Channel;return result();}
void HAL_Delay(uint32_t ms){assert(channel==ADC_CHANNEL_VREFINT&&ms==1);waited=1;}
int HAL_ADC_Start(ADC_HandleTypeDef *p){(void)p;if(channel==ADC_CHANNEL_VREFINT)assert(waited);return result();}
int HAL_ADC_PollForConversion(ADC_HandleTypeDef *p,uint32_t t){(void)p;assert(t==5);return result();}
uint32_t HAL_ADC_GetValue(ADC_HandleTypeDef *p){(void)p;return channel==ADC_CHANNEL_6?10922:6666;}
int HAL_ADC_Stop(ADC_HandleTypeDef *p){(void)p;stops++;return result();}
int HAL_ADC_DeInit(ADC_HandleTypeDef *p){(void)p;deinits++;return result();}
int main(void){
 uint16_t mv=123;
 assert(board_battery_measure_mv(&mv)&&mv==4000&&!enabled&&deinits==1&&stops==2);
 unsigned calls=step;assert(calls==12);
 for(unsigned i=1;i<=calls;i++){
  step=deinits=stops=waited=0;fail_at=i;mv=123;
  assert(!board_battery_measure_mv(&mv)&&mv==123&&!enabled);
  assert(deinits==(i==1?0:1));
 }
 fail_at=step=0;mock_ipsr=1;assert(!board_battery_measure_mv(&mv)&&step==0);mock_ipsr=0;
 mock_mask=1;assert(!board_battery_measure_mv(&mv)&&step==0);mock_mask=0;
 mock_hclk=8000000;assert(!board_battery_measure_mv(&mv)&&step==0);mock_hclk=16000000;
 cal_ok=0;assert(!board_battery_measure_mv(&mv)&&step==0);
 assert(!board_battery_measure_mv(0)&&step==0);
 return 0;
}
