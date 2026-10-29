#include "secure_random.h"
static void wipe(uint8_t *p,size_t n){volatile uint8_t *v=p;while(n--)*v++=0;}
static bool unhealthy(RNG_HandleTypeDef *h){
 return (h->Instance->SR & (RNG_SR_CECS|RNG_SR_SECS|RNG_SR_CEIS|RNG_SR_SEIS))!=0 ||
        h->ErrorCode!=HAL_RNG_ERROR_NONE;
}
bool pendant_random_bytes(void *ctx,uint8_t *out,size_t length){
 pendant_rng *r=ctx;
 if(!out && length)return false;
 if(!r || !r->handle || r->failed){if(out)wipe(out,length);return false;}
 /* HAL timeouts require the main task and an advancing interrupt tick. */
 if(__get_IPSR() || __get_PRIMASK()){r->failed=true;if(out)wipe(out,length);return false;}
 RNG_HandleTypeDef *h=r->handle;
 if(h->Instance!=RNG || h->State!=HAL_RNG_STATE_READY ||
    h->Init.ClockErrorDetection!=RNG_CED_ENABLE || unhealthy(h))goto fail;
 for(size_t i=0;i<length;){
  uint32_t word=0;
  if(unhealthy(h) || HAL_RNG_GenerateRandomNumber(h,&word)!=HAL_OK || unhealthy(h))goto fail;
  for(unsigned b=0;b<4 && i<length;b++,i++){out[i]=(uint8_t)word;word>>=8;}
 }
 return true;
fail:
 r->failed=true;if(out)wipe(out,length);return false;
}
