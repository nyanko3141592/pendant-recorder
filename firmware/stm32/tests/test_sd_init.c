#include "../core/sd_init.h"
#include "../core/sd_crc.h"
#include <assert.h>
#include <string.h>
static uint8_t pending[32];static unsigned size,pos,calls,fail_at,mode;static bool selected;
static uint32_t tick;
static bool exchange(void *ctx,const uint8_t *tx,uint8_t *rx,size_t n){
 (void)ctx;if(++calls==fail_at)return false;memset(rx,255,n);
 if(n==6){
  assert(selected&&tx[5]==((sd_crc7(tx,5)<<1)|1));pos=0;size=1;pending[0]=0;
  switch(tx[0]&63){
   case 0:pending[0]=1;break;
   case 8:pending[0]=1;pending[1]=0;pending[2]=0;pending[3]=1;pending[4]=mode==1?0:0xaa;size=5;break;
   case 55:pending[0]=1;break;
   case 41:pending[0]=mode==2?1:0;break;
   case 58:pending[1]=0xc0;pending[2]=0xff;pending[3]=0x80;pending[4]=0;size=5;break;
   case 59:assert(tx[4]==1);break;
   case 9:{
    pending[1]=0xfe;uint8_t *c=pending+2;memset(c,0,16);
    c[0]=0x40;c[5]=9;c[8]=0x1f;c[9]=0xff; /* 4GiB */
    c[15]=(sd_crc7(c,15)<<1)|1;uint16_t crc=sd_crc16(c,16);
    pending[18]=crc>>8;pending[19]=crc^(mode==3?1:0);size=20;break;
   }
   default:assert(0);
  }
 }else {assert(n<=SD_TRANSFER_CHUNK);for(size_t i=0;i<n;i++){assert(tx[i]==255);if(pos<size)rx[i]=pending[pos++];}}
 return true;
}
static void select_card(void *ctx,bool on){(void)ctx;selected=on;if(!on)pos=size=0;}
static uint32_t milliseconds(void *ctx){(void)ctx;return tick+=10;}
static void reset(void){pos=size=calls=0;selected=false;tick=UINT32_MAX-100;}
int main(void){
 sd_transport io={exchange,select_card,milliseconds,0};uint64_t capacity=7;
 reset();assert(sd_initialize(&io,&capacity)&&capacity==UINT64_C(4294967296)&&!selected);unsigned total=calls;
 for(fail_at=1;fail_at<=total;fail_at++){
  reset();capacity=7;assert(!sd_initialize(&io,&capacity));assert(capacity==7&&!selected);
 }
 fail_at=0;
 sd_card_info info={7,false};reset();assert(sd_initialize_card(&io,&info));assert(info.capacity_bytes==UINT64_C(4294967296)&&info.block_addressed);
 for(mode=1;mode<=3;mode++){
  reset();capacity=7;assert(!sd_initialize(&io,&capacity));assert(capacity==7&&!selected&&calls<10000);
 }
 return 0;
}
