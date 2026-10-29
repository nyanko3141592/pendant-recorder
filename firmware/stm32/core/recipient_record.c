#include "recipient_record.h"
#include <string.h>

static const uint8_t magic[4]={'P','R','K','1'};

static uint32_t load32(const uint8_t *p){
 return (uint32_t)p[0]|((uint32_t)p[1]<<8)|((uint32_t)p[2]<<16)|((uint32_t)p[3]<<24);
}
static void store32(uint8_t *p,uint32_t v){
 p[0]=(uint8_t)v;p[1]=(uint8_t)(v>>8);p[2]=(uint8_t)(v>>16);p[3]=(uint8_t)(v>>24);
}
static uint32_t crc32(const uint8_t *p,size_t n){
 uint32_t crc=0xffffffffu;
 while(n--){crc^=*p++;for(unsigned b=0;b<8;b++)crc=(crc>>1)^((0u-(crc&1u))&0xedb88320u);}
 return ~crc;
}
static bool nonzero(const uint8_t recipient[32]){
 uint8_t any=0;for(size_t i=0;i<32;i++)any|=recipient[i];return any!=0;
}
static bool erased(const uint8_t slot[RECIPIENT_RECORD_BYTES]){
 uint8_t all=0xff;for(size_t i=0;i<RECIPIENT_RECORD_BYTES;i++)all&=slot[i];return all==0xff;
}
bool recipient_record_decode(const uint8_t slot[RECIPIENT_RECORD_BYTES],uint8_t recipient[32]){
 if(!slot||!recipient||memcmp(slot,magic,4)||slot[4]!=1||slot[5]||slot[6]||slot[7]||
    load32(slot+RECIPIENT_COMMIT_OFFSET)!=RECIPIENT_COMMIT_WORD||
    load32(slot+40)!=crc32(slot,40)||!nonzero(slot+8))return false;
 memcpy(recipient,slot+8,32);return true;
}
bool recipient_record_prepare(const uint8_t recipient[32],uint8_t image[RECIPIENT_RECORD_BYTES]){
 if(!recipient||!image||!nonzero(recipient))return false;
 memset(image,0xff,RECIPIENT_RECORD_BYTES);memcpy(image,magic,4);
 image[4]=1;image[5]=image[6]=image[7]=0;memcpy(image+8,recipient,32);
 store32(image+40,crc32(image,40));return true;
}
recipient_plan_result recipient_record_plan(
 const uint8_t slots[RECIPIENT_RECORD_SLOTS][RECIPIENT_RECORD_BYTES],
 const uint8_t recipient[32],size_t *slot_index){
 if(!slots||!recipient||!slot_index||!nonzero(recipient))return RECIPIENT_PLAN_INVALID_INPUT;
 uint8_t found[32];
 for(size_t i=0;i<RECIPIENT_RECORD_SLOTS;i++)
  if(recipient_record_decode(slots[i],found))return RECIPIENT_PLAN_ALREADY_PROVISIONED;
 for(size_t i=0;i<RECIPIENT_RECORD_SLOTS;i++)if(erased(slots[i])){
  *slot_index=i;return RECIPIENT_PLAN_WRITE_SLOT;
 }
 return RECIPIENT_PLAN_NO_ERASED_SLOT;
}
