#include "../board/clock48.h"
#include "stm32u5xx_hal.h"
#include <assert.h>
#include <stdlib.h>
static unsigned calls,fail_at,ipsr,masked,last;
unsigned __get_IPSR(void){return ipsr;}
unsigned __get_PRIMASK(void){return masked;}
HAL_StatusTypeDef HAL_RCC_OscConfig(RCC_OscInitTypeDef *c){
 assert(c->OscillatorType==RCC_OSCILLATORTYPE_HSI48);
 calls++;last=c->HSI48State;return calls==fail_at?HAL_ERROR:HAL_OK;
}
int main(int argc,char **argv){
 assert(argc==2);unsigned scenario=(unsigned)atoi(argv[1]);
 if(scenario){
  fail_at=scenario;
  if(scenario==1)assert(!board_clock48_acquire(CLOCK48_RNG));
  else {assert(board_clock48_acquire(CLOCK48_RNG));assert(!board_clock48_release(CLOCK48_RNG));}
  unsigned n=calls;assert(!board_clock48_acquire(CLOCK48_USB));assert(!board_clock48_release(CLOCK48_RNG));assert(calls==n);return 0;
 }
 assert(!board_clock48_acquire((clock48_owner)3));assert(!board_clock48_release(CLOCK48_USB));
 ipsr=1;assert(!board_clock48_acquire(CLOCK48_USB));ipsr=0;masked=1;assert(!board_clock48_acquire(CLOCK48_RNG));masked=0;assert(calls==0);
 for(unsigned reverse=0;reverse<2;reverse++){
  clock48_owner first=reverse?CLOCK48_USB:CLOCK48_RNG,second=reverse?CLOCK48_RNG:CLOCK48_USB;
  unsigned n=calls;assert(board_clock48_acquire(first));assert(calls==n+1&&last==RCC_HSI48_ON);
  assert(!board_clock48_acquire(first));assert(board_clock48_acquire(second));assert(calls==n+1);
  masked=1;assert(!board_clock48_release(first));masked=0;
  assert(board_clock48_release(first));assert(calls==n+1);assert(!board_clock48_release(first));
  assert(board_clock48_release(second));assert(calls==n+2&&last==RCC_HSI48_OFF);
 }
 return 0;
}
