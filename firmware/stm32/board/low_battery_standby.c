#include "low_battery_standby.h"
#include "usb_board.h"
#include "usb_input_v15.h"
#include "battery_io.h"
#include "stm32u5xx_hal.h"

bool board_low_battery_standby_until_vbus(void){
 if(__get_IPSR()||__get_PRIMASK())return false;
 board_usb_vbus_init();
 board_usb_input_v15_revoke();
 board_battery_led(false);
 if(board_usb_vbus_present())return true;

 /* VBUS_N is PA0 and goes low when USB power arrives.  PA0 is U585 WKUP1
  * source 0.  Standby resets the MCU, so normal startup rechecks BOR, ADC and
  * the qualified cutoff before starting export/charge. */
 HAL_PWR_DisableWakeUpPin(PWR_WAKEUP_PIN1);
 __HAL_PWR_CLEAR_FLAG(PWR_WAKEUP_FLAG1);
 HAL_PWR_EnableWakeUpPin(PWR_WAKEUP_PIN1_LOW_0);
 __DSB();__ISB();

 /* Close the clear/enable/entry race.  If power arrived, remain awake and let
  * the caller start export.  Otherwise an active-low wake occurring just
  * before WFI remains a wake request for Standby. */
 if(board_usb_vbus_present()){
  HAL_PWR_DisableWakeUpPin(PWR_WAKEUP_PIN1);
  __HAL_PWR_CLEAR_FLAG(PWR_WAKEUP_FLAG1);
  return true;
 }
 HAL_PWR_EnterSTANDBYMode();
 return false; /* Standby wake is reset; returning is a hardware/HAL failure. */
}
