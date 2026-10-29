#include "recipient_hid.h"
#include "tusb.h"
#include <string.h>

_Static_assert(CFG_TUD_HID_EP_BUFSIZE>=RECIPIENT_HID_REPORT_BYTES+1,
 "HID control buffer must include the report-ID byte");

static recipient_hid_status status;
static uint8_t current[32],pending[32];
static bool pending_ready;
static bool cleanup_ready;static uint32_t cleanup_first,cleanup_last;static uint8_t cleanup_status;
static bool cleanup_authorized;
static bool provision_authorized;

static uint32_t load32(const uint8_t *p){
 return (uint32_t)p[0]|((uint32_t)p[1]<<8)|((uint32_t)p[2]<<16)|((uint32_t)p[3]<<24);
}
static uint32_t crc32(const uint8_t *p,unsigned n){
 uint32_t crc=0xffffffffu;
 while(n--){crc^=*p++;for(unsigned b=0;b<8;b++)crc=(crc>>1)^((0u-(crc&1u))&0xedb88320u);}
 return ~crc;
}
static bool nonzero(const uint8_t *p){uint8_t any=0;for(unsigned i=0;i<32;i++)any|=p[i];return any!=0;}

void recipient_hid_init(recipient_hid_load_fn load,void *context){
 memset(current,0,sizeof current);memset(pending,0,sizeof pending);pending_ready=false;
 cleanup_ready=false;cleanup_first=cleanup_last=0;cleanup_status=0;
 cleanup_authorized=false;
 provision_authorized=false;
 status=load&&load(context,current)&&nonzero(current)?RECIPIENT_HID_PROVISIONED:RECIPIENT_HID_UNPROVISIONED;
}
bool recipient_hid_take_pending(uint8_t recipient[32]){
 if(!recipient||!pending_ready||status!=RECIPIENT_HID_PENDING)return false;
 memcpy(recipient,pending,32);pending_ready=false;return true;
}
void recipient_hid_complete(bool committed,const uint8_t recipient[32]){
 if(status!=RECIPIENT_HID_PENDING)return;
 if(committed&&recipient&&nonzero(recipient)){memcpy(current,recipient,32);status=RECIPIENT_HID_PROVISIONED;}
 else status=RECIPIENT_HID_FAILED;
 memset(pending,0,sizeof pending);pending_ready=false;
}
recipient_hid_status recipient_hid_current_status(void){return status;}
void recipient_hid_set_provision_authorized(bool authorized){
 provision_authorized=authorized;
 if(authorized&&status==RECIPIENT_HID_CONFIRM_REQUIRED)status=RECIPIENT_HID_UNPROVISIONED;
}
void recipient_hid_set_cleanup_authorized(bool authorized){cleanup_authorized=authorized;}
bool recipient_hid_take_cleanup(uint32_t *first,uint32_t *last){
 if(!first||!last||!cleanup_ready||cleanup_status!=1)return false;
 *first=cleanup_first;*last=cleanup_last;cleanup_ready=false;return true;
}
void recipient_hid_cleanup_complete(bool applied){cleanup_status=applied?2:3;}

uint16_t tud_hid_get_report_cb(uint8_t instance,uint8_t report_id,
 hid_report_type_t report_type,uint8_t *buffer,uint16_t reqlen){
 if(instance||report_id!=RECIPIENT_HID_REPORT_ID||report_type!=HID_REPORT_TYPE_FEATURE||
    !buffer||reqlen<RECIPIENT_HID_REPORT_BYTES)return 0;
 memset(buffer,0,RECIPIENT_HID_REPORT_BYTES);buffer[0]=1;buffer[1]=(uint8_t)status;
 buffer[2]=cleanup_status;
 if(status==RECIPIENT_HID_PROVISIONED)memcpy(buffer+4,current,32);
 uint32_t crc=crc32(buffer,36);buffer[36]=(uint8_t)crc;buffer[37]=(uint8_t)(crc>>8);
 buffer[38]=(uint8_t)(crc>>16);buffer[39]=(uint8_t)(crc>>24);
 return RECIPIENT_HID_REPORT_BYTES;
}
void tud_hid_set_report_cb(uint8_t instance,uint8_t report_id,
 hid_report_type_t report_type,const uint8_t *buffer,uint16_t size){
 if(instance||report_id!=RECIPIENT_HID_REPORT_ID||report_type!=HID_REPORT_TYPE_FEATURE||
    !buffer||size!=RECIPIENT_HID_REPORT_BYTES)return;
 if(buffer[0]!=1||buffer[2]||buffer[3]||load32(buffer+36)!=crc32(buffer,36))return;
 if(buffer[1]==1&&status==RECIPIENT_HID_UNPROVISIONED&&nonzero(buffer+4)){
  if(!provision_authorized){status=RECIPIENT_HID_CONFIRM_REQUIRED;return;}
  provision_authorized=false;
  memcpy(pending,buffer+4,32);pending_ready=true;status=RECIPIENT_HID_PENDING;return;
 }
 if(buffer[1]==2&&status==RECIPIENT_HID_PROVISIONED&&cleanup_status!=1&&!cleanup_ready){
  if(!cleanup_authorized){cleanup_status=4;return;}
  uint32_t first=load32(buffer+4),last=load32(buffer+8);
  if(first<=last){cleanup_first=first;cleanup_last=last;cleanup_ready=true;cleanup_status=1;cleanup_authorized=false;}
 }
}
