#include "clock48.h"
#include "stm32u5xx_hal.h"
static unsigned owners;
static bool fault;
static bool valid(clock48_owner o){return o==CLOCK48_RNG||o==CLOCK48_USB;}
static bool transition(bool on){
 RCC_OscInitTypeDef cfg={0};cfg.OscillatorType=RCC_OSCILLATORTYPE_HSI48;
 cfg.HSI48State=on?RCC_HSI48_ON:RCC_HSI48_OFF;
 if(HAL_RCC_OscConfig(&cfg)!=HAL_OK){fault=true;return false;}
 return true;
}
bool board_clock48_acquire(clock48_owner o){
 if(!valid(o)||fault||__get_IPSR()||__get_PRIMASK()||(owners&(unsigned)o))return false;
 if(!owners&&!transition(true))return false;
 owners|=(unsigned)o;return true;
}
bool board_clock48_release(clock48_owner o){
 if(!valid(o)||fault||__get_IPSR()||__get_PRIMASK()||!(owners&(unsigned)o))return false;
 unsigned remaining=owners&~(unsigned)o;
 if(!remaining&&!transition(false))return false;
 owners=remaining;return true;
}
