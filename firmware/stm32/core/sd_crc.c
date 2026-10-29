#include "sd_crc.h"
uint8_t sd_crc7(const uint8_t *p,size_t n){
 uint8_t crc=0;
 while(n--){uint8_t v=*p++;for(unsigned b=0;b<8;b++){
  crc<<=1;if((v^crc)&0x80)crc^=0x09;v<<=1;
 }}return crc&0x7f;
}
uint16_t sd_crc16(const uint8_t *p,size_t n){
 uint16_t crc=0;
 while(n--){crc^=(uint16_t)*p++<<8;for(unsigned b=0;b<8;b++)crc=(crc&0x8000)?(crc<<1)^0x1021:crc<<1;}
 return crc;
}
bool sd_command_packet(uint8_t index,uint32_t argument,uint8_t out[6]){
 if(index>63||!out)return false;
 out[0]=0x40|index;out[1]=argument>>24;out[2]=argument>>16;
 out[3]=argument>>8;out[4]=argument;out[5]=(sd_crc7(out,5)<<1)|1;
 return true;
}
