#ifndef PENDANT_TERMINAL_INDICATOR_H
#define PENDANT_TERMINAL_INDICATOR_H
#include <stdbool.h>
#include <stdint.h>
/* Terminal-only patterns, distinct from 1..3 short battery flashes.
 * Capacity: two 600ms pulses; fault: four 150ms pulses; period 5s.
 * Caller supplies elapsed unsigned tick since terminal entry (wrap safe).
 * No filesystem or hardware operation; tick/CPU must still be functioning. */
static inline bool terminal_indicator_on(uint32_t elapsed,bool capacity){
 uint32_t phase=elapsed%5000U;
 if(capacity)return phase<600U||(phase>=900U&&phase<1500U);
 return phase<1200U&&(phase%300U)<150U;
}
#endif
