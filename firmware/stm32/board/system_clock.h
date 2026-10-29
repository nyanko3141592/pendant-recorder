#ifndef PENDANT_SYSTEM_CLOCK_H
#define PENDANT_SYSTEM_CLOCK_H
#include <stdbool.h>
/* Reset startup only, HAL_Init/live tick, current SYSCLK<=16MHz. MSIS16 CPU,
 * HSI16 off, all APB dividers1, voltage range4, conservative flash2WS. This is a baseline
 * for bench profiling, not proof of encryption throughput or16hour runtime. */
bool board_system_clock_startup(void);
#endif
