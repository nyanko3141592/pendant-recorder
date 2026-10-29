#include "recorder_runtime.h"
#include "usb_board.h"
#include "storage_power.h"
#include "../usb/msc_storage.h"
#include "../usb/recipient_hid.h"
#include "recipient_flash.h"
#include "battery_io.h"
#include "tusb.h"
extern uint32_t HAL_GetTick(void);
#ifdef PENDANT_COOPERATIVE_SAVE
static bool capture_progress(void *ctx){
 recorder_runtime *r=ctx;
 return cooperative_pipeline_pump(r->pipeline,r->queue);
}
#endif
static bool fault(recorder_runtime *r){
 pendant_audio_fault_stop(r->audio);
 (void)owner_step(r->recording->store->owner,IO_FAILED);
 /* Failure remains terminal even if controller teardown itself fails. */
 if(board_usb_stop())r->usb_running=false;
 return false;
}
static bool stop_usb(recorder_runtime *r){
 if(!board_usb_stop())return false;
 r->usb_running=false;usb_session_init(&r->usb,r->recording->store->owner);return true;
}
static bool dispatch(recorder_runtime *r,unsigned actions){
 storage_owner *owner=r->recording->store->owner;
 for(unsigned steps=0;actions&&steps<8;steps++){
  if(actions&ACT_REPORT_FAULT)return fault(r);
  unsigned next=0;
  if(actions&ACT_STOP_AND_FLUSH)
   next|=recording_session_handoff(r->recording,r->pipeline,r->queue);
  if(actions&ACT_REVOKE_MSC){
   /* Eject while physically attached must not immediately remount on host. */
   r->usb_inhibited=owner->usb_connected;
   if(!stop_usb(r))return fault(r);
   next|=owner_step(owner,HOST_RELEASED);
  }
  if(actions&ACT_RECOVER_FS){
   if(!storage_mount_recordings(r->disk,r->fs,r->recording->filesystem->recording,
                               r->recording->filesystem,&r->free_bytes))return fault(r);
   if(r->cleanup_pending){
    bool cleaned=fatfs_recording_delete_range(r->recording->filesystem->recording,
                                               r->cleanup_first,r->cleanup_last);
    recipient_hid_cleanup_complete(cleaned);r->cleanup_pending=false;
    if(!cleaned)return fault(r);
   }
   next|=owner_step(owner,RECOVERY_OK);
  }
  if(actions&ACT_RESUME_RECORDING){
   if(!recording_capture_start(r->recording,r->pipeline,r->queue,r->audio,r->filter))return fault(r);
  }
  /* MSC callbacks become ready solely through OWN_HOST, after unmount. */
  if((actions&ACT_EXPOSE_MSC)&&!owner_host_can_access(owner))return fault(r);
  actions=next;
 }
 return actions?fault(r):true;
}
bool recorder_runtime_start(recorder_runtime *r){
 if(!r||r->initialized||!r->recording||!r->recording->store||!r->disk||!r->fs||
    r->disk->owner!=r->recording->store->owner||!r->disk->ready||tud_inited()||
    !recording_session_can_start(r->recording,r->pipeline,r->queue))return false;
 if(!recording_capture_start(r->recording,r->pipeline,r->queue,r->audio,r->filter))return false;
 board_usb_vbus_init();msc_storage_bind(r->disk);
 recipient_hid_init(board_recipient_flash_load,NULL);
 usb_session_init(&r->usb,r->disk->owner);
 r->usb_running=false;r->usb_inhibited=false;r->initialized=true;return true;
}
bool recorder_runtime_poll(recorder_runtime *r){
 if(!r||!r->initialized||__get_IPSR()||__get_PRIMASK())return false;
 storage_owner *owner=r->recording->store->owner;
 if(owner->fault_pending||owner->state==OWN_FAULT)return fault(r);
 bool vbus=board_usb_vbus_present();unsigned actions=0;
 bool pressed=vbus&&board_battery_button_pressed();
 if(r->cleanup_release_required){
  recipient_hid_set_cleanup_authorized(false);
  if(!pressed)r->cleanup_release_required=false;
 }else if(!pressed){
  r->cleanup_button_down=false;recipient_hid_set_cleanup_authorized(false);
 }else if(!r->cleanup_button_down){
  r->cleanup_button_down=true;r->cleanup_button_since=HAL_GetTick();
  recipient_hid_set_cleanup_authorized(false);
 }else recipient_hid_set_cleanup_authorized((uint32_t)(HAL_GetTick()-r->cleanup_button_since)>=2000U);
 if(!vbus){
  r->usb_inhibited=false;
  if(r->usb_running){
   actions=owner_step(owner,USB_DISCONNECTED);
   if(!(actions&ACT_REVOKE_MSC)&&!stop_usb(r))return fault(r);
  }
 }else if(!r->usb_running&&!r->usb_inhibited&&owner_device_can_access(owner)){
  const tusb_rhport_init_t config={.role=TUSB_ROLE_DEVICE,.speed=TUSB_SPEED_FULL};
  if(!board_usb_prepare()||!tusb_rhport_init(0,&config))return fault(r);
  r->usb_running=true;
 }
 if(r->usb_running&&vbus){
  actions|=usb_session_service(&r->usb);
  uint32_t first,last;
  if(recipient_hid_take_cleanup(&first,&last)){
   if(r->cleanup_pending)return fault(r);
   r->cleanup_pending=true;r->cleanup_first=first;r->cleanup_last=last;
   r->cleanup_button_down=false;r->cleanup_release_required=true;
   recipient_hid_set_cleanup_authorized(false);
  }
 }
 if(!dispatch(r,actions))return false;
 #ifdef PENDANT_COOPERATIVE_SAVE
 /* Rebind after recovery as board_storage_open deliberately clears hooks. */
 board_storage_set_progress(r->disk,capture_progress,r);
#endif
 if(owner_device_can_access(owner)&&
    !recording_session_service(r->recording,r->pipeline,r->queue))return fault(r);
 return true;
}

bool recorder_runtime_stop(recorder_runtime *r){
 if(!r||!r->initialized||__get_IPSR()||__get_PRIMASK())return false;
 storage_owner *o=r->recording->store->owner;
 if(o->state==OWN_STOPPED)return true;
 if(o->state!=OWN_DEVICE && o->state!=OWN_DRAINING)return false;
 if(!dispatch(r,owner_step(o,STOP_RECORDING)))return false;
 if(o->state!=OWN_STOPPED)return false;
 if(r->usb_running&&!stop_usb(r))return fault(r);
 if(!pendant_audio_shutdown(r->audio))return fault(r);
 if(!board_storage_power_shutdown())return fault(r);
 r->disk->ready=false;
 r->usb_inhibited=true;
 return true;
}
