#include "usb_input_v15.h"
#include "../usb/usb_power_budget.h"
#include "charge_inhibit.h"
#include "usb_board.h"
#include "stm32u5xx_hal.h"
#include "usb_input_v15_pins.h"
static volatile bool initialized;
static volatile bool budget_active;
static uint32_t budget_started_ms;
/* TLV7042 requires VCC > 1.6V for 200us before its output reflects the
 * inputs.  Ten milliseconds is a 50x design delay after the USB grant; the
 * actual V3V3 ramp and dead-pack sequence still require bench qualification. */
#define CHARGE_SETTLE_MS 10u
static bool suspended;
static volatile uint32_t revoke_epoch;
uint32_t board_usb_input_v15_epoch(void){return revoke_epoch;}
static bool task_context(void){return !__get_IPSR()&&!__get_PRIMASK();}
void board_usb_input_v15_init(void){
 board_charge_inhibit_init();
 __HAL_RCC_GPIOB_CLK_ENABLE();
#if !PENDANT_FIXED_USB_LIMIT
 __HAL_RCC_GPIOA_CLK_ENABLE();
 /* Resume must never pulse high during boot: that would clear retained OFF. */
 HAL_GPIO_WritePin(USB_INPUT_SUSPEND_PORT,USB_INPUT_SUSPEND_PIN,GPIO_PIN_RESET);
#if !PENDANT_FIXED_USB_LIMIT
 HAL_GPIO_WritePin(USB_INPUT_BUDGET_PORT,USB_INPUT_BUDGET_PIN,GPIO_PIN_RESET);
#endif
 HAL_GPIO_WritePin(USB_INPUT_RESUME_PORT,USB_INPUT_RESUME_PIN,GPIO_PIN_RESET);
#endif
#if !PENDANT_FIXED_USB_LIMIT
 GPIO_InitTypeDef p={0};p.Mode=GPIO_MODE_OUTPUT_PP;p.Pull=GPIO_PULLDOWN;p.Speed=GPIO_SPEED_FREQ_LOW;
 p.Pin=USB_INPUT_SUSPEND_PIN;HAL_GPIO_Init(USB_INPUT_SUSPEND_PORT,&p);
 p.Pin=USB_INPUT_BUDGET_PIN;HAL_GPIO_Init(USB_INPUT_BUDGET_PORT,&p);
 p.Pin=USB_INPUT_RESUME_PIN;HAL_GPIO_Init(USB_INPUT_RESUME_PORT,&p);
#endif
 initialized=true;
 board_usb_input_v15_revoke_from_isr();
 /* The hardware latch is not readable. Require an observed host resume to
  * clear it; do not infer that fresh MCU boot means fresh USB attachment. */
 suspended=false;
}
void board_usb_input_v15_revoke_from_isr(void){
 /* GPIOs are configured before USB starts. Never initialize peripherals or
  * wait for HAL ticks from an interrupt. External pulldowns cover pre-init. */
 uint32_t mask=__get_PRIMASK();__disable_irq();
 budget_active=false;
 if(revoke_epoch!=UINT32_MAX)revoke_epoch++;
 if(!initialized){__set_PRIMASK(mask);return;}
#if !PENDANT_FIXED_USB_LIMIT
 HAL_GPIO_WritePin(USB_INPUT_BUDGET_PORT,USB_INPUT_BUDGET_PIN,GPIO_PIN_RESET);
#endif
 HAL_GPIO_WritePin(GPIOB,GPIO_PIN_2,GPIO_PIN_RESET); /* charge request LOW */
 __set_PRIMASK(mask);
}
void board_usb_input_v15_revoke(void){
 board_usb_input_v15_revoke_from_isr();
 board_charge_inhibit_init();
}
bool board_usb_input_v15_configured(unsigned granted_ma,uint32_t expected_epoch){
 if(!initialized||!task_context())return false;
 /* A fresh observation of the same active grant must not pulse either
  * current-limit selection or charging. Revoke invalidates budget_active
  * and the epoch together. Pending IRQs still run before returning. */
 uint32_t renewal_mask=__get_PRIMASK();__disable_irq();
 bool renewed=budget_active&&granted_ma==PENDANT_USB_GRANT_MA&&!suspended&&
              revoke_epoch!=UINT32_MAX&&revoke_epoch==expected_epoch&&
              board_usb_vbus_present();
 __set_PRIMASK(renewal_mask);
 if(renewed)return revoke_epoch==expected_epoch;
 board_charge_inhibit_init();
 /* Bound the final check+GPIO write. An IRQ pending here runs on restore and
  * revokes the output; an IRQ already handled invalidates expected_epoch. */
 uint32_t mask=__get_PRIMASK();__disable_irq();
#if !PENDANT_FIXED_USB_LIMIT
 HAL_GPIO_WritePin(USB_INPUT_BUDGET_PORT,USB_INPUT_BUDGET_PIN,GPIO_PIN_RESET);
#endif
 budget_active=false;
 bool allowed=granted_ma==PENDANT_USB_GRANT_MA&&!suspended&&revoke_epoch!=UINT32_MAX&&
              revoke_epoch==expected_epoch&&board_usb_vbus_present();
 if(allowed){
#if !PENDANT_FIXED_USB_LIMIT
  HAL_GPIO_WritePin(USB_INPUT_BUDGET_PORT,USB_INPUT_BUDGET_PIN,GPIO_PIN_SET);
#endif
  budget_started_ms=HAL_GetTick();
  budget_active=true;
 }
 __set_PRIMASK(mask);
 return allowed&&revoke_epoch==expected_epoch;
}
bool board_usb_input_v15_charge_request(uint32_t expected_epoch){
 if(!initialized||!task_context())return false;
 uint32_t mask=__get_PRIMASK();__disable_irq();
 bool allowed=budget_active&&(uint32_t)(HAL_GetTick()-budget_started_ms)>=CHARGE_SETTLE_MS&&
              !suspended&&revoke_epoch!=UINT32_MAX&&
              revoke_epoch==expected_epoch&&board_usb_vbus_present();
 HAL_GPIO_WritePin(GPIOB,GPIO_PIN_2,allowed?GPIO_PIN_SET:GPIO_PIN_RESET);
 __set_PRIMASK(mask);
 return allowed&&revoke_epoch==expected_epoch;
}
bool board_usb_input_v15_suspend(void){
 if(!initialized||!task_context())return false;
 board_usb_input_v15_revoke();
#if PENDANT_FIXED_USB_LIMIT
 suspended=true;return true;
#else
 /* Q6 inverts the suspend GPIO: rising CLK occurs when the GPIO returns LOW. A reset
  * during the high pulse releases Q6; this completes OFF only if CLK first
  * reached a valid LOW. Brownout and interrupted-pulse behavior require bench validation. */
 HAL_GPIO_WritePin(USB_INPUT_RESUME_PORT,USB_INPUT_RESUME_PIN,GPIO_PIN_RESET);
 HAL_GPIO_WritePin(USB_INPUT_SUSPEND_PORT,USB_INPUT_SUSPEND_PIN,GPIO_PIN_SET);HAL_Delay(1);
 HAL_GPIO_WritePin(USB_INPUT_SUSPEND_PORT,USB_INPUT_SUSPEND_PIN,GPIO_PIN_RESET);HAL_Delay(1);
 suspended=true;return true;
#endif
}
bool board_usb_input_v15_resume(void){
 if(!initialized||!task_context())return false;
 board_usb_input_v15_revoke();
 if(!board_usb_vbus_present())return false;
#if PENDANT_FIXED_USB_LIMIT
 suspended=false;return true;
#else
 /* Release CLK before CLR, with settling time. Only a real bus resume may
  * call this; reset/configuration callbacks must never clear the OFF latch. */
 HAL_GPIO_WritePin(USB_INPUT_SUSPEND_PORT,USB_INPUT_SUSPEND_PIN,GPIO_PIN_RESET);HAL_Delay(1);
 HAL_GPIO_WritePin(USB_INPUT_RESUME_PORT,USB_INPUT_RESUME_PIN,GPIO_PIN_SET);HAL_Delay(1);
 HAL_GPIO_WritePin(USB_INPUT_RESUME_PORT,USB_INPUT_RESUME_PIN,GPIO_PIN_RESET);HAL_Delay(1);
 suspended=false;return true;
#endif
}
