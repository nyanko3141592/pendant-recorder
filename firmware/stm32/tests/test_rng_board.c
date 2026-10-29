#include "../board/rng_board.h"
#include "../board/clock48.h"
#include <assert.h>
#include <stdlib.h>
RNG_TypeDef test_rng;
static unsigned scenario,clock_on,disabled,deinit_calls,words,on_calls,off_calls;
unsigned __get_IPSR(void){return 0;}
unsigned __get_PRIMASK(void){return 0;}
void test_rng_clock(unsigned op){if(op==1)clock_on++;if(op==4)disabled++;}
HAL_StatusTypeDef HAL_RCC_OscConfig(RCC_OscInitTypeDef *c){assert(c->HSI48State==RCC_HSI48_ON||c->HSI48State==RCC_HSI48_OFF);if(c->HSI48State==RCC_HSI48_ON)on_calls++;else off_calls++;return scenario==1||(scenario==7&&c->HSI48State==RCC_HSI48_OFF)?HAL_ERROR:HAL_OK;}
HAL_StatusTypeDef HAL_RCCEx_PeriphCLKConfig(RCC_PeriphCLKInitTypeDef *c){assert(c->RngClockSelection==RCC_RNGCLKSOURCE_HSI48);return scenario==2?HAL_ERROR:HAL_OK;}
uint32_t HAL_RCCEx_GetPeriphCLKFreq(uint32_t which){assert(which==RCC_PERIPHCLK_RNG);return scenario==3?24000000:48000000;}
HAL_StatusTypeDef HAL_RNG_Init(RNG_HandleTypeDef *h){assert(clock_on&&h->Instance==RNG&&h->Init.ClockErrorDetection==RNG_CED_ENABLE);h->State=HAL_RNG_STATE_READY;return scenario==4?HAL_ERROR:HAL_OK;}
HAL_StatusTypeDef HAL_RNG_DeInit(RNG_HandleTypeDef *h){assert(h);deinit_calls++;return scenario==6?HAL_ERROR:HAL_OK;}
HAL_StatusTypeDef HAL_RNG_GenerateRandomNumber(RNG_HandleTypeDef *h,uint32_t *out){assert(h);words++;*out=42;return scenario==5?HAL_ERROR:HAL_OK;}
int main(int argc,char **argv){
 assert(argc==2);scenario=(unsigned)atoi(argv[1]);pendant_rng state={0};
 assert(board_rng_init(&state)==(scenario==0));
 assert(state.handle&&state.failed==(scenario!=0));
 assert(!board_rng_init(&state));
 if(!scenario){
  assert(words==4&&disabled==1&&deinit_calls==1);
  uint8_t output[7];assert(board_rng_bytes(&state,output,sizeof(output)));
  assert(words==6&&disabled==2&&deinit_calls==2);
  assert(board_rng_bytes(&state,NULL,0));assert(words==6);
  assert(on_calls==2&&off_calls==2);
  assert(board_clock48_acquire(CLOCK48_USB));
  assert(board_rng_bytes(&state,output,sizeof(output)));assert(on_calls==3&&off_calls==2);
  assert(board_clock48_release(CLOCK48_USB));assert(off_calls==3);
  scenario=5;assert(!board_rng_bytes(&state,output,sizeof(output)));
  for(unsigned i=0;i<sizeof(output);i++)assert(output[i]==0);
  unsigned saved=words;assert(!board_rng_bytes(&state,output,sizeof(output)));assert(words==saved);
 }
 else if(scenario<=3)assert(!clock_on&&!words&&!deinit_calls);
 else assert(disabled==1&&deinit_calls==1);
 return 0;
}
