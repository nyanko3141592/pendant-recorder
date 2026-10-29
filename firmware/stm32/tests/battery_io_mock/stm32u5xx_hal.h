#ifndef BATTERY_IO_MOCK_HAL_H
#define BATTERY_IO_MOCK_HAL_H
#include <stdint.h>
typedef struct {uint32_t Pin,Mode,Pull,Speed;} GPIO_InitTypeDef;
typedef enum {GPIO_PIN_RESET,GPIO_PIN_SET} GPIO_PinState;
#define GPIOA ((void *)1)
#define GPIO_PIN_1 (1U<<1)
#define GPIO_PIN_8 (1U<<8)
#define GPIO_PIN_15 (1U<<15)
#define GPIO_MODE_OUTPUT_PP 1U
#define GPIO_MODE_INPUT 2U
#define GPIO_MODE_ANALOG 3U
#define GPIO_NOPULL 0U
#define GPIO_SPEED_FREQ_LOW 0U
#define __HAL_RCC_GPIOA_CLK_ENABLE() ((void)0)
#define __HAL_RCC_GPIOB_CLK_ENABLE() ((void)0)
#define __HAL_RCC_SYSCFG_CLK_ENABLE() ((void)0)
void HAL_SYSCFG_DisableIOAnalogBooster(void);
void HAL_SYSCFG_EnableIOAnalogVoltageSelection(void);
void HAL_GPIO_WritePin(void *,uint32_t,GPIO_PinState);
void HAL_GPIO_Init(void *,GPIO_InitTypeDef *);
GPIO_PinState HAL_GPIO_ReadPin(void *,uint32_t);
uint32_t __get_PRIMASK(void);
void __disable_irq(void);
void __set_PRIMASK(uint32_t);
#endif
