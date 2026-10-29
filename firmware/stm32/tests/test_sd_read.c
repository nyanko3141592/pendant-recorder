#include "../core/sd_init.h"
#include "../core/sd_crc.h"
#include <assert.h>
#include <string.h>
static unsigned delayed,polls;static bool frozen;
static uint8_t response[516];static unsigned pos,size,calls,fail_at;static bool selected;static uint32_t expected;
static bool exchange(void *ctx,const uint8_t *tx,uint8_t *rx,size_t n){
 (void)ctx;if(++calls==fail_at)return false;memset(rx,255,n);
 if(n==6){assert(selected&&tx[0]==0x51);assert(tx[5]==((sd_crc7(tx,5)<<1)|1));
  uint32_t arg=((uint32_t)tx[1]<<24)|((uint32_t)tx[2]<<16)|((uint32_t)tx[3]<<8)|tx[4];assert(arg==expected);pos=0;size=516;
 }else {assert(n<=SD_TRANSFER_CHUNK);for(size_t i=0;i<n;i++){assert(tx[i]==255);if(pos==1 && polls<delayed){polls++;}else if(pos<size)rx[i]=response[pos++];}}return true;
}
static void select_card(void *ctx,bool on){(void)ctx;selected=on;if(!on)pos=size=0;}
static uint32_t milliseconds(void *ctx){(void)ctx;return frozen?0:polls/500;}
int main(void){
 sd_transport s={exchange,select_card,milliseconds,0};uint8_t out[512];response[0]=0;response[1]=0xfe;
 for(unsigned i=0;i<512;i++)response[i+2]=(uint8_t)i;
 uint16_t crc=sd_crc16(response+2,512);response[514]=crc>>8;response[515]=crc;
 for(unsigned ccs=0;ccs<2;ccs++){
  calls=0;expected=ccs?123:123*512;assert(sd_read_sector(&s,ccs,1048576,123,out));assert(!memcmp(out,response+2,512)&&!selected);
 }
 unsigned total=calls;assert(total<32);
 for(fail_at=1;fail_at<=total;fail_at++){
  calls=pos=size=0;memset(out,0xaa,512);assert(!sd_read_sector(&s,true,1048576,123,out));assert(!selected);
  for(unsigned i=0;i<512;i++)assert(out[i]==0xaa);
 }
 fail_at=0;response[515]^=1;assert(!sd_read_sector(&s,true,1048576,123,out));
 response[515]^=1;
 delayed=25000;polls=0;assert(sd_read_sector(&s,true,1048576,123,out)&&!selected);
 assert(!memcmp(out,response+2,512));
 delayed=100000;polls=0;memset(out,0xaa,512);
 assert(!sd_read_sector(&s,true,1048576,123,out)&&!selected&&polls==50000);
 for(unsigned i=0;i<512;i++)assert(out[i]==0xaa);
 frozen=true;delayed=700000;polls=0;
 assert(!sd_read_sector(&s,true,1048576,123,out)&&!selected&&polls==625001);
 calls=0;assert(!sd_read_sector(&s,true,512,1,out));assert(!calls);
 return 0;
}
