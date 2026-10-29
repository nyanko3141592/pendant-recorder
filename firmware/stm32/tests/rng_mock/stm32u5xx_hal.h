#ifndef RNG_TEST_HAL_H
#define RNG_TEST_HAL_H
#include <stdint.h>
typedef struct { volatile uint32_t SR; } RNG_TypeDef;
typedef struct { volatile uint32_t CR,CFGR1; } RCC_TypeDef;
extern RCC_TypeDef test_rcc;
#define RCC (&test_rcc)
extern RNG_TypeDef test_rng;
#define RNG (&test_rng)
#define RNG_SR_CECS 2u
#define RNG_SR_SECS 4u
#define RNG_SR_CEIS 32u
#define RNG_SR_SEIS 64u
#define RNG_CED_ENABLE 0u
#define HAL_RNG_ERROR_NONE 0u
#define HAL_RNG_STATE_READY 1u
typedef struct {RNG_TypeDef *Instance;uint32_t State;struct {uint32_t ClockErrorDetection;} Init;uint32_t ErrorCode;} RNG_HandleTypeDef;
typedef enum {HAL_OK,HAL_ERROR} HAL_StatusTypeDef;
HAL_StatusTypeDef HAL_RNG_GenerateRandomNumber(RNG_HandleTypeDef *,uint32_t *);
#define RNG_CR_NIST_VALUE 0x00F11F00U
#define RNG_HTCR_NIST_VALUE 0x76B3U
#define RNG_NSCR_NIST_VALUE 0x24C2U
#define RCC_OSCILLATORTYPE_HSI48 1
#define RCC_HSI48_ON 1
#define RCC_HSI48_OFF 0
#define RCC_PERIPHCLK_RNG 1
#define RCC_RNGCLKSOURCE_HSI48 1
typedef struct {uint32_t OscillatorType,HSI48State,HSIState,HSICalibrationValue;} RCC_OscInitTypeDef;
typedef struct {uint32_t PeriphClockSelection,RngClockSelection;} RCC_PeriphCLKInitTypeDef;
unsigned __get_IPSR(void);
unsigned __get_PRIMASK(void);
HAL_StatusTypeDef HAL_RCC_OscConfig(RCC_OscInitTypeDef *);
HAL_StatusTypeDef HAL_RCCEx_PeriphCLKConfig(RCC_PeriphCLKInitTypeDef *);
uint32_t HAL_RCCEx_GetPeriphCLKFreq(uint32_t);
HAL_StatusTypeDef HAL_RNG_Init(RNG_HandleTypeDef *);
HAL_StatusTypeDef HAL_RNG_DeInit(RNG_HandleTypeDef *);
void test_rng_clock(unsigned operation);
#define __HAL_RCC_RNG_CLK_ENABLE() test_rng_clock(1)
#define __HAL_RCC_RNG_FORCE_RESET() test_rng_clock(2)
#define __HAL_RCC_RNG_RELEASE_RESET() test_rng_clock(3)
#define __HAL_RCC_RNG_CLK_DISABLE() test_rng_clock(4)
typedef struct {int State;} MDF_HandleTypeDef;
typedef struct {int unused;} MDF_FilterConfigTypeDef;
#define RCC_OSCILLATORTYPE_HSI 2
#define RCC_HSI_ON 1
#define RCC_HSICALIBRATION_DEFAULT 16
#define RCC_SYSCLKSOURCE_STATUS_MSI 0U
#define RCC_CFGR1_SWS 0xCU
#define RCC_CR_HSIRDY (1U<<10)
#define RCC_FLAG_HSIRDY RCC_CR_HSIRDY
#define RESET 0U
#define __HAL_RCC_GET_SYSCLK_SOURCE() (RCC->CFGR1 & RCC_CFGR1_SWS)
#define __HAL_RCC_GET_FLAG(f) ((RCC->CR & (f)) ? 1U : 0U)
uint32_t HAL_RCC_GetHCLKFreq(void);
#endif
