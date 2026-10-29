#include "../usb/usb_descriptors.h"
#include "tusb.h"
#include <assert.h>
int main(void){
 assert(!tud_descriptor_device_cb());uint32_t uid[3]={0x01234567,0x89abcdef,0xfedcba98};usb_descriptors_set_uid(uid);
 const tusb_desc_device_t *d=(const tusb_desc_device_t *)tud_descriptor_device_cb();assert(d&&d->bLength==18&&d->idVendor==0x1234&&d->idProduct==0x5678&&d->bNumConfigurations==1);
 const uint8_t *c=tud_descriptor_configuration_cb(0);assert(c&&c[2]==57&&c[3]==0&&c[4]==2&&c[7]==0x80&&c[8]==50);
 assert(c[9+5]==8&&c[9+6]==6&&c[9+7]==0x50);
 assert(c[20]==1&&c[21]==2&&c[22]==64&&c[27]==0x81&&c[28]==2&&c[29]==64);
 assert(c[32]==9&&c[33]==4&&c[34]==1&&c[37]==3); /* HID interface */
 assert(c[41]==9&&c[42]==0x21&&c[47]==0x22&&c[48]==23&&c[49]==0);
 assert(c[50]==7&&c[51]==5&&c[52]==0x82&&c[53]==3&&c[54]==64&&c[56]==10);
 const uint8_t *h=tud_hid_descriptor_report_cb(0);assert(h&&h[0]==0x06&&h[3]==0x09&&h[22]==0xc0);
 assert(!tud_hid_descriptor_report_cb(1));
 assert(!tud_descriptor_configuration_cb(1));
 const uint16_t *s=tud_descriptor_string_cb(3,0x0409);const char expected[]="0123456789ABCDEFFEDCBA98";
 assert((s[0]&255)==50);for(unsigned i=0;i<24;i++)assert(s[i+1]==expected[i]);
 assert(!tud_descriptor_string_cb(4,0x0409)&&!tud_descriptor_string_cb(3,0x0411));
 s=tud_descriptor_string_cb(0,0);assert(s[0]==0x0304&&s[1]==0x0409);
 usb_descriptors_set_uid(0);assert(!tud_descriptor_device_cb());return 0;
}
