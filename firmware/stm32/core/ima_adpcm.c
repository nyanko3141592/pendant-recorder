#include "ima_adpcm.h"
static const int steps[89]={
7,8,9,10,11,12,13,14,16,17,19,21,23,25,28,31,34,37,41,45,50,55,60,66,73,80,88,97,107,118,130,143,157,173,190,209,230,253,279,307,337,371,408,449,494,544,598,658,724,796,876,963,1060,1166,1282,1411,1552,1707,1878,2066,2272,2499,2749,3024,3327,3660,4026,4428,4871,5358,5894,6484,7132,7845,8630,9493,10442,11487,12635,13899,15289,16818,18500,20350,22385,24623,27086,29794,32767};
static const int adjust[8]={-1,-1,-1,-1,2,4,6,8};
static uint8_t encode(int sample,int *pred,int *idx) {
 int diff=sample-*pred,step=steps[*idx],delta=step>>3;uint8_t n=0;
 if(diff<0){n=8;diff=-diff;}
 if(diff>=step){n|=4;diff-=step;delta+=step;}
 step>>=1;if(diff>=step){n|=2;diff-=step;delta+=step;}
 step>>=1;if(diff>=step){n|=1;delta+=step;}
 *pred+=(n&8)?-delta:delta;
 if(*pred>32767)*pred=32767;
 if(*pred< -32768)*pred=-32768;
 *idx+=adjust[n&7];if(*idx<0)*idx=0;if(*idx>88)*idx=88;
 return n;
}
int pendant_ima_block(const int16_t *pcm,size_t count,uint8_t out[1024],int *index) {
 if(!pcm||!out||!index||count==0||count>2041||*index<0||*index>88)return -1;
 int pred=pcm[0],idx=*index;out[0]=(uint8_t)pred;out[1]=(uint8_t)((uint16_t)pred>>8);out[2]=(uint8_t)idx;out[3]=0;
 for(size_t i=1;i<2041;i+=2) {
  uint8_t lo=encode(pcm[i<count?i:count-1],&pred,&idx);
  uint8_t hi=encode(pcm[i+1<count?i+1:count-1],&pred,&idx);
  out[4+(i-1)/2]=(uint8_t)(lo|(hi<<4));
 }
 *index=idx;return 0;
}
