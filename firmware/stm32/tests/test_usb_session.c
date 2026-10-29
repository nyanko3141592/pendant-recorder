#include "../usb/usb_session.h"
#include "tusb.h"
#include <assert.h>
static bool mounted;
extern bool test_usb_suspended,test_input_suspend_failure,test_usb_queue_overflow;
bool board_usb_vbus_present(void){return true;}
static unsigned deferred;
bool tud_mounted(void){return mounted;}
void tud_task_ext(uint32_t timeout,bool isr){assert(!timeout&&!isr);}
unsigned msc_storage_take_actions(void){unsigned a=deferred;deferred=0;return a;}
int main(void){
 storage_owner owner;owner_init(&owner,true);usb_session s;usb_session_init(&s,&owner);
 assert(usb_session_service(&s)==0);mounted=true;assert(usb_session_service(&s)==ACT_STOP_AND_FLUSH);
 owner_step(&owner,DEVICE_RELEASED);assert(usb_session_service(&s)==0);
 /* Bus reset/deconfiguration must revoke even without tud_umount_cb. */
 mounted=false;assert(usb_session_service(&s)==ACT_REVOKE_MSC);
 mounted=true;assert(usb_session_service(&s)==0&&s.pending_configuration&&owner.state==OWN_RECOVERING);
 assert(owner_step(&owner,HOST_RELEASED)==ACT_RECOVER_FS);
 owner_step(&owner,RECOVERY_OK);assert(usb_session_service(&s)==ACT_STOP_AND_FLUSH);
 owner_step(&owner,DEVICE_RELEASED);
 deferred=owner_step(&owner,HOST_EJECTED);assert(usb_session_service(&s)==ACT_REVOKE_MSC);
 owner_step(&owner,HOST_RELEASED);owner_step(&owner,RECOVERY_OK);
 assert(usb_session_service(&s)==0&&owner.state==OWN_DEVICE); /* no eject/remount loop */
 mounted=false;assert(usb_session_service(&s)==0);mounted=true;assert(usb_session_service(&s)==ACT_STOP_AND_FLUSH);
 mounted=false;assert(usb_session_service(&s)==0&&owner.state==OWN_DRAINING);
 assert(owner_step(&owner,DEVICE_RELEASED)==ACT_RECOVER_FS);
 test_usb_suspended=true;test_input_suspend_failure=true;
 assert(usb_session_service(&s)&ACT_REPORT_FAULT);
 test_input_suspend_failure=false;assert(usb_session_service(&s)&ACT_REPORT_FAULT);
 test_usb_suspended=false;usb_session_init(&s,&owner);test_usb_queue_overflow=true;
 assert(usb_session_service(&s)&ACT_REPORT_FAULT);
 usb_session_init(&s,&owner);assert(usb_session_service(&s)&ACT_REPORT_FAULT);
 return 0;
}
