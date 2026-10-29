#include "export_runtime.h"
#include "usb_board.h"
#include "storage_power.h"
#include "charge_inhibit.h"
#include "../usb/msc_storage.h"
#include "../usb/recipient_hid.h"
#include "recipient_flash.h"
#include "stm32u5xx_hal.h"
#include "tusb.h"
static bool shutdown(export_runtime *r,bool failed){
 if(failed){r->failed=true;(void)owner_step(&r->owner,IO_FAILED);}
 /* Synchronous callbacks have returned. Never power off if USB teardown fails. */
 if(!board_usb_stop()){r->failed=true;(void)owner_step(&r->owner,IO_FAILED);return false;}
 if(r->owner.state==OWN_RECOVERING)(void)owner_step(&r->owner,HOST_RELEASED);
 r->disk.ready=false;
 msc_storage_bind(NULL);
 if(r->powered){
  if(!board_storage_power_shutdown()){r->failed=true;(void)owner_step(&r->owner,IO_FAILED);return false;}
  r->powered=false;
 }
 r->stopped=true;return !r->failed;
}
static bool start(export_runtime *r,bool restart){
 if(!r||r->attempted||__get_IPSR()||__get_PRIMASK()||tud_inited())return false;
 r->attempted=true;owner_init(&r->owner,false);board_charge_inhibit_init();
 board_usb_vbus_init();
 if(!board_usb_vbus_present()){r->failed=true;return false;}
 /* Startup may have partially enabled the rail on failure; teardown owns it. */
 r->powered=true;
 r->disk.io_power_good=board_usb_vbus_present;
 if(!(restart?board_storage_power_restart_for_export():board_storage_power_startup())||!board_usb_vbus_present()||
    !board_storage_open(&r->disk,&r->owner)||!board_usb_vbus_present()||
    !owner_prepare_export(&r->owner))return shutdown(r,true);
 msc_storage_bind(&r->disk);recipient_hid_init(board_recipient_flash_load,NULL);
 usb_session_init(&r->usb,&r->owner);
 const tusb_rhport_init_t cfg={.role=TUSB_ROLE_DEVICE,.speed=TUSB_SPEED_FULL};
 if(!board_usb_prepare()||!tusb_rhport_init(0,&cfg))return shutdown(r,true);
 r->initialized=true;return true;
}
bool export_runtime_start(export_runtime *r){return start(r,false);}
bool export_runtime_start_after_stop(export_runtime *r,const storage_owner *previous){
 if(!previous||previous->state!=OWN_STOPPED||previous->fault_pending||
    !previous->stop_requested||previous->export_only)return false;
 return start(r,true);
}
bool export_runtime_poll(export_runtime *r){
 if(!r||!r->initialized||__get_IPSR()||__get_PRIMASK())return false;
 if(r->failed)return false;
 if(r->stopped){
  if(!board_usb_vbus_present()){r->disconnect_seen=true;return true;}
  if(!r->disconnect_seen)return true; /* Eject is not a physical unplug. */
  if(r->powered||tud_inited()||r->owner.state!=OWN_STOPPED)return shutdown(r,true);
  *r=(export_runtime){0};
  return start(r,true); /* Clean new export session, never recording. */
 }
 unsigned actions;
 if(!board_usb_vbus_present()){
  r->disconnect_seen=true;
  actions=owner_step(&r->owner,USB_DISCONNECTED);
  (void)actions;
  return shutdown(r,false);
 }
 actions=usb_session_service(&r->usb);
 if(actions&ACT_REPORT_FAULT || r->owner.fault_pending)return shutdown(r,true);
 if(actions&(ACT_RECOVER_FS|ACT_RESUME_RECORDING|ACT_STOP_AND_FLUSH))return shutdown(r,true);
 if(actions&ACT_REVOKE_MSC)return shutdown(r,false);
 if((actions&ACT_EXPOSE_MSC)&&!owner_host_can_access(&r->owner))return shutdown(r,true);
 return true;
}
