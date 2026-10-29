#ifndef PENDANT_BATTERY_STOP_H
#define PENDANT_BATTERY_STOP_H
#include <stdbool.h>
#include <stdint.h>
typedef struct { bool latched,missing; uint32_t missing_since; } battery_stop;
/* Terminal latch. Disabled ownership intervals reset only missing-data grace.
 * Threshold is a board qualification input, not a capacity/SOC estimate. */
bool battery_stop_poll(battery_stop *,uint32_t now,bool enabled,bool valid,
                       uint16_t mv,uint16_t threshold_mv,uint32_t missing_grace_ms);
#endif
