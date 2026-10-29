#include <stdint.h>
typedef int HAL_StatusTypeDef;
#define HAL_OK 0
#define ADC1 ((void*)1)
typedef struct {uint32_t Channel,Rank,SamplingTime,SingleDiff,OffsetNumber;} ADC_ChannelConfTypeDef;
typedef struct {uint32_t ClockPrescaler,Resolution,DataAlign,ScanConvMode,EOCSelection,NbrOfConversion,ExternalTrigConv,ExternalTrigConvEdge,ConversionDataManagement,Overrun;} ADC_InitTypeDef;
typedef struct {void *Instance;ADC_InitTypeDef Init;} ADC_HandleTypeDef;
typedef struct {uint64_t PeriphClockSelection;uint32_t AdcDacClockSelection;} RCC_PeriphCLKInitTypeDef;
extern unsigned mock_ipsr,mock_mask,mock_hclk;
#define __get_IPSR() mock_ipsr
#define __get_PRIMASK() mock_mask
#define HAL_RCC_GetHCLKFreq() mock_hclk
void mock_clock(int on);
#define __HAL_RCC_ADC12_CLK_ENABLE() mock_clock(1)
#define __HAL_RCC_ADC12_CLK_DISABLE() mock_clock(0)
int HAL_RCCEx_PeriphCLKConfig(RCC_PeriphCLKInitTypeDef *);
int HAL_ADC_Init(ADC_HandleTypeDef *);
int HAL_ADCEx_Calibration_Start(ADC_HandleTypeDef *,uint32_t,uint32_t);
int HAL_ADC_ConfigChannel(ADC_HandleTypeDef *,ADC_ChannelConfTypeDef *);
int HAL_ADC_Start(ADC_HandleTypeDef *);
int HAL_ADC_PollForConversion(ADC_HandleTypeDef *,uint32_t);
uint32_t HAL_ADC_GetValue(ADC_HandleTypeDef *);
int HAL_ADC_Stop(ADC_HandleTypeDef *);
int HAL_ADC_DeInit(ADC_HandleTypeDef *);
#define ADC_CALIB_OFFSET 1u
#define ADC_CHANNEL_6 2u
#define ADC_CHANNEL_VREFINT 3u
#define ADC_CLOCK_ASYNC_DIV2 4u
#define ADC_CONVERSIONDATA_DR 5u
#define ADC_DATAALIGN_RIGHT 6u
#define ADC_EOC_SINGLE_CONV 7u
#define ADC_EXTERNALTRIGCONVEDGE_NONE 8u
#define ADC_OFFSET_NONE 9u
#define ADC_OVR_DATA_PRESERVED 10u
#define ADC_REGULAR_RANK_1 11u
#define ADC_RESOLUTION_14B 12u
#define ADC_SAMPLETIME_814CYCLES 13u
#define ADC_SCAN_DISABLE 14u
#define ADC_SINGLE_ENDED 15u
#define ADC_SOFTWARE_START 16u
#define RCC_ADCDACCLKSOURCE_HCLK 17u
#define RCC_PERIPHCLK_ADCDAC 18u

#define LL_ADC_DELAY_VREFINT_STAB_US 5u
void HAL_Delay(uint32_t ms);
