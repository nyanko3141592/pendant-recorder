#include "recipient_record.h"
#include <assert.h>
#include <string.h>

static void commit(uint8_t *p){uint32_t v=RECIPIENT_COMMIT_WORD;memcpy(p+RECIPIENT_COMMIT_OFFSET,&v,4);}
int main(void){
 uint8_t slots[RECIPIENT_RECORD_SLOTS][RECIPIENT_RECORD_BYTES];memset(slots,0xff,sizeof slots);
 uint8_t key[32],other[32],out[32],image[RECIPIENT_RECORD_BYTES];
 for(unsigned i=0;i<32;i++){key[i]=(uint8_t)(i+1);other[i]=(uint8_t)(0x80+i);}
 size_t index=99;
 assert(recipient_record_plan(slots,key,&index)==RECIPIENT_PLAN_WRITE_SLOT&&index==0);
 assert(recipient_record_prepare(key,image));assert(!recipient_record_decode(image,out));
 memcpy(slots[0],image,sizeof image); /* torn before commit */
 assert(recipient_record_plan(slots,key,&index)==RECIPIENT_PLAN_WRITE_SLOT&&index==1);
 commit(slots[0]);assert(recipient_record_decode(slots[0],out)&&!memcmp(out,key,32));
 assert(recipient_record_plan(slots,other,&index)==RECIPIENT_PLAN_ALREADY_PROVISIONED);
 slots[0][12]^=1;assert(!recipient_record_decode(slots[0],out));
 assert(recipient_record_plan(slots,key,&index)==RECIPIENT_PLAN_WRITE_SLOT&&index==1);
 memset(slots[1],0,sizeof slots[1]);assert(recipient_record_plan(slots,key,&index)==RECIPIENT_PLAN_NO_ERASED_SLOT);
 memset(key,0,sizeof key);assert(!recipient_record_prepare(key,image));
 assert(recipient_record_plan(slots,key,&index)==RECIPIENT_PLAN_INVALID_INPUT);
 return 0;
}
