#include "usb_descriptors.h"
#include "usb_power_budget.h"
#include "tusb.h"
#include <string.h>
#if !defined(PENDANT_USB_VID) || !defined(PENDANT_USB_PID)
#error Set explicitly allocated PENDANT_USB_VID and PENDANT_USB_PID; no borrowed default
#endif
_Static_assert(PENDANT_USB_VID>0 && PENDANT_USB_VID<65535,"invalid VID");
_Static_assert(PENDANT_USB_PID>0 && PENDANT_USB_PID<65535,"invalid PID");
static char serial[25];
static bool identity_ready;
void usb_descriptors_set_uid(const uint32_t uid[3]){
 identity_ready=false;if(!uid)return;
 static const char hex[]="0123456789ABCDEF";
 for(unsigned word=0;word<3;word++)for(unsigned digit=0;digit<8;digit++)
  serial[word*8+digit]=hex[(uid[word]>>(28-4*digit))&15];
 serial[24]=0;identity_ready=true;
}
static const tusb_desc_device_t device={
 .bLength=sizeof(tusb_desc_device_t),.bDescriptorType=TUSB_DESC_DEVICE,
 .bcdUSB=0x0200,.bDeviceClass=0,.bDeviceSubClass=0,.bDeviceProtocol=0,
 .bMaxPacketSize0=64,.idVendor=PENDANT_USB_VID,.idProduct=PENDANT_USB_PID,
 .bcdDevice=0x0012,.iManufacturer=1,.iProduct=2,.iSerialNumber=3,.bNumConfigurations=1
};
static const uint8_t hid_report[]={
 0x06,0x00,0xff,       /* Usage Page (vendor 0xff00) */
 0x09,0x01,            /* Usage 1 */
 0xa1,0x01,            /* Application collection */
 0x85,0x01,            /* Report ID 1 */
 0x15,0x00,0x26,0xff,0x00, /* Logical 0..255 */
 0x75,0x08,0x95,0x40,  /* 64 bytes */
 0x09,0x02,0xb1,0x02,  /* Feature, data/variable/absolute */
 0xc0
};
static const uint8_t configuration[]={
 /* Bus powered, 100mA declared ceiling; no remote wake. Battery operation
  * disconnected does not promise VBUS-independent USB transceiver power. */
 TUD_CONFIG_DESCRIPTOR(1,2,0,TUD_CONFIG_DESC_LEN+TUD_MSC_DESC_LEN+TUD_HID_DESC_LEN,0,PENDANT_USB_MAX_POWER_MA),
 TUD_MSC_DESCRIPTOR(0,0,0x01,0x81,64),
 TUD_HID_DESCRIPTOR(1,0,HID_ITF_PROTOCOL_NONE,sizeof hid_report,0x82,64,10)
};
const uint8_t *tud_descriptor_device_cb(void){return identity_ready?(const uint8_t *)&device:NULL;}
const uint8_t *tud_descriptor_configuration_cb(uint8_t index){return identity_ready&&index==0?configuration:NULL;}
const uint8_t *tud_hid_descriptor_report_cb(uint8_t instance){return identity_ready&&instance==0?hid_report:NULL;}
const uint16_t *tud_descriptor_string_cb(uint8_t index,uint16_t langid){
 static uint16_t result[33];if(!identity_ready)return NULL;
 if(index==0){result[0]=(TUSB_DESC_STRING<<8)|4;result[1]=0x0409;return result;}
 if(langid!=0x0409)return NULL;
 const char *s=index==1?"Pendant Project":index==2?"Pendant Recorder":index==3?serial:NULL;
 if(!s)return NULL;size_t n=strlen(s);if(n>32)return NULL;
 for(size_t i=0;i<n;i++)result[i+1]=(uint8_t)s[i];
 result[0]=(uint16_t)((TUSB_DESC_STRING<<8)|(2*n+2));return result;
}
