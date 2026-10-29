#include "usb_session.h"
#include "usb_input_policy.h"
#include "msc_storage.h"
#include "tusb.h"
#if CFG_TUD_TASK_EVENTS_PER_RUN != 1
#error One event per service required to observe bus reset before reconfiguration
#endif
void usb_session_init(usb_session *s,storage_owner *o){*s=(usb_session){.owner=o};usb_input_policy_init();}
unsigned usb_session_service(usb_session *s){
 if(!s||!s->owner)return ACT_REPORT_FAULT;
 tud_task_ext(0,false);
 unsigned actions=msc_storage_take_actions();
 if(!usb_input_policy_poll())actions|=ACT_REPORT_FAULT;
 bool configured=tud_mounted();
 if(configured!=s->configured){
  s->configured=configured;
  if(configured){
   s->pending_configuration=true;
   actions|=owner_step(s->owner,USB_CONFIGURED);
   if(s->owner->state==OWN_DRAINING)s->pending_configuration=false;
  }else{
   s->pending_configuration=false;
   actions|=owner_step(s->owner,USB_DISCONNECTED);
  }
 }
 /* Reconnect while recovery owns the medium cannot bypass recovery. Replay
  * only after application has completed recovery and emitted RECOVERY_OK. */
 if(s->pending_configuration&&configured&&owner_device_can_access(s->owner)){
  s->pending_configuration=false;actions|=owner_step(s->owner,USB_CONFIGURED);
 }
 return actions;
}
