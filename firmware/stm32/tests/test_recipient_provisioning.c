#include "../board/recipient_provisioning.h"
#include "../usb/recipient_hid.h"
#include "../usb/msc_storage.h"
#include "tusb.h"
#include <assert.h>
#include <string.h>

static bool vbus=true,usb,pending=true,committed,completed,reset_seen,authorized;
static uint32_t tick;
extern bool test_charge_request_seen;
static uint8_t key[32];
unsigned __get_IPSR(void){return 0;}unsigned __get_PRIMASK(void){return 0;}uint32_t HAL_GetTick(void){return tick;}
void __WFI(void){if(committed)vbus=false;else tick+=1000;}
void board_usb_vbus_init(void){}bool board_usb_vbus_present(void){return vbus;}
bool board_usb_prepare(void){return vbus;}bool board_usb_stop(void){usb=false;return true;}
bool tud_mounted(void){return false;}
void msc_storage_bind(board_storage *p){assert(!p);}
bool tusb_rhport_init(uint8_t p,const tusb_rhport_init_t *c){assert(!p&&c);usb=true;return true;}
void tud_task_ext(uint32_t t,bool i){assert(!t&&!i&&usb);}
void recipient_hid_init(recipient_hid_load_fn f,void *c){uint8_t x[32];assert(f&&!c&&!f(c,x));}
recipient_hid_status recipient_hid_current_status(void){return RECIPIENT_HID_UNPROVISIONED;}
void recipient_hid_set_provision_authorized(bool ok){authorized=ok;}
bool board_battery_button_pressed(void){return tick!=1000;}
bool recipient_hid_take_pending(uint8_t out[32]){if(!pending||!authorized)return false;pending=false;authorized=false;memcpy(out,key,32);return true;}
void recipient_hid_complete(bool ok,const uint8_t recipient[32]){assert(ok&&!memcmp(recipient,key,32));completed=true;}
bool board_recipient_flash_commit(const uint8_t recipient[32]){assert(!memcmp(recipient,key,32));committed=true;return true;}
bool board_recipient_flash_load(void *c,uint8_t out[32]){(void)c;if(!committed)return false;memcpy(out,key,32);return true;}
void NVIC_SystemReset(void){reset_seen=true;}
int main(void){for(unsigned i=0;i<32;i++)key[i]=(uint8_t)(i+1);assert(!board_recipient_provisioning_run());assert(completed&&reset_seen&&!usb&&tick>=4000);
#if PENDANT_EXPERIMENTAL_USB_CHARGING
 assert(test_charge_request_seen); /* unprovisioned path can charge pre-enumeration */
#else
 assert(!test_charge_request_seen);
#endif
 return 0;}
