#include "recipient_flash.h"
#include "../core/recipient_record.h"
#include "stm32u5xx_hal.h"
#include <string.h>

extern uint8_t __recipient_flash_start__,__recipient_flash_end__;

static const uint8_t (*slots(void))[RECIPIENT_RECORD_BYTES]{
 return (const uint8_t (*)[RECIPIENT_RECORD_BYTES])&__recipient_flash_start__;
}
static bool bounds_ok(void){
 uintptr_t start=(uintptr_t)&__recipient_flash_start__,end=(uintptr_t)&__recipient_flash_end__;
 return start==0x080fe000u&&end-start==0x2000u&&!(start&15u);
}
bool board_recipient_flash_load(void *context,uint8_t recipient[32]){
 (void)context;if(!recipient||!bounds_ok())return false;
 for(size_t i=0;i<RECIPIENT_RECORD_SLOTS;i++)
  if(recipient_record_decode(slots()[i],recipient))return true;
 memset(recipient,0,32);return false;
}
static bool program_quad(uintptr_t address,const uint8_t bytes[16]){
 uint32_t aligned[4] __attribute__((aligned(16)));memcpy(aligned,bytes,16);
 return HAL_FLASH_Program(FLASH_TYPEPROGRAM_QUADWORD,address,(uint32_t)(uintptr_t)aligned)==HAL_OK;
}
bool board_recipient_flash_commit(const uint8_t recipient[32]){
 if(!recipient||!bounds_ok()||__get_IPSR()||__get_PRIMASK())return false;
 size_t index=0;recipient_plan_result plan=recipient_record_plan(slots(),recipient,&index);
 if(plan!=RECIPIENT_PLAN_WRITE_SLOT)return false;
 uint8_t image[RECIPIENT_RECORD_BYTES];if(!recipient_record_prepare(recipient,image))return false;
 uintptr_t address=(uintptr_t)&__recipient_flash_start__+index*RECIPIENT_RECORD_BYTES;
 bool ok=HAL_FLASH_Unlock()==HAL_OK;
 /* Body occupies three complete 128-bit programming units. The fourth unit is
  * still erased until body readback succeeds, so a reset cannot commit it. */
 for(unsigned offset=0;ok&&offset<RECIPIENT_COMMIT_OFFSET;offset+=16)
  ok=program_quad(address+offset,image+offset);
 if(ok){__DSB();__ISB();ok=!memcmp((const void *)address,image,RECIPIENT_COMMIT_OFFSET);}
 uint8_t commit[16];memset(commit,0xff,sizeof commit);
 commit[0]=(uint8_t)RECIPIENT_COMMIT_WORD;commit[1]=(uint8_t)(RECIPIENT_COMMIT_WORD>>8);
 commit[2]=(uint8_t)(RECIPIENT_COMMIT_WORD>>16);commit[3]=(uint8_t)(RECIPIENT_COMMIT_WORD>>24);
 if(ok)ok=program_quad(address+RECIPIENT_COMMIT_OFFSET,commit);
 if(HAL_FLASH_Lock()!=HAL_OK)ok=false;
 __DSB();__ISB();uint8_t readback[32];
 return ok&&recipient_record_decode((const uint8_t *)address,readback)&&!memcmp(readback,recipient,32);
}
