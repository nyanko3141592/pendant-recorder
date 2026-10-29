#include "../board/secure_random.h"
#include <assert.h>
#include <string.h>
RNG_TypeDef test_rng;
static unsigned calls,fail_call,error_kind,ipsr,primask;
unsigned __get_IPSR(void){return ipsr;}
unsigned __get_PRIMASK(void){return primask;}
HAL_StatusTypeDef HAL_RNG_GenerateRandomNumber(RNG_HandleTypeDef *h,uint32_t *word){
 calls++;*word=0x04030201;
 if(calls==fail_call){
  if(error_kind==0)return HAL_ERROR;
  if(error_kind==1)h->ErrorCode=1;
  if(error_kind==2)test_rng.SR=RNG_SR_CECS;
  if(error_kind==3)test_rng.SR=RNG_SR_SECS;
  if(error_kind==4)test_rng.SR=RNG_SR_CEIS;
  if(error_kind==5)test_rng.SR=RNG_SR_SEIS;
 }
 return HAL_OK;
}
int main(void){
 uint8_t bytes[17];
 RNG_HandleTypeDef h={.Instance=RNG,.State=HAL_RNG_STATE_READY};
 pendant_rng r={&h,false};
 for(size_t n=0;n<=sizeof(bytes);n++){
  calls=0;memset(bytes,0xaa,sizeof(bytes));
  assert(pendant_random_bytes(&r,bytes,n));assert(calls==(n+3)/4);
  for(size_t i=0;i<n;i++)assert(bytes[i]==i%4+1);
  for(size_t i=n;i<sizeof(bytes);i++)assert(bytes[i]==0xaa);
 }
 for(error_kind=0;error_kind<=5;error_kind++)for(fail_call=1;fail_call<=5;fail_call++){
  calls=0;r.failed=false;h.ErrorCode=0;test_rng.SR=0;memset(bytes,0xaa,sizeof(bytes));
  assert(!pendant_random_bytes(&r,bytes,sizeof(bytes)));assert(r.failed&&calls==fail_call);
  for(size_t i=0;i<sizeof(bytes);i++)assert(bytes[i]==0);
  test_rng.SR=0;h.ErrorCode=0;
  assert(!pendant_random_bytes(&r,bytes,sizeof(bytes)));assert(calls==fail_call);
 }
 fail_call=0;
 for(unsigned bad=0;bad<4;bad++){
  r.failed=false;h.Instance=RNG;h.State=HAL_RNG_STATE_READY;h.Init.ClockErrorDetection=0;h.ErrorCode=0;test_rng.SR=0;calls=0;
  if(bad==0)h.Instance=0;
  if(bad==1)h.State=0;
  if(bad==2)h.Init.ClockErrorDetection=1;
  if(bad==3)test_rng.SR=RNG_SR_SEIS;
  assert(!pendant_random_bytes(&r,bytes,sizeof(bytes)));assert(!calls&&r.failed);
 }
 for(unsigned context=0;context<2;context++){
  r.failed=false;h.Instance=RNG;h.State=HAL_RNG_STATE_READY;h.Init.ClockErrorDetection=0;test_rng.SR=0;calls=0;
  ipsr=context==0;primask=context==1;memset(bytes,0xaa,sizeof(bytes));
  assert(!pendant_random_bytes(&r,bytes,sizeof(bytes)));assert(!calls&&r.failed);
  for(size_t i=0;i<sizeof(bytes);i++)assert(bytes[i]==0);
  ipsr=primask=0;assert(!pendant_random_bytes(&r,bytes,sizeof(bytes)));assert(!calls);
 }
 assert(!pendant_random_bytes(0,bytes,sizeof(bytes)));
 assert(!pendant_random_bytes(&r,0,1));
 return 0;
}
