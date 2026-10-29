#include "instruction_cache.h"
#include "stm32u5xx_hal.h"
bool board_instruction_cache_startup(void){
 if(__get_IPSR()||__get_PRIMASK()||HAL_ICACHE_IsEnabled())return false;
 if(HAL_ICACHE_ConfigAssociativityMode(ICACHE_1WAY)!=HAL_OK)return false;
 if(HAL_ICACHE_Enable()!=HAL_OK)return false;
 return HAL_ICACHE_IsEnabled()!=0U;
}
