#include "../board/export_runtime.h"
#include "tusb.h"
#include <assert.h>
#include <stddef.h>
static bool vbus,usb,mounted,power,stop_fail,probe_fail,init_fail,drop_probe;
extern bool test_charge_requested;
static unsigned power_stops,probes,actions,restarts;
unsigned __get_IPSR(void){return 0;}
unsigned __get_PRIMASK(void){return 0;}
void board_charge_inhibit_init(void){}
void board_usb_vbus_init(void){}
bool board_usb_vbus_present(void){return vbus;}
bool board_usb_prepare(void){return vbus;}
bool board_usb_stop(void){if(stop_fail)return false;usb=false;mounted=false;return true;}
bool tud_inited(void){return usb;}
bool tud_mounted(void){return mounted;}
bool tusb_rhport_init(uint8_t p,const tusb_rhport_init_t *cfg){assert(!p&&cfg->role==TUSB_ROLE_DEVICE);if(init_fail)return false;usb=true;return true;}
void tud_task_ext(uint32_t ms,bool isr){assert(!ms&&!isr);}
unsigned msc_storage_take_actions(void){unsigned a=actions;actions=0;return a;}
void msc_storage_bind(board_storage *d){assert(!d||d->ready);}
bool board_recipient_flash_load(void *context,uint8_t recipient[32]){(void)context;(void)recipient;return false;}
void recipient_hid_init(bool (*load)(void *,uint8_t[32]),void *context){assert(load==board_recipient_flash_load&&!context);}
bool board_storage_power_startup(void){assert(!usb&&!power);power=true;return true;}
bool board_storage_power_restart_for_export(void){restarts++;return board_storage_power_startup();}
bool board_storage_power_shutdown(void){assert(!usb&&power);power=false;power_stops++;return true;}
bool board_storage_open(board_storage *d,storage_owner *o){assert(power&&owner_device_can_access(o)&&d->io_power_good&&d->io_power_good());probes++;d->owner=o;d->ready=!probe_fail;if(drop_probe)vbus=false;return !probe_fail;}
static void reset(void){vbus=true;usb=mounted=power=stop_fail=probe_fail=init_fail=drop_probe=false;power_stops=probes=actions=restarts=0;}
int main(void){
 for(unsigned eject=0;eject<2;eject++){
  reset();export_runtime r={0};assert(export_runtime_start(&r));
  assert(probes==1&&power&&usb&&r.owner.state==OWN_EXPORT_READY);
  assert(!owner_device_can_access(&r.owner)&&!owner_host_can_access(&r.owner));
  assert(!export_runtime_start(&r));
  assert(export_runtime_poll(&r)&&r.owner.state==OWN_EXPORT_READY);
#if PENDANT_EXPERIMENTAL_USB_CHARGING
  assert(test_charge_requested); /* low-battery/power-only export charges pre-enumeration */
#else
  assert(!test_charge_requested);
#endif
  mounted=true;assert(export_runtime_poll(&r)&&owner_host_can_access(&r.owner));
  if(eject)actions=owner_step(&r.owner,HOST_EJECTED);else vbus=false;
  assert(export_runtime_poll(&r));assert(r.stopped&&!usb&&!power&&!r.disk.ready);
  assert(r.owner.state==OWN_STOPPED&&power_stops==1);
  if(eject){
   assert(export_runtime_poll(&r)&&!usb&&power_stops==1); /* still plugged */
   vbus=false;assert(export_runtime_poll(&r)&&!usb);
  }
  vbus=true;assert(export_runtime_poll(&r)&&usb&&power&&probes==2&&restarts==1);
  assert(r.owner.state==OWN_EXPORT_READY&&!owner_host_can_access(&r.owner));
  mounted=true;assert(export_runtime_poll(&r)&&owner_host_can_access(&r.owner));
  vbus=false;assert(export_runtime_poll(&r)&&!usb&&!power&&power_stops==2);
 }
 reset();export_runtime r={0};assert(export_runtime_start(&r));vbus=false;
 assert(export_runtime_poll(&r)&&r.owner.state==OWN_STOPPED&&!power);
 reset();r=(export_runtime){0};vbus=false;assert(!export_runtime_start(&r)&&!probes&&!power);
 for(unsigned failure=0;failure<3;failure++){
  reset();r=(export_runtime){0};probe_fail=failure==0;init_fail=failure==1;drop_probe=failure==2;
  assert(!export_runtime_start(&r)&&r.failed&&!power&&!usb&&power_stops==1);
 }
 reset();r=(export_runtime){0};assert(export_runtime_start(&r));mounted=true;
 assert(export_runtime_poll(&r));stop_fail=true;vbus=false;
 assert(!export_runtime_poll(&r)&&r.failed&&power&&usb&&power_stops==0);
 assert(!owner_host_can_access(&r.owner));
 vbus=true;stop_fail=false;assert(!export_runtime_poll(&r)&&!restarts);
 reset();r=(export_runtime){0};storage_owner old;owner_init(&old,true);
 assert(!export_runtime_start_after_stop(&r,&old)&&!restarts);
 owner_step(&old,STOP_RECORDING);owner_step(&old,DEVICE_RELEASED);
 assert(export_runtime_start_after_stop(&r,&old)&&restarts==1);
 mounted=true;assert(export_runtime_poll(&r)&&owner_host_can_access(&r.owner));
 vbus=false;assert(export_runtime_poll(&r)&&r.stopped&&!power);
 reset();r=(export_runtime){0};old.fault_pending=true;
 assert(!export_runtime_start_after_stop(&r,&old));
 return 0;
}
