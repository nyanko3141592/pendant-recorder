#include "../core/storage_owner.h"
#include <assert.h>
#include <stddef.h>
int main(void) {
 storage_owner o;
 owner_init(&o,true);
 assert(owner_device_can_access(&o));
 assert(owner_step(&o,USB_CONFIGURED)==ACT_STOP_AND_FLUSH);
 assert(!owner_device_can_access(&o)&&!owner_host_can_access(&o));
 assert(owner_step(&o,USB_DISCONNECTED)==ACT_NONE);
 assert(owner_step(&o,DEVICE_RELEASED)==ACT_RECOVER_FS);
 assert(owner_step(&o,RECOVERY_OK)==ACT_RESUME_RECORDING);
 assert(owner_step(&o,USB_CONFIGURED)==ACT_STOP_AND_FLUSH);
 assert(owner_step(&o,DEVICE_RELEASED)==ACT_EXPOSE_MSC);
 assert(owner_host_can_access(&o)&&!owner_device_can_access(&o));
 assert(owner_step(&o,HOST_EJECTED)==ACT_REVOKE_MSC);
 assert(!owner_host_can_access(&o)&&!owner_device_can_access(&o));
 assert(owner_step(&o,RECOVERY_OK)==ACT_NONE); /* stale completion */
 assert(owner_step(&o,HOST_RELEASED)==ACT_RECOVER_FS);
 assert(owner_step(&o,HOST_RELEASED)==ACT_NONE);
 assert(owner_step(&o,RECOVERY_OK)==ACT_RESUME_RECORDING);
 assert(owner_device_can_access(&o));
 owner_init(&o,false);
 owner_step(&o,USB_CONFIGURED);owner_step(&o,DEVICE_RELEASED);
 assert(owner_step(&o,IO_FAILED)==(ACT_REVOKE_MSC|ACT_REPORT_FAULT));
 assert(owner_step(&o,RECOVERY_OK)==ACT_NONE);
 assert(owner_step(&o,HOST_RELEASED)==ACT_REPORT_FAULT);
 assert(o.state==OWN_FAULT);
 assert(!owner_host_can_access(&o)&&!owner_device_can_access(&o));
 owner_init(&o,false);
 owner_step(&o,USB_CONFIGURED);owner_step(&o,DEVICE_RELEASED);
 owner_step(&o,USB_DISCONNECTED);owner_step(&o,HOST_RELEASED);
 assert(owner_step(&o,RECOVERY_OK)==ACT_NONE);
 /* All states: host access never overlaps any device IO privilege. */
 for(unsigned st=OWN_DEVICE;st<=OWN_FAULT;st++)
  for(unsigned fault=0;fault<2;fault++)
   for(unsigned recovery=0;recovery<2;recovery++){
    o=(storage_owner){.state=(owner_state)st,.fault_pending=fault,.recovery_started=recovery};
    assert(owner_device_can_finalize(&o)==(st==OWN_DRAINING&&!fault));
    assert(owner_device_can_recover(&o)==(st==OWN_RECOVERING&&recovery&&!fault));
    assert(!(owner_host_can_access(&o)&&(owner_device_can_access(&o)||owner_device_can_finalize(&o)||owner_device_can_recover(&o))));
   }
 owner_init(&o,true);owner_step(&o,USB_CONFIGURED);
 assert(owner_device_can_finalize(&o));
 owner_step(&o,USB_DISCONNECTED);assert(owner_device_can_finalize(&o));
 owner_step(&o,DEVICE_RELEASED);
 assert(!owner_device_can_finalize(&o)&&owner_device_can_recover(&o));
 owner_step(&o,IO_FAILED);assert(!owner_device_can_recover(&o));
 /* Controlled stop must flush exactly once, never expose MSC or restart. */
 owner_init(&o,true);
 assert(owner_step(&o,STOP_RECORDING)==ACT_STOP_AND_FLUSH);
 assert(owner_device_can_finalize(&o)&&!o.resume_recording);
 assert(owner_step(&o,STOP_RECORDING)==ACT_NONE);
 owner_step(&o,USB_CONFIGURED);
 assert(owner_step(&o,DEVICE_RELEASED)==ACT_NONE && o.state==OWN_STOPPED);
 for(unsigned ev=USB_CONFIGURED;ev<IO_FAILED;ev++) {
  assert(owner_step(&o,(owner_event)ev)==ACT_NONE);
  assert(o.state==OWN_STOPPED && !owner_device_can_access(&o) && !owner_host_can_access(&o));
 }
 owner_init(&o,true);owner_step(&o,USB_CONFIGURED);
 assert(owner_step(&o,STOP_RECORDING)==ACT_NONE);
 assert(owner_step(&o,DEVICE_RELEASED)==ACT_NONE && o.state==OWN_STOPPED);
 owner_init(&o,true);owner_step(&o,USB_CONFIGURED);owner_step(&o,DEVICE_RELEASED);
 assert(owner_step(&o,STOP_RECORDING)==ACT_NONE && o.state==OWN_HOST && !o.stop_requested);
 owner_init(&o,true);owner_step(&o,STOP_RECORDING);
 assert(owner_step(&o,IO_FAILED)==ACT_REPORT_FAULT && o.state==OWN_FAULT);
 /* Export-only media remains inaccessible until host configuration; there
  * is no filesystem recovery or capture restart after eject/disconnect. */
 assert(!owner_prepare_export(NULL));
 owner_init(&o,true);assert(!owner_prepare_export(&o));
 for(unsigned release=0;release<2;release++) {
  owner_init(&o,false);assert(owner_prepare_export(&o));
  assert(o.state==OWN_EXPORT_READY && !owner_device_can_access(&o));
  assert(!owner_host_can_access(&o) && !owner_device_can_recover(&o));
  assert(!owner_prepare_export(&o));
  assert(owner_step(&o,RECOVERY_OK)==ACT_NONE);
  assert(owner_step(&o,USB_CONFIGURED)==ACT_EXPOSE_MSC);
  assert(owner_host_can_access(&o));
  assert(owner_step(&o,release?HOST_EJECTED:USB_DISCONNECTED)==ACT_REVOKE_MSC);
  assert(!owner_host_can_access(&o));
  assert(owner_step(&o,USB_CONFIGURED)==ACT_NONE); /* reconnect during drain */
  assert(owner_step(&o,RECOVERY_OK)==ACT_NONE);
  assert(owner_step(&o,HOST_RELEASED)==ACT_NONE && o.state==OWN_STOPPED);
  for(unsigned ev=USB_CONFIGURED;ev<IO_FAILED;ev++) {
   assert(owner_step(&o,(owner_event)ev)==ACT_NONE);
   assert(o.state==OWN_STOPPED);
  }
 }
 owner_init(&o,false);assert(owner_prepare_export(&o));
 assert(owner_step(&o,USB_DISCONNECTED)==ACT_NONE && o.state==OWN_STOPPED);
 owner_init(&o,false);assert(owner_prepare_export(&o));
 owner_step(&o,USB_CONFIGURED);
 assert(owner_step(&o,IO_FAILED)==(ACT_REVOKE_MSC|ACT_REPORT_FAULT));
 assert(owner_step(&o,HOST_RELEASED)==ACT_REPORT_FAULT && o.state==OWN_FAULT);
 return 0;
}
