#ifndef SYSTEM_CLOCK_TEST_HAL_H
#define SYSTEM_CLOCK_TEST_HAL_H
#include <stdint.h>
typedef enum { HAL_OK, HAL_ERROR } HAL_StatusTypeDef;
typedef struct { uint32_t CR; } RCC_TypeDef;
extern RCC_TypeDef mock_rcc;
#define RCC (&mock_rcc)
#define RCC_CR_MSISON 1U
#define RCC_CR_MSISRDY 2U
#define RCC_CR_MSIKON 4U
#define RCC_CR_HSIRDY 8U
#define READ_BIT(r,b) ((r)&(b))
#define RESET 0U
#define RCC_FLAG_HSIRDY RCC_CR_HSIRDY
#define __HAL_RCC_GET_FLAG(f) (READ_BIT(RCC->CR,(f)) ? 1U : 0U)
#define PWR_REGULATOR_VOLTAGE_SCALE4 4U
#define RCC_OSCILLATORTYPE_HSI 1U
#define RCC_OSCILLATORTYPE_MSI 2U
#define RCC_HSI_OFF 0U
#define RCC_MSI_ON 1U
#define RCC_HSICALIBRATION_DEFAULT 64U
#define RCC_MSICALIBRATION_DEFAULT 16U
#define RCC_MSIRANGE_2 2U
#define RCC_CLOCKTYPE_SYSCLK 1U
#define RCC_CLOCKTYPE_HCLK 2U
#define RCC_CLOCKTYPE_PCLK1 4U
#define RCC_CLOCKTYPE_PCLK2 8U
#define RCC_CLOCKTYPE_PCLK3 16U
#define RCC_SYSCLKSOURCE_MSI 0U
#define RCC_SYSCLKSOURCE_STATUS_MSI 0U
#define RCC_SYSCLK_DIV1 1U
#define RCC_HCLK_DIV1 1U
#define FLASH_LATENCY_2 2U
extern unsigned mock_source;
#define __HAL_RCC_GET_SYSCLK_SOURCE() mock_source
typedef struct { unsigned OscillatorType,HSIState,HSICalibrationValue,MSIState,MSICalibrationValue,MSIClockRange; } RCC_OscInitTypeDef;
typedef struct { unsigned ClockType,SYSCLKSource,AHBCLKDivider,APB1CLKDivider,APB2CLKDivider,APB3CLKDivider; } RCC_ClkInitTypeDef;
unsigned __get_IPSR(void);
unsigned __get_PRIMASK(void);
uint32_t HAL_RCC_GetSysClockFreq(void);
uint32_t HAL_RCC_GetHCLKFreq(void);
HAL_StatusTypeDef HAL_PWREx_ControlVoltageScaling(unsigned);
HAL_StatusTypeDef HAL_RCC_OscConfig(RCC_OscInitTypeDef *);
HAL_StatusTypeDef HAL_RCC_ClockConfig(RCC_ClkInitTypeDef *,unsigned);
#endif
