#include "../board/system_clock.h"
#include "stm32u5xx_hal.h"
#include <assert.h>
#include <stdio.h>
RCC_TypeDef mock_rcc;
unsigned mock_source;
static unsigned scenario,stage;
unsigned __get_IPSR(void){return scenario==1;}
unsigned __get_PRIMASK(void){return scenario==2;}
uint32_t HAL_RCC_GetSysClockFreq(void){return scenario==3?32000000U:4000000U;}
uint32_t HAL_RCC_GetHCLKFreq(void){
 return scenario==7?8000000U:16000000U;
}
HAL_StatusTypeDef HAL_PWREx_ControlVoltageScaling(unsigned scale){
 assert(stage++==0);assert(scale==PWR_REGULATOR_VOLTAGE_SCALE4);
 return scenario==4?HAL_ERROR:HAL_OK;
}
HAL_StatusTypeDef HAL_RCC_OscConfig(RCC_OscInitTypeDef *c){
 assert(stage++==1);
 assert(c->OscillatorType==(RCC_OSCILLATORTYPE_HSI|RCC_OSCILLATORTYPE_MSI));
 assert(c->HSIState==RCC_HSI_OFF&&c->HSICalibrationValue==RCC_HSICALIBRATION_DEFAULT);
 assert(c->MSIState==RCC_MSI_ON&&c->MSICalibrationValue==RCC_MSICALIBRATION_DEFAULT);
 assert(c->MSIClockRange==RCC_MSIRANGE_2);
 if(scenario==5)return HAL_ERROR;
 mock_rcc.CR=RCC_CR_MSISON|RCC_CR_MSISRDY|RCC_CR_MSIKON;
 if(scenario==9)mock_rcc.CR&=~RCC_CR_MSISON;
 if(scenario==10)mock_rcc.CR|=RCC_CR_HSIRDY;
 return HAL_OK;
}
HAL_StatusTypeDef HAL_RCC_ClockConfig(RCC_ClkInitTypeDef *c,unsigned latency){
 assert(stage++==2);assert(c->ClockType==31U&&c->SYSCLKSource==RCC_SYSCLKSOURCE_MSI);
 assert(c->AHBCLKDivider==1&&c->APB1CLKDivider==1&&c->APB2CLKDivider==1&&c->APB3CLKDivider==1);
 assert(latency==FLASH_LATENCY_2);
 mock_source=scenario==8?4U:RCC_SYSCLKSOURCE_STATUS_MSI;
 return scenario==6?HAL_ERROR:HAL_OK;
}
int main(void){
 const unsigned expected_stages[]={3,0,0,0,1,2,3,3,3,3,3};
 for(scenario=0;scenario<11;scenario++){
  stage=0;mock_source=RCC_SYSCLKSOURCE_STATUS_MSI;mock_rcc.CR=RCC_CR_MSIKON;
  assert(board_system_clock_startup()==(scenario==0));
  assert(stage==expected_stages[scenario]);assert(mock_rcc.CR&RCC_CR_MSIKON);
 }
 puts("PASS 11 MSIS16 startup/HSI-off sequence and failure cases (mock HAL; no hardware validation)");
 return 0;
}
