#include "../board/instruction_cache.h"
#include "stm32u5xx_hal.h"
#include <assert.h>
#include <stdio.h>
static unsigned scenario,configured,enabled;
unsigned __get_IPSR(void){return scenario==1;}
unsigned __get_PRIMASK(void){return scenario==2;}
uint32_t HAL_ICACHE_IsEnabled(void){
 if(scenario==3)return 1U;
 if(scenario==6&&enabled)return 0U;
 return enabled;
}
HAL_StatusTypeDef HAL_ICACHE_ConfigAssociativityMode(uint32_t mode){
 assert(mode==ICACHE_1WAY&&!configured&&!enabled);configured++;
 return scenario==4?HAL_ERROR:HAL_OK;
}
HAL_StatusTypeDef HAL_ICACHE_Enable(void){
 assert(configured==1&&!enabled);enabled++;
 return scenario==5?HAL_ERROR:HAL_OK;
}
int main(void){
 for(scenario=0;scenario<7;scenario++){
  configured=enabled=0;
  assert(board_instruction_cache_startup()==(scenario==0));
  if(scenario==1||scenario==2||scenario==3)assert(!configured&&!enabled);
  if(scenario==4)assert(configured==1&&!enabled);
  if(scenario>=5)assert(configured==1&&enabled==1);
 }
 puts("PASS ICACHE one-way startup and fail-closed cases (mock HAL; no power measurement)");
}
