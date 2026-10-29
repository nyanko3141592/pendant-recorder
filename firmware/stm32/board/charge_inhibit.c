#include "stm32u5xx_hal.h"
#include "charge_inhibit.h"
void board_charge_inhibit_init(void){
 __HAL_RCC_GPIOB_CLK_ENABLE();
 /* Set output latch LOW before changing PB2 from reset mode to output. */
 HAL_GPIO_WritePin(GPIOB,GPIO_PIN_2,GPIO_PIN_RESET);
 GPIO_InitTypeDef pin={0};
 pin.Pin=GPIO_PIN_2;
 pin.Mode=GPIO_MODE_OUTPUT_PP;
 pin.Pull=GPIO_PULLDOWN;
 pin.Speed=GPIO_SPEED_FREQ_LOW;
 HAL_GPIO_Init(GPIOB,&pin);
}
