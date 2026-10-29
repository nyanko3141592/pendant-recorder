#include "../board/recorder_runtime.h"
#include "../usb/recipient_hid.h"
#include "tusb.h"
#include <assert.h>
#ifdef PENDANT_COOPERATIVE_SAVE
static unsigned binds;
void board_storage_set_progress(board_storage *d,bool (*pump)(void *),void *ctx){
 assert(d&&pump&&ctx);d->progress=pump;d->progress_ctx=ctx;binds++;
 recorder_runtime *r=ctx;
 if(d->owner->state==OWN_DEVICE){assert(r->pipeline&&!r->pipeline->failed);assert(pump(ctx));}
}
#endif
static bool vbus,usb_on,mounted,stop_failure;
extern bool test_charge_requested;
static bool button_pressed,cleanup_authorized;static uint32_t tick;
static bool cleanup_offer,cleanup_completed;static unsigned cleanup_deletes;
static unsigned starts,services,stops,recoveries,faults,deferred;
unsigned __get_IPSR(void){return 0;}
unsigned __get_PRIMASK(void){return 0;}
void board_usb_vbus_init(void){}
bool board_usb_vbus_present(void){return vbus;}
bool board_battery_button_pressed(void){return button_pressed;}
uint32_t HAL_GetTick(void){return tick;}
bool board_usb_prepare(void){return vbus;}
bool board_usb_stop(void){stops++;if(stop_failure)return false;usb_on=false;mounted=false;return true;}
bool tud_inited(void){return usb_on;}
bool tud_mounted(void){return mounted;}
bool tusb_rhport_init(uint8_t port,const tusb_rhport_init_t *cfg){assert(!port&&cfg->role==TUSB_ROLE_DEVICE);usb_on=true;return true;}
void tud_task_ext(uint32_t timeout,bool isr){assert(!timeout&&!isr);}
void msc_storage_bind(board_storage *disk){assert(disk&&disk->ready);}
bool board_recipient_flash_load(void *context,uint8_t recipient[32]){(void)context;(void)recipient;return true;}
void recipient_hid_init(recipient_hid_load_fn load,void *context){assert(load==board_recipient_flash_load&&!context);}
void recipient_hid_set_cleanup_authorized(bool authorized){cleanup_authorized=authorized;}
bool recipient_hid_take_cleanup(uint32_t *first,uint32_t *last){if(!cleanup_offer)return false;cleanup_offer=false;*first=5;*last=9;return true;}
void recipient_hid_cleanup_complete(bool applied){assert(applied);cleanup_completed=true;}
bool fatfs_recording_delete_range(fatfs_recording *s,uint32_t first,uint32_t last){assert(s&&first==5&&last==9);cleanup_deletes++;return true;}
unsigned msc_storage_take_actions(void){unsigned a=deferred;deferred=0;return a;}
void pendant_audio_fault_stop(MDF_HandleTypeDef *h){assert(h);faults++;}
bool recording_session_can_start(recording_session *s,recording_pipeline *p,audio_queue *q){
 assert(p&&q);return s->filesystem->mounted&&s->store->owner->state==OWN_DEVICE;
}
bool recording_capture_start(recording_session *s,recording_pipeline *p,audio_queue *q,MDF_HandleTypeDef *h,const MDF_FilterConfigTypeDef *f){
 assert(h&&f&&recording_session_can_start(s,p,q));starts++;return true;
}
bool recording_session_service(recording_session *s,recording_pipeline *p,audio_queue *q){
 assert(recording_session_can_start(s,p,q));services++;return true;
}
unsigned recording_session_handoff(recording_session *s,recording_pipeline *p,audio_queue *q){
 assert(p&&q&&s->filesystem->mounted&&s->store->owner->state==OWN_DRAINING);
 s->filesystem->mounted=false;return owner_step(s->store->owner,DEVICE_RELEASED);
}
bool storage_mount_recordings(board_storage *disk,FATFS *fs,fatfs_recording *recording,storage_handoff *handoff,uint64_t *bytes){
 assert(fs&&recording&&!usb_on&&!handoff->mounted&&owner_device_can_recover(disk->owner));
 handoff->mounted=true;*bytes=123;recoveries++;return true;
}
static unsigned power_off_calls,audio_shutdown_calls;
bool pendant_audio_shutdown(MDF_HandleTypeDef *h){assert(h&&!usb_on);audio_shutdown_calls++;return true;}
static bool power_off_failure;
bool board_storage_power_shutdown(void){assert(!usb_on);power_off_calls++;return !power_off_failure;}
int main(void){
 storage_owner owner;owner_init(&owner,true);
 recording_store store={.owner=&owner};fatfs_recording files={0};
 storage_handoff handoff={.owner=&owner,.recording=&files,.mounted=true};
 recording_session session={.store=&store,.filesystem=&handoff};
 static recording_pipeline p;static audio_queue q;MDF_HandleTypeDef audio={0};MDF_FilterConfigTypeDef filter={0};
 board_storage disk={.owner=&owner,.ready=true};FATFS fs;
 recorder_runtime r={.recording=&session,.pipeline=&p,.queue=&q,.audio=&audio,.filter=&filter,.disk=&disk,.fs=&fs};
 unsigned before;
 #ifdef PENDANT_COOPERATIVE_SAVE
 recording_pipeline_init(&p);audio_queue_init(&q);
#endif
 assert(recorder_runtime_start(&r)&&starts==1);assert(!recorder_runtime_start(&r));
 assert(recorder_runtime_poll(&r)&&services==1&&!usb_on);
 vbus=true;before=services;assert(recorder_runtime_poll(&r)&&usb_on&&owner.state==OWN_DEVICE);
 assert(services==before+1); /* power-only/unconfigured attachment keeps recording */
#if PENDANT_EXPERIMENTAL_USB_CHARGING
 assert(test_charge_requested); /* fixed-100mA path charges without enumeration */
#else
 assert(!test_charge_requested);
#endif
 button_pressed=true;tick=100;assert(recorder_runtime_poll(&r)&&!cleanup_authorized);
 tick=2099;assert(recorder_runtime_poll(&r)&&!cleanup_authorized);
 tick=2100;assert(recorder_runtime_poll(&r)&&cleanup_authorized);
 cleanup_offer=true;mounted=true;assert(recorder_runtime_poll(&r)&&owner.state==OWN_HOST&&!handoff.mounted&&r.cleanup_pending);
 assert(!cleanup_authorized&&r.cleanup_release_required);
 before=services;assert(recorder_runtime_poll(&r)&&services==before);
 button_pressed=false;vbus=false;assert(recorder_runtime_poll(&r));
 assert(!usb_on&&owner.state==OWN_DEVICE&&handoff.mounted&&recoveries==1&&starts==2);
 assert(cleanup_deletes==1&&cleanup_completed&&!r.cleanup_pending);
 /* Fresh connection and host eject while VBUS remains high. */
 vbus=true;assert(recorder_runtime_poll(&r));mounted=true;assert(recorder_runtime_poll(&r));
 deferred=owner_step(&owner,HOST_EJECTED);assert(recorder_runtime_poll(&r));
 assert(r.usb_inhibited&&!usb_on&&owner.state==OWN_DEVICE&&starts==3);
 assert(recorder_runtime_poll(&r)&&!usb_on);vbus=false;assert(recorder_runtime_poll(&r));
 vbus=true;assert(recorder_runtime_poll(&r)&&usb_on);mounted=true;assert(recorder_runtime_poll(&r));
 /* Never remount or resume if USB teardown has not completed. */
 stop_failure=true;vbus=false;before=recoveries;
 assert(!recorder_runtime_poll(&r)&&recoveries==before&&owner.fault_pending&&faults);
 assert(!handoff.mounted&&starts==3);
#ifdef PENDANT_COOPERATIVE_SAVE
 assert(binds>=3&&disk.progress_ctx==&r);
#endif
 /* Reset fixture and exercise controlled stop with attached, unconfigured USB. */
 stop_failure=false;usb_on=false;mounted=false;vbus=true;
 owner_init(&owner,true);handoff.mounted=true;r.initialized=false;
 assert(recorder_runtime_start(&r));assert(recorder_runtime_poll(&r)&&usb_on);
 before=services;unsigned start_before=starts,recover_before=recoveries;
 assert(recorder_runtime_stop(&r));
 assert(owner.state==OWN_STOPPED&&!handoff.mounted&&!usb_on&&!disk.ready&&power_off_calls==1&&audio_shutdown_calls==1);
 assert(recorder_runtime_stop(&r)&&power_off_calls==1);
 assert(recorder_runtime_poll(&r)&&services==before&&starts==start_before&&recoveries==recover_before);
 owner_init(&owner,true);owner_step(&owner,USB_CONFIGURED);owner_step(&owner,DEVICE_RELEASED);
 assert(!recorder_runtime_stop(&r)&&owner.state==OWN_HOST);
 owner_init(&owner,true);handoff.mounted=true;disk.ready=true;power_off_failure=true;
 assert(!recorder_runtime_stop(&r)&&owner.state==OWN_FAULT&&!handoff.mounted);
 return 0;
}
