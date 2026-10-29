#include "system_clock.h"
#include "stm32u5xx_hal.h"
bool board_system_clock_startup(void){
 if(__get_IPSR()||__get_PRIMASK()||HAL_RCC_GetSysClockFreq()>16000000U)return false;
 if(HAL_PWREx_ControlVoltageScaling(PWR_REGULATOR_VOLTAGE_SCALE4)!=HAL_OK)return false;
 RCC_OscInitTypeDef osc={0};osc.OscillatorType=RCC_OSCILLATORTYPE_HSI;
 osc.HSIState=RCC_HSI_OFF;osc.HSICalibrationValue=RCC_HSICALIBRATION_DEFAULT;
 /* MSIS and MSIK are independently ranged outputs of MSI.  Keep MSIS at
  * 16 MHz for the CPU while audio later selects MSIK=3.072 MHz.  SPI1 uses
  * PCLK2, so HSI16 need not remain powered throughout every recording. */
 osc.OscillatorType|=RCC_OSCILLATORTYPE_MSI;
 osc.MSIState=RCC_MSI_ON;osc.MSICalibrationValue=RCC_MSICALIBRATION_DEFAULT;
 osc.MSIClockRange=RCC_MSIRANGE_2;
 if(HAL_RCC_OscConfig(&osc)!=HAL_OK)return false;
 RCC_ClkInitTypeDef clocks={0};
 clocks.ClockType=RCC_CLOCKTYPE_SYSCLK|RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2|RCC_CLOCKTYPE_PCLK3;
 clocks.SYSCLKSource=RCC_SYSCLKSOURCE_MSI;clocks.AHBCLKDivider=RCC_SYSCLK_DIV1;
 clocks.APB1CLKDivider=RCC_HCLK_DIV1;clocks.APB2CLKDivider=RCC_HCLK_DIV1;clocks.APB3CLKDivider=RCC_HCLK_DIV1;
 if(HAL_RCC_ClockConfig(&clocks,FLASH_LATENCY_2)!=HAL_OK)return false;
 if(HAL_RCC_GetHCLKFreq()!=16000000U ||
    __HAL_RCC_GET_SYSCLK_SOURCE()!=RCC_SYSCLKSOURCE_STATUS_MSI)return false;
 return HAL_RCC_GetHCLKFreq()==16000000U &&
        READ_BIT(RCC->CR,RCC_CR_MSISON|RCC_CR_MSISRDY)==
        (RCC_CR_MSISON|RCC_CR_MSISRDY) &&
        __HAL_RCC_GET_FLAG(RCC_FLAG_HSIRDY)==RESET;
}
