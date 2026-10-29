#include "terminal_fault.h"
#include "storage_power.h"
#include "usb_board.h"
#include "usb_input_v15.h"
#include "battery_io.h"
#include "low_battery_standby.h"
#include "stm32u5xx_hal.h"

bool board_terminal_fault_quiesce_until_vbus(void){
 if(__get_IPSR()||__get_PRIMASK())return false;
 board_usb_input_v15_revoke();
 board_battery_led(false);
 /* Cleanup failures cannot justify remaining awake on a 110mAh cell. */
 (void)board_usb_stop();
 (void)board_storage_power_emergency_off();
 return board_low_battery_standby_until_vbus();
}
