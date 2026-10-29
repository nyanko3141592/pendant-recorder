#include "sd_init.h"
#include "sd_crc.h"
#include "sd_capacity.h"
#include <string.h>
static bool byte(const sd_transport *s,uint8_t *r){uint8_t tx=255;return s->exchange(s->ctx,&tx,r,1);}
static bool end(const sd_transport *s){uint8_t r;s->select(s->ctx,false);return byte(s,&r);}
static bool command(const sd_transport *s,uint8_t n,uint32_t arg,uint8_t *r){
 uint8_t packet[6],rx[6];if(!end(s))return false;s->select(s->ctx,true);
 /* Wait boundedly for not-busy before sending a new command. */
 unsigned i;for(i=0;i<4096;i++){if(!byte(s,r))return false;if(*r==255)break;}
 if(i==4096||!sd_command_packet(n,arg,packet)||!s->exchange(s->ctx,packet,rx,6))return false;
 for(i=0;i<8;i++){if(!byte(s,r))return false;if(!(*r&0x80))return true;}return false;
}
static bool read_bytes(const sd_transport *s,uint8_t *p,size_t n){
 uint8_t tx[SD_TRANSFER_CHUNK];memset(tx,255,sizeof(tx));
 while(n){size_t count=n<sizeof(tx)?n:sizeof(tx);
  if(!s->exchange(s->ctx,tx,p,count))return false;
  p+=count;n-=count;
 }return true;
}
/* 100ms at50MHz is625000 byte clocks; a stopped clock still terminates. */
static bool data_token(const sd_transport *s){
 uint32_t start=s->milliseconds(s->ctx);uint8_t r;
 for(unsigned polls=0;polls<625001U;polls++){
  if(!byte(s,&r))return false;
  if(r==0xfe)return true;
  if(r!=255||(uint32_t)(s->milliseconds(s->ctx)-start)>=100)return false;
 }
 return false;
}
bool sd_initialize_card(const sd_transport *s,sd_card_info *info){
 if(!s||!s->exchange||!s->select||!s->milliseconds||!info)return false;
 uint8_t r,extra[4],csd[16],crc[2];uint64_t result=0;bool ok=false;
 s->select(s->ctx,false);
 for(unsigned i=0;i<10;i++)if(!byte(s,&r))goto done; /* >=74 clocks, MOSI high */
 if(!command(s,0,0,&r)||r!=1)goto done;
 if(!command(s,8,0x1aa,&r)||r!=1||!read_bytes(s,extra,4))goto done;
 if(extra[0]||extra[1]||extra[2]!=1||extra[3]!=0xaa)goto done;
 uint32_t start=s->milliseconds(s->ctx);unsigned tries;
 for(tries=0;tries<10000;tries++){
  if(!command(s,55,0,&r)||(r!=1&&r!=0))goto done;
  if(!command(s,41,UINT32_C(1)<<30,&r))goto done;
  if(r==0)break;
  if(r!=1 || (uint32_t)(s->milliseconds(s->ctx)-start)>=1000)goto done;
 }
 if(tries==10000)goto done;
 if(!command(s,58,0,&r)||r||!read_bytes(s,extra,4))goto done;
 uint32_t ocr=((uint32_t)extra[0]<<24)|((uint32_t)extra[1]<<16)|((uint32_t)extra[2]<<8)|extra[3];
 if(!(ocr&UINT32_C(0x80000000))||!(ocr&UINT32_C(0x00300000)))goto done;
 bool ccs=(ocr&UINT32_C(0x40000000))!=0;
 /* Require card-side command/data CRC checking, not just local validation. */
 if(!command(s,59,1,&r)||r)goto done;
 if(!ccs && (!command(s,16,512,&r)||r))goto done;
 if(!command(s,9,0,&r)||r)goto done;
 if(!data_token(s)||!read_bytes(s,csd,16)||!read_bytes(s,crc,2))goto done;
 if(sd_crc16(csd,16)!=((uint16_t)crc[0]<<8|crc[1]))goto done;
 if(((sd_crc7(csd,15)<<1)|1)!=csd[15]||!sd_capacity_bytes(csd,ccs,&result))goto done;
 ok=true;
done:
 if(!end(s))ok=false;
 if(ok){info->capacity_bytes=result;info->block_addressed=ccs;}
 return ok;
}

bool sd_read_sector(const sd_transport *s,bool ccs,uint64_t capacity,uint64_t lba,uint8_t out[512]){
 if(!s||!s->exchange||!s->select||!s->milliseconds||!out||capacity%512||lba>=capacity/512)return false;
 if(lba>(ccs?UINT32_MAX:UINT32_MAX/512u))return false;
 uint32_t address=ccs?(uint32_t)lba:(uint32_t)(lba*512);
 uint8_t r,block[512],crc[2];bool ok=false;
 if(!command(s,17,address,&r)||r)goto done;
 if(!data_token(s)||!read_bytes(s,block,512)||!read_bytes(s,crc,2))goto done;
 if(sd_crc16(block,512)!=((uint16_t)crc[0]<<8|crc[1]))goto done;
 ok=true;
done:
 if(!end(s))ok=false;
 if(ok)for(unsigned i=0;i<512;i++)out[i]=block[i];
 return ok;
}

bool sd_write_sector(const sd_transport *s,bool ccs,uint64_t capacity,uint64_t lba,const uint8_t data[512]){
 if(!s||!s->exchange||!s->select||!s->milliseconds||!data||capacity%512||lba>=capacity/512)return false;
 if(lba>(ccs?UINT32_MAX:UINT32_MAX/512u))return false;
 uint32_t address=ccs?(uint32_t)lba:(uint32_t)(lba*512);
 uint8_t r,tx;bool ok=false;
 if(!command(s,24,address,&r)||r)goto done;
 tx=255;if(!s->exchange(s->ctx,&tx,&r,1))goto done;
 tx=0xfe;if(!s->exchange(s->ctx,&tx,&r,1))goto done;
 uint8_t discard[SD_TRANSFER_CHUNK];
 for(unsigned i=0;i<512;i+=sizeof(discard))
  if(!s->exchange(s->ctx,data+i,discard,sizeof(discard)))goto done;
 uint16_t crc=sd_crc16(data,512);tx=crc>>8;
 if(!s->exchange(s->ctx,&tx,&r,1))goto done;tx=crc;
 if(!s->exchange(s->ctx,&tx,&r,1))goto done;
 /* Data-response token can follow one or more idle bytes. */
 unsigned tries;for(tries=0;tries<8;tries++){if(!byte(s,&r))goto done;if(r!=255)break;}
 if(tries==8||(r&0x1f)!=5)goto done;
 uint32_t start=s->milliseconds(s->ctx);
 /* The watchdog must not shorten the 500ms deadline at fast SPI clocks.
  * At the supported card maximum50MHz, 500ms contains3125000 byte clocks.
  * Retain a finite guard if the monotonic timer stops advancing. */
 const unsigned busy_poll_limit=3125001U;
 for(tries=0;tries<busy_poll_limit;tries++){
  if(!byte(s,&r))goto done;if(r==255)break;
  if((uint32_t)(s->milliseconds(s->ctx)-start)>=500)goto done;
 }
 if(tries==busy_poll_limit)goto done;
 /* CMD13 R2 catches programming/write-protect errors after busy clears. */
 if(!command(s,13,0,&r)||r||!byte(s,&r)||r)goto done;
 ok=true;
done:
 if(!end(s))ok=false;
 return ok;
}

bool sd_initialize(const sd_transport *s,uint64_t *capacity){
 if(!capacity)return false;sd_card_info info;
 if(!sd_initialize_card(s,&info))return false;
 *capacity=info.capacity_bytes;return true;
}
