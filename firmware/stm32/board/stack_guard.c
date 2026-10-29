#include "stm32u5xx_hal.h"
#include "stack_guard.h"
extern unsigned char _sstack,_estack;
bool board_stack_guard_enable(void){
 uintptr_t low=(uintptr_t)&_sstack,high=(uintptr_t)&_estack;
 uint32_t sp=__get_MSP();
 if(__get_IPSR()||(__get_CONTROL()&3u)||low>=high||(low&7u)||sp<=low||sp>high)return false;
 __set_MSPLIM((uint32_t)low);
 __DSB();__ISB();
 return __get_MSPLIM()==low;
}
