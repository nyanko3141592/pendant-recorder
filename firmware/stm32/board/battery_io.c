#include "stm32u5xx_hal.h"
#include "battery_io.h"
#include "../core/battery_indicator.h"
#include "../core/led_timeout.h"
static volatile led_timeout led_limit;
static volatile bool led_ready;
void board_battery_io_init(void){
 uint32_t irq_mask=__get_PRIMASK();__disable_irq();
 led_ready=false;led_limit.requested=false;led_limit.remaining=0;
 __HAL_RCC_GPIOA_CLK_ENABLE();
 __HAL_RCC_GPIOB_CLK_ENABLE();
 /* ES0587: use VDD for analog switches, booster disabled.
  * Board VDD is3.3V; low-VDD sampling requirements still apply if rails change. */
 __HAL_RCC_SYSCFG_CLK_ENABLE();
 HAL_SYSCFG_DisableIOAnalogBooster();
 HAL_SYSCFG_EnableIOAnalogVoltageSelection();
 /* PA8 sources R32/D6. Latch off before enabling the output. */
 HAL_GPIO_WritePin(GPIOA,GPIO_PIN_8,GPIO_PIN_RESET);
 GPIO_InitTypeDef pin={0};
 pin.Pin=GPIO_PIN_8;pin.Mode=GPIO_MODE_OUTPUT_PP;
 pin.Pull=GPIO_NOPULL;pin.Speed=GPIO_SPEED_FREQ_LOW;
 HAL_GPIO_Init(GPIOA,&pin);
 /* PA1 is a high-impedance 1M/1M divider with10nF. No digital pulls. */
 /* PA15 BUTTON_N has external100k pull-up R4. */
 pin.Pin=GPIO_PIN_15;pin.Pull=GPIO_NOPULL;
#if PENDANT_AUTOMATIC_BATTERY_INDICATOR_MS
 pin.Mode=GPIO_MODE_ANALOG; /* Unconnected in buttonless PCB candidate. */
#else
 pin.Mode=GPIO_MODE_INPUT;
#endif
 HAL_GPIO_Init(GPIOA,&pin);
 pin.Pin=GPIO_PIN_1;pin.Mode=GPIO_MODE_ANALOG;pin.Pull=GPIO_NOPULL;
 HAL_GPIO_Init(GPIOA,&pin);
 led_ready=true;__set_PRIMASK(irq_mask);
}

bool board_battery_reference_calibration(uint16_t *cal14){
 if(!cal14)return false;
 /* Odd factory address: use byte reads, not an unaligned uint16_t load. */
 volatile const uint8_t *cal=(volatile const uint8_t *)0x0BFA07A5UL;
 uint16_t value=(uint16_t)cal[0]|((uint16_t)cal[1]<<8);
 if(!value||value>=16383)return false;
 *cal14=value;return true;
}

bool board_battery_button_pressed(void){
#if PENDANT_AUTOMATIC_BATTERY_INDICATOR_MS
 return false;
#else
 return HAL_GPIO_ReadPin(GPIOA,GPIO_PIN_15)==GPIO_PIN_RESET;
#endif
}
void board_battery_led(bool on){
 uint32_t irq_mask=__get_PRIMASK();__disable_irq();
 if(led_ready){
  led_action a=led_timeout_request(&led_limit,on);
  if(a!=LED_UNCHANGED)HAL_GPIO_WritePin(GPIOA,GPIO_PIN_8,a==LED_SET_ON?GPIO_PIN_SET:GPIO_PIN_RESET);
 }
 __set_PRIMASK(irq_mask);
}
void board_battery_led_tick_1ms(void){
 /* SysTick context: one decrement, no FS, allocation or main-loop dependency. */
 if(led_ready && led_timeout_tick(&led_limit)==LED_SET_OFF)
  HAL_GPIO_WritePin(GPIOA,GPIO_PIN_8,GPIO_PIN_RESET);
}
