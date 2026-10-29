#include "wav_chunk.h"
#include <string.h>
static void u16(uint8_t *p,uint16_t v){p[0]=(uint8_t)v;p[1]=(uint8_t)(v>>8);}
static void u32(uint8_t *p,uint32_t v){u16(p,(uint16_t)v);u16(p+2,(uint16_t)(v>>16));}
void wav_chunk_begin(wav_chunk *c){c->samples=0;c->blocks=0;c->pending_count=0;c->index=0;c->closed=false;}
size_t wav_chunk_append(wav_chunk *c,const int16_t *pcm,size_t count){
 if(!c||!pcm||c->closed)return 0;
 size_t used=0;
 while(used<count && c->samples<WAV_CHUNK_SAMPLES){
  size_t n=2041U-c->pending_count;
  if(n>count-used)n=count-used;
  if(n>WAV_CHUNK_SAMPLES-c->samples)n=WAV_CHUNK_SAMPLES-c->samples;
  memcpy(c->pending+c->pending_count,pcm+used,n*sizeof(*pcm));
  c->pending_count+=(uint32_t)n;c->samples+=(uint32_t)n;used+=n;
  if(c->pending_count==2041){
   if(pendant_ima_block(c->pending,2041,c->bytes+60+c->blocks*1024,&c->index)!=0)return used;
   c->blocks++;c->pending_count=0;
  }
 }
 return used;
}
size_t wav_chunk_finish(wav_chunk *c){
 if(!c||!c->samples)return 0;
 if(c->closed)return 60+c->blocks*1024;
 if(c->pending_count){
  if(pendant_ima_block(c->pending,c->pending_count,c->bytes+60+c->blocks*1024,&c->index)!=0)return 0;
  c->blocks++;c->pending_count=0;
 }
 uint8_t *p=c->bytes;memset(p,0,60);
 memcpy(p,"RIFF",4);u32(p+4,52+c->blocks*1024);memcpy(p+8,"WAVEfmt ",8);
 u32(p+16,20);u16(p+20,17);u16(p+22,1);u32(p+24,16000);
 u32(p+28,16000U*1024U/2041U);u16(p+32,1024);u16(p+34,4);u16(p+36,2);u16(p+38,2041);
 memcpy(p+40,"fact",4);u32(p+44,4);u32(p+48,c->samples);memcpy(p+52,"data",4);u32(p+56,c->blocks*1024);
 c->closed=true;return 60+c->blocks*1024;
}
