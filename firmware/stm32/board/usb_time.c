#include "stm32u5xx_hal.h"
/* TinyUSB OS_NONE time source. Requires running HAL tick while USB is active;
 * USB suspend/Stop2 clock policy is not yet integrated. */
uint32_t tusb_time_millis_api(void){return HAL_GetTick();}
