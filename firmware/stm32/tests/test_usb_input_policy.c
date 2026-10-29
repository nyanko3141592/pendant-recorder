#include "../usb/usb_input_policy.h"
#include <assert.h>
#include <stdbool.h>
#include <stdint.h>
#include "../usb/usb_power_budget.h"
static bool vbus=true,mounted,suspended,off=true,fail_suspend,fail_resume;
static bool queued,grant_race,high,ack=true;
bool tud_configuration_acknowledged(void){return ack;}
static uint32_t epoch;
static unsigned grants,charge_calls;
static bool charging,charge_race;
bool board_usb_input_v15_charge_request(uint32_t expected){
 charge_calls++;if(charge_race){epoch++;high=false;charging=false;return false;}
 assert(high&&expected==epoch);charging=true;return true;
}
uint32_t board_usb_input_v15_epoch(void){return epoch;}
bool tud_task_event_ready(void){return queued;}
bool board_usb_input_v15_configured(unsigned ma,uint32_t expected){
 assert(ma==PENDANT_USB_GRANT_MA);if(grant_race){epoch++;high=false;charging=false;return false;}
 if(expected!=epoch)return false;high=true;grants++;return true;
}
static bool overflow;
bool tud_event_queue_overflowed(void){return overflow;}
static unsigned revokes,suspends,resumes,race;
bool tud_mounted(void){return mounted;}
bool tud_suspended(void){return suspended;}
bool board_usb_vbus_present(void){return vbus;}
void board_usb_input_v15_revoke(void){revokes++;epoch++;high=false;charging=false;}
bool board_usb_input_v15_suspend(void){suspends++;if(fail_suspend)return false;off=true;return true;}
bool board_usb_input_v15_resume(void){resumes++;if(fail_resume)return false;off=false;if(race==1)suspended=true;if(race==2)vbus=false;return true;}
void tud_mount_cb(void);void tud_umount_cb(void);void tud_suspend_cb(bool);void tud_resume_cb(void);
int main(void){
 usb_input_policy_init();assert(off&&revokes==1&&resumes==0);
 mounted=true;tud_mount_cb();assert(usb_input_policy_poll()&&off&&resumes==0);
 suspended=true;tud_suspend_cb(false);assert(off&&suspends==1);assert(usb_input_policy_poll()&&suspends==1);
 mounted=false;usb_input_policy_init();assert(off&&resumes==0); /* reset/session init never clears OFF */
 mounted=true;tud_mount_cb();assert(off);tud_resume_cb();assert(resumes==0); /* stale resume */
 suspended=false;tud_resume_cb();assert(!off&&resumes==1&&usb_input_policy_poll());
 suspended=true;tud_suspend_cb(false);suspended=false;race=1;tud_resume_cb();assert(off&&suspended); /* suspend during pulse */
 suspended=false;race=2;tud_resume_cb();assert(!vbus);unsigned n=revokes;assert(usb_input_policy_poll()&&revokes>n);
 n=resumes;tud_resume_cb();assert(resumes==n);tud_umount_cb();
 vbus=true;race=0;suspended=true;fail_suspend=true;usb_input_policy_init();assert(!usb_input_policy_poll());
 suspended=false;n=resumes;tud_resume_cb();assert(resumes==n); /* sticky fault inhibits resume */
 fail_suspend=false;fail_resume=true;usb_input_policy_init();tud_resume_cb();assert(!usb_input_policy_poll());
 fail_resume=false;overflow=true;usb_input_policy_init();n=resumes;
 tud_resume_cb();assert(resumes==n&&!usb_input_policy_poll());
 usb_input_policy_init();assert(!usb_input_policy_poll()); /* session restart cannot clear queue fault */
 overflow=false;usb_input_policy_init();vbus=true;mounted=true;suspended=false;
 queued=true;assert(usb_input_policy_poll()&&!high);
 queued=false;ack=false;assert(usb_input_policy_poll());
#if PENDANT_FIXED_USB_LIMIT
 assert(high); /* fixed 100mA hardware does not depend on enumeration ACK */
#else
 assert(!high);
#endif
 ack=true;unsigned before=grants;assert(usb_input_policy_poll());
#if PENDANT_USB_MAX_POWER_MA==500 || PENDANT_FIXED_USB_LIMIT
 assert(high&&grants==before+1);
#if PENDANT_EXPERIMENTAL_USB_CHARGING
 assert(charging&&charge_calls);
 charge_race=true;assert(usb_input_policy_poll()&&!charging&&!high);charge_race=false;
 assert(usb_input_policy_poll()&&charging);
 queued=true;assert(usb_input_policy_poll()&&!charging);queued=false;
 ack=false;assert(usb_input_policy_poll());
#if PENDANT_FIXED_USB_LIMIT
 assert(charging); /* data-less USB power source */
#else
 assert(!charging);
#endif
 ack=true;
 assert(usb_input_policy_poll()&&charging);
#endif
 /* Physical detach must revoke even when the stack has not delivered unmount.
  * Keep mounted/ACK stale to exercise the independent VBUS path. */
 assert(mounted&&ack&&!suspended);
 vbus=false;unsigned detach_grants=grants;
 assert(usb_input_policy_poll()&&!high&&!charging&&grants==detach_grants);
 n=resumes;tud_resume_cb();assert(resumes==n&&!high&&!charging);
 assert(usb_input_policy_poll()&&!high&&!charging&&grants==detach_grants);
 /* A fresh session is required by the application after actual detach. */
 mounted=false;ack=false;usb_input_policy_init();vbus=true;
 assert(usb_input_policy_poll());
#if PENDANT_FIXED_USB_LIMIT
 assert(high);
#if PENDANT_EXPERIMENTAL_USB_CHARGING
 assert(charging);
#endif
#else
 assert(!high&&!charging);
#endif
 mounted=true;assert(usb_input_policy_poll());
#if PENDANT_FIXED_USB_LIMIT
 assert(high);
#else
 assert(!high&&!charging);
#endif
 ack=true;assert(usb_input_policy_poll()&&high);
 grant_race=true;assert(usb_input_policy_poll()&&!high&&!charging);grant_race=false;
 assert(usb_input_policy_poll()&&high);mounted=false;assert(usb_input_policy_poll());
#if PENDANT_FIXED_USB_LIMIT
 assert(high);
#else
 assert(!high&&!charging);
#endif
 suspended=true;tud_suspend_cb(false);assert(usb_input_policy_poll()&&!high&&!charging);
 suspended=false;tud_resume_cb();assert(usb_input_policy_poll());
#if PENDANT_FIXED_USB_LIMIT
 assert(high);
#if PENDANT_EXPERIMENTAL_USB_CHARGING
 assert(charging);
#endif
#else
 assert(!high&&!charging);
#endif
#else
 assert(!high&&grants==before);
#endif
#if !PENDANT_EXPERIMENTAL_USB_CHARGING
 assert(charge_calls==0&&!charging);
#endif
 return 0;
}
