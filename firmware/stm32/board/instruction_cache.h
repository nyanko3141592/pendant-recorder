#ifndef PENDANT_INSTRUCTION_CACHE_H
#define PENDANT_INSTRUCTION_CACHE_H
#include <stdbool.h>
/* Reset-startup only. Configure direct-mapped ICACHE before recorder work so
 * the actual image matches the STM32U585 low-current characterization mode. */
bool board_instruction_cache_startup(void);
#endif
