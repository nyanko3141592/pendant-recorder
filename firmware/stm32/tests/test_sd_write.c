#include "../core/sd_init.h"
#include "../core/sd_crc.h"
#include <assert.h>
#include <string.h>
static unsigned stage,offset,calls,fail_at,mode;static bool selected;static uint32_t tick;
static unsigned busy_polls;
static uint8_t data[512];static uint16_t crc;
static bool exchange(void *ctx,const uint8_t *tx,uint8_t *rx,size_t n){
 (void)ctx;if(++calls==fail_at)return false;memset(rx,255,n);if(!selected)return true;
 if(n==6){
  assert(selected&&tx[5]==((sd_crc7(tx,5)<<1)|1));
  if(tx[0]==0x58){assert(tx[4]==7);stage=1;}
  else {assert(tx[0]==0x4d&&stage==9);stage=10;}
 }else{
  if(stage==4){assert(n==SD_TRANSFER_CHUNK);for(size_t i=0;i<n;i++)assert(tx[i]==data[offset++]);if(offset==512)stage=5;return true;}
  assert(n==1);
  switch(stage){
   case 0:break;
   case 1:*rx=0;stage=2;break;
   case 2:assert(*tx==255);stage=3;break;
   case 3:assert(*tx==0xfe);stage=4;offset=0;break;
   case 4:assert(*tx==data[offset++]);if(offset==512)stage=5;break;
   case 5:assert(*tx==(crc>>8));stage=6;break;
   case 6:assert(*tx==(crc&255));stage=7;break;
   case 7:*rx=mode==1?0x0b:5;stage=8;break;
   case 8:
    *rx=0;busy_polls++;
    if(mode==4){if(busy_polls==50000)stage=9;}
    else if(mode==5||mode==6){} /* deadline or frozen-timer guard */
    else if(mode!=2)stage=9;
    break;
   case 9:break;
   case 10:*rx=0;stage=11;break;
   case 11:*rx=mode==3?0x20:0;stage=12;break;
   case 12:break;
  }
 }return true;
}
static void select_card(void *ctx,bool on){(void)ctx;selected=on;}
static uint32_t milliseconds(void *ctx){(void)ctx;return mode==6?0:mode>=4?busy_polls/500: (tick+=10);}
static void reset(void){stage=offset=calls=tick=busy_polls=0;selected=false;}
int main(void){
 sd_transport io={exchange,select_card,milliseconds,0};
 for(unsigned i=0;i<512;i++)data[i]=(uint8_t)i;crc=sd_crc16(data,512);
 reset();assert(sd_write_sector(&io,true,1048576,7,data)&&!selected);unsigned total=calls;assert(total<40);
 for(fail_at=1;fail_at<=total;fail_at++){reset();assert(!sd_write_sector(&io,true,1048576,7,data)&&!selected);}
 fail_at=0;for(mode=1;mode<=3;mode++){reset();assert(!sd_write_sector(&io,true,1048576,7,data)&&!selected&&calls<1000);}
 mode=4;reset();assert(sd_write_sector(&io,true,1048576,7,data)&&!selected&&busy_polls==50000);
 mode=5;reset();assert(!sd_write_sector(&io,true,1048576,7,data)&&!selected&&busy_polls==250000);
 mode=6;reset();assert(!sd_write_sector(&io,true,1048576,7,data)&&!selected&&busy_polls==3125001);
 reset();assert(!sd_write_sector(&io,true,512,1,data)&&calls==0);return 0;
}
