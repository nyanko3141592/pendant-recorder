#include <stdint.h>
typedef struct {unsigned Pin,Mode,Pull,Speed;} GPIO_InitTypeDef;
#define GPIOA 1
#define GPIOB 2
#define GPIO_PIN_1 2
#define GPIO_PIN_2 4
#define GPIO_PIN_3 8
#define GPIO_PIN_5 32
#define GPIO_PIN_6 64
#define GPIO_PIN_7 128
#define GPIO_PIN_RESET 0
#define GPIO_PIN_SET 1
#define GPIO_MODE_OUTPUT_PP 1
#define GPIO_PULLDOWN 2
#define GPIO_SPEED_FREQ_LOW 0
#define __HAL_RCC_GPIOA_CLK_ENABLE() ((void)0)
#define __HAL_RCC_GPIOB_CLK_ENABLE() ((void)0)
void HAL_GPIO_WritePin(unsigned,unsigned,unsigned);
void HAL_GPIO_Init(unsigned,GPIO_InitTypeDef *);
void HAL_Delay(uint32_t);
unsigned __get_IPSR(void);
unsigned __get_PRIMASK(void);

void __disable_irq(void);
void __set_PRIMASK(unsigned);

uint32_t HAL_GetTick(void);
