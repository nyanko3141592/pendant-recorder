#include "../core/sd_crc.h"
#include <assert.h>
#include <string.h>
int main(void){
 uint8_t packet[6];
 const uint8_t cmd0[]={0x40,0,0,0,0,0x95};
 const uint8_t cmd8[]={0x48,0,0,1,0xaa,0x87};
 assert(sd_command_packet(0,0,packet)&&!memcmp(packet,cmd0,6));
 assert(sd_command_packet(8,0x1aa,packet)&&!memcmp(packet,cmd8,6));
 assert(!sd_command_packet(64,0,packet)&&!memcmp(packet,cmd8,6));
 assert(sd_crc16((const uint8_t *)"123456789",9)==0x31c3);
 uint8_t block[512];memset(block,0xff,sizeof(block));
 assert(sd_crc16(block,sizeof(block))==0x7fa1);
 for(unsigned bit=0;bit<4096;bit++){
  block[bit/8]^=1u<<(bit%8);assert(sd_crc16(block,sizeof(block))!=0x7fa1);block[bit/8]^=1u<<(bit%8);
 }
 assert(sd_crc7(0,0)==0&&sd_crc16(0,0)==0);return 0;
}
