#include "recipient_hid.h"
#include "tusb.h"
#include <assert.h>
#include <string.h>

static bool present;static uint8_t stored[32];
static bool load(void *ctx,uint8_t out[32]){assert(ctx==(void *)1);if(!present)return false;memcpy(out,stored,32);return true;}
static uint32_t crc32(const uint8_t *p,unsigned n){uint32_t c=~0u;while(n--){c^=*p++;for(unsigned b=0;b<8;b++)c=(c>>1)^((0u-(c&1u))&0xedb88320u);}return ~c;}
static void request(uint8_t r[64],const uint8_t key[32]){memset(r,0,64);r[0]=1;r[1]=1;memcpy(r+4,key,32);uint32_t c=crc32(r,36);memcpy(r+36,&c,4);}
static void cleanup(uint8_t r[64],uint32_t first,uint32_t last){memset(r,0,64);r[0]=1;r[1]=2;memcpy(r+4,&first,4);memcpy(r+8,&last,4);uint32_t c=crc32(r,36);memcpy(r+36,&c,4);}
int main(void){
 uint8_t key[32],other[32],r[64],out[32];for(unsigned i=0;i<32;i++){key[i]=(uint8_t)(i+1);other[i]=(uint8_t)(0x80+i);}
 recipient_hid_init(load,(void *)1);assert(recipient_hid_current_status()==RECIPIENT_HID_UNPROVISIONED);
 assert(tud_hid_get_report_cb(0,1,HID_REPORT_TYPE_FEATURE,r,64)==64&&r[0]==1&&r[1]==RECIPIENT_HID_UNPROVISIONED);
 request(r,key);r[36]^=1;tud_hid_set_report_cb(0,1,HID_REPORT_TYPE_FEATURE,r,64);assert(!recipient_hid_take_pending(out));
 request(r,key);tud_hid_set_report_cb(0,1,HID_REPORT_TYPE_FEATURE,r,64);
 assert(recipient_hid_current_status()==RECIPIENT_HID_CONFIRM_REQUIRED&&!recipient_hid_take_pending(out));
 recipient_hid_set_provision_authorized(true);assert(recipient_hid_current_status()==RECIPIENT_HID_UNPROVISIONED);
 request(r,key);tud_hid_set_report_cb(0,1,HID_REPORT_TYPE_FEATURE,r,64);assert(recipient_hid_current_status()==RECIPIENT_HID_PENDING);
 assert(recipient_hid_take_pending(out)&&!memcmp(out,key,32));assert(!recipient_hid_take_pending(out));
 recipient_hid_complete(true,key);assert(recipient_hid_current_status()==RECIPIENT_HID_PROVISIONED);
 request(r,other);tud_hid_set_report_cb(0,1,HID_REPORT_TYPE_FEATURE,r,64);assert(!recipient_hid_take_pending(out));
 assert(tud_hid_get_report_cb(0,1,HID_REPORT_TYPE_FEATURE,r,64)==64&&!memcmp(r+4,key,32));
 uint32_t first=0,last=0;cleanup(r,7,99);tud_hid_set_report_cb(0,1,HID_REPORT_TYPE_FEATURE,r,64);
 assert(!recipient_hid_take_cleanup(&first,&last));
 assert(tud_hid_get_report_cb(0,1,HID_REPORT_TYPE_FEATURE,r,64)==64&&r[2]==4);
 recipient_hid_set_cleanup_authorized(true);cleanup(r,7,99);tud_hid_set_report_cb(0,1,HID_REPORT_TYPE_FEATURE,r,64);
 assert(recipient_hid_take_cleanup(&first,&last)&&first==7&&last==99);assert(!recipient_hid_take_cleanup(&first,&last));
 recipient_hid_cleanup_complete(true);assert(tud_hid_get_report_cb(0,1,HID_REPORT_TYPE_FEATURE,r,64)==64&&r[2]==2);
 recipient_hid_set_cleanup_authorized(true);cleanup(r,100,101);tud_hid_set_report_cb(0,1,HID_REPORT_TYPE_FEATURE,r,64);
 assert(recipient_hid_take_cleanup(&first,&last)&&first==100&&last==101);
 memcpy(stored,key,32);present=true;recipient_hid_init(load,(void *)1);assert(recipient_hid_current_status()==RECIPIENT_HID_PROVISIONED);
 present=false;recipient_hid_init(load,(void *)1);recipient_hid_set_provision_authorized(true);request(r,key);tud_hid_set_report_cb(0,1,HID_REPORT_TYPE_FEATURE,r,64);
 assert(recipient_hid_take_pending(out));recipient_hid_complete(false,key);assert(recipient_hid_current_status()==RECIPIENT_HID_FAILED);
 return 0;
}
