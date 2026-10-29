#include "../core/wav_chunk.h"
#include <assert.h>
#include <stdio.h>
static wav_chunk c;
int main(int argc,char **argv){
 int16_t pcm[1024]={0};wav_chunk_begin(&c);assert(wav_chunk_finish(&c)==0);
 unsigned fed=0;
 while(fed<WAV_CHUNK_SAMPLES)fed+=(unsigned)wav_chunk_append(&c,pcm,1024);
 assert(fed==160000);assert(wav_chunk_append(&c,pcm,1024)==0);
 size_t size=wav_chunk_finish(&c);assert(size==80956);assert(wav_chunk_finish(&c)==size);
 assert(wav_chunk_append(&c,pcm,1)==0);
 if(argc==2){FILE *f=fopen(argv[1],"wb");assert(f);assert(fwrite(c.bytes,1,size,f)==size);assert(fclose(f)==0);}
 wav_chunk_begin(&c);assert(wav_chunk_append(&c,pcm,1)==1);assert(wav_chunk_finish(&c)==1084);
 return 0;
}
