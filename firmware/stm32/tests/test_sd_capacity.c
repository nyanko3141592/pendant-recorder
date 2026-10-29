#include "../core/sd_capacity.h"
#include <assert.h>
#include <string.h>
static void set(uint8_t *p,unsigned hi,unsigned lo,uint32_t v){
 for(unsigned n=lo;n<=hi;n++){unsigned bit=1u<<(n%8);p[(127-n)/8]=(p[(127-n)/8]&~bit)|((v&1)?bit:0);v>>=1;}
}
int main(void){
 uint8_t c[16]={0};uint64_t bytes=7;c[15]=1;
 set(c,83,80,10);set(c,73,62,4095);set(c,49,47,7);
 assert(sd_capacity_bytes(c,false,&bytes)&&bytes==UINT64_C(2147483648));
 set(c,73,62,2047);assert(sd_capacity_bytes(c,false,&bytes)&&bytes==UINT64_C(1073741824));
 bytes=7;assert(!sd_capacity_bytes(c,true,&bytes)&&bytes==7);
 memset(c,0,sizeof(c));c[15]=1;set(c,127,126,1);set(c,83,80,9);set(c,69,48,65535);
 assert(sd_capacity_bytes(c,true,&bytes)&&bytes==UINT64_C(34359738368));
 set(c,69,48,4194303);assert(sd_capacity_bytes(c,true,&bytes)&&bytes==UINT64_C(2199023255552));
 assert(!sd_capacity_bytes(c,false,&bytes));set(c,127,126,2);assert(!sd_capacity_bytes(c,true,&bytes));
 assert(!sd_capacity_bytes(0,true,&bytes));assert(!sd_capacity_bytes(c,true,0));return 0;
}
