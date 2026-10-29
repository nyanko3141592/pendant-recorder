#include "usb_input_policy.h"
#include "usb_power_budget.h"
#include "../board/usb_input_v15.h"
#include "../board/usb_board.h"
#include "tusb.h"
/* These fail-closed queue/ACK queries are extensions carried by the pinned
 * TinyUSB fork. Declare the contract here because minimal integration builds
 * intentionally expose only tusb.h, while the definitions live in usbd.c. */
bool tud_task_event_ready(void);
bool tud_configuration_acknowledged(void);
_Static_assert(PENDANT_USB_MAX_POWER_MA==100||PENDANT_USB_MAX_POWER_MA==500,"Unsupported USB power budget");
static bool fault,suspend_applied;
static void apply_suspend(void){
 board_usb_input_v15_revoke();
 if(!suspend_applied){
  if(board_usb_input_v15_suspend())suspend_applied=true;
  else fault=true;
 }
}
void usb_input_policy_init(void){
 /* Session restart is not host resume; leave the hardware OFF latch intact. */
 fault=false;suspend_applied=false;board_usb_input_v15_revoke();
}
bool usb_input_policy_poll(void){
 if(tud_event_queue_overflowed())fault=true;
 if(fault){board_usb_input_v15_revoke();return false;}
#if PENDANT_USB_MAX_POWER_MA==500 || PENDANT_FIXED_USB_LIMIT
 /* Capture before observing stack state; setup/reset/suspend IRQs revoke it. */
 uint32_t epoch=board_usb_input_v15_epoch();
#endif
 bool vbus=board_usb_vbus_present();
 if(!vbus||tud_suspended())board_usb_input_v15_revoke();
#if !PENDANT_FIXED_USB_LIMIT
 if(!tud_mounted())board_usb_input_v15_revoke();
#endif
 if(vbus&&tud_suspended())apply_suspend();
#if PENDANT_USB_MAX_POWER_MA==500 || PENDANT_FIXED_USB_LIMIT
 /* The canonical fixed-100mA board may charge from a power-only source before
  * enumeration: TPS2552 independently limits the complete product input to
  * the declared one-unit-load budget.  A non-fixed board still needs the
  * host's configuration ACK before its 500mA grant. */
 bool eligible=vbus&&!tud_suspended()&&!fault;
#if !PENDANT_FIXED_USB_LIMIT
 eligible=eligible&&tud_mounted()&&tud_configuration_acknowledged();
#endif
 if(eligible){
  /* A queued reset/deconfigure must run before a new grant. A raced revoke
   * rejects the epoch in the driver; retry only after observing state anew. */
  if(tud_task_event_ready())board_usb_input_v15_revoke();
  else if(board_usb_input_v15_configured(PENDANT_USB_GRANT_MA,epoch)){
#if PENDANT_EXPERIMENTAL_USB_CHARGING
   /* Reuse the observation epoch: never refresh it after granting power.
    * The board rejects a reset/suspend/detach between these two calls. */
   (void)board_usb_input_v15_charge_request(epoch);
#endif
  }
 }
#endif
 return !fault;
}
/* TinyUSB invokes these from tud_task_ext, never from the event ISR hook. */
void tud_mount_cb(void){board_usb_input_v15_revoke();}
void tud_umount_cb(void){board_usb_input_v15_revoke();}
void tud_suspend_cb(bool remote_wakeup_en){(void)remote_wakeup_en;apply_suspend();}
void tud_resume_cb(void){
 board_usb_input_v15_revoke();
 /* A queued old resume must not override a newer suspended/detached state. */
 if(tud_event_queue_overflowed())fault=true;
 if(fault||!board_usb_vbus_present()||tud_suspended())return;
 if(!board_usb_input_v15_resume()){fault=true;return;}
 suspend_applied=false;
 /* The pulse yields to interrupts. Reapply OFF if suspend arrived meanwhile.
  * Physical suspend-current timing remains a prototype qualification test. */
 if(!board_usb_vbus_present())board_usb_input_v15_revoke();
 else if(tud_suspended())apply_suspend();
}
