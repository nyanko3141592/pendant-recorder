#include "sd_capacity.h"
/* SD Association Physical Layer Simplified v6, section5.3. */
static uint32_t bits(const uint8_t *p,unsigned hi,unsigned lo){
 uint32_t v=0;for(unsigned n=hi+1;n-->lo;)v=(v<<1)|((p[(127-n)/8]>>(n%8))&1u);return v;
}
bool sd_capacity_bytes(const uint8_t csd[16],bool ccs,uint64_t *bytes){
 if(!csd||!bytes||!(csd[15]&1u))return false;
 unsigned version=bits(csd,127,126),block=bits(csd,83,80);uint64_t result;
 if(version==0){
  if(ccs||block<9||block>11)return false;
  result=((uint64_t)bits(csd,73,62)+1)<<(bits(csd,49,47)+2+block);
  if(result>UINT64_C(2147483648))return false;
 }else if(version==1){
  if(!ccs||block!=9)return false;
  result=((uint64_t)bits(csd,69,48)+1)<<19;
 }else return false;
 *bytes=result;return true;
}
