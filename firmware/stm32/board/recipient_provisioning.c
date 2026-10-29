#include "recipient_provisioning.h"
#include "recipient_flash.h"
#include "usb_board.h"
#include "usb_input_v15.h"
#include "battery_io.h"
#include "../usb/msc_storage.h"
#include "../usb/recipient_hid.h"
#include "../usb/usb_input_policy.h"
#include "tusb.h"
#include "stm32u5xx_hal.h"
#include <string.h>

bool board_recipient_provisioning_run(void){
 if(__get_IPSR()||__get_PRIMASK())return false;
 board_usb_vbus_init();
 for(;;){
  while(!board_usb_vbus_present())__WFI();
  recipient_hid_init(board_recipient_flash_load,NULL);msc_storage_bind(NULL);
  usb_input_policy_init();
  const tusb_rhport_init_t cfg={.role=TUSB_ROLE_DEVICE,.speed=TUSB_SPEED_FULL};
  if(!board_usb_prepare())return false;
  if(!tusb_rhport_init(0,&cfg)){(void)board_usb_stop();return false;}
  bool committed=recipient_hid_current_status()==RECIPIENT_HID_PROVISIONED;
  bool button_down=false;uint32_t button_since=0;
  while(board_usb_vbus_present()){
   tud_task_ext(0,false);if(!usb_input_policy_poll()){(void)board_usb_stop();return false;}
   bool pressed=board_battery_button_pressed();uint32_t now=HAL_GetTick();
   if(!pressed){button_down=false;recipient_hid_set_provision_authorized(false);}
   else if(!button_down){button_down=true;button_since=now;recipient_hid_set_provision_authorized(false);}
   else recipient_hid_set_provision_authorized((uint32_t)(now-button_since)>=2000U);
   uint8_t requested[32];
   if(recipient_hid_take_pending(requested)){
    bool ok=board_recipient_flash_commit(requested);uint8_t check[32];
    ok=ok&&board_recipient_flash_load(NULL,check)&&!memcmp(check,requested,32);
    recipient_hid_complete(ok,requested);committed=ok;
   }
   __WFI();
  }
  board_usb_input_v15_revoke();if(!board_usb_stop())return false;
  if(committed){NVIC_SystemReset();return false;}
 }
}
