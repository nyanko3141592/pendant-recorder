#include "rng_board.h"
#include "clock48.h"
/* Device-header NIST settings are family-specific. Keep compile-time pinning so
 * an SDK change cannot silently alter the conditioning/health-test profile. */
#if defined(STM32U585xx)
_Static_assert(RNG_CR_NIST_VALUE==0x00F00D00U,"Review U585 RNG CR configuration");
_Static_assert(RNG_HTCR_NIST_VALUE==0xA2B0U,"Review U585 RNG health configuration");
_Static_assert(RNG_NSCR_NIST_VALUE==0x17CBBU,"Review U585 RNG noise configuration");
#else
_Static_assert(RNG_CR_NIST_VALUE==0x00F11F00U,"Review RNG CR configuration");
_Static_assert(RNG_HTCR_NIST_VALUE==0x76B3U,"Review RNG health configuration");
_Static_assert(RNG_NSCR_NIST_VALUE==0x24C2U,"Review RNG noise configuration");
#endif
static RNG_HandleTypeDef handle;
static bool attempted,busy;
static pendant_rng *bound;
static void wipe(uint8_t *p,size_t n){volatile uint8_t *v=p;while(n--)*v++=0;}
bool board_rng_bytes(void *ctx,uint8_t *out,size_t length){
 pendant_rng *state=ctx;
 if(!state||state!=bound||state->failed||busy||(!out&&length)||__get_IPSR()||__get_PRIMASK()){
  if(out)wipe(out,length);
  if(state&&state==bound)state->failed=true;
  return false;
 }
 if(!length)return true;
 busy=true;bool ok=false,clock=false,peripheral=false;
 if(!board_clock48_acquire(CLOCK48_RNG))goto done;
 clock=true;
 RCC_PeriphCLKInitTypeDef clocks={0};
 clocks.PeriphClockSelection=RCC_PERIPHCLK_RNG;clocks.RngClockSelection=RCC_RNGCLKSOURCE_HSI48;
 if(HAL_RCCEx_PeriphCLKConfig(&clocks)!=HAL_OK||
    HAL_RCCEx_GetPeriphCLKFreq(RCC_PERIPHCLK_RNG)!=48000000U)goto done;
 __HAL_RCC_RNG_CLK_ENABLE();peripheral=true;
 __HAL_RCC_RNG_FORCE_RESET();__HAL_RCC_RNG_RELEASE_RESET();
 handle=(RNG_HandleTypeDef){0};handle.Instance=RNG;handle.Init.ClockErrorDetection=RNG_CED_ENABLE;
 if(HAL_RNG_Init(&handle)!=HAL_OK)goto done;
 ok=pendant_random_bytes(state,out,length);
done:
 if(peripheral){
  if(HAL_RNG_DeInit(&handle)!=HAL_OK)ok=false;
  /* Reset even if HAL conditioning-reset timed out; stop RNG before lease release. */
  __HAL_RCC_RNG_FORCE_RESET();__HAL_RCC_RNG_RELEASE_RESET();__HAL_RCC_RNG_CLK_DISABLE();
 }
 if(clock&&!board_clock48_release(CLOCK48_RNG))ok=false;
 if(!ok){state->failed=true;wipe(out,length);}
 busy=false;return ok;
}
bool board_rng_init(pendant_rng *state){
 if(!state||attempted||__get_IPSR()||__get_PRIMASK())return false;
 attempted=true;bound=state;*state=(pendant_rng){.handle=&handle,.failed=false};
 uint8_t probe[16]={0};bool ok=board_rng_bytes(state,probe,sizeof(probe));
 wipe(probe,sizeof(probe));return ok;
}
