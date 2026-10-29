#ifndef PENDANT_BATTERY_MONITOR_H
#define PENDANT_BATTERY_MONITOR_H
#include <stdint.h>
#include <stdbool.h>
typedef struct {
 uint32_t started,attempted_at,valid_at;
 uint16_t mv;
 uint8_t consecutive_failures;
 bool attempted,valid,ever_valid;
} battery_monitor;
void battery_monitor_init(battery_monitor *m,uint32_t now);
/* Main task only. allowed=false defers acquisition without resetting its timer. */
void battery_monitor_poll(battery_monitor *m,uint32_t now,bool allowed,bool (*measure)(uint16_t *));
bool battery_monitor_read(const battery_monitor *m,uint32_t now,uint16_t *mv);
/* Fail-closed health for builds that depend on firmware cutoff.  required=false
 * pauses the freshness requirement while external USB/host ownership is active.
 * Three attempted acquisition failures or five seconds without a valid sample
 * in the fast cutoff profile is terminal. */
bool battery_monitor_healthy(const battery_monitor *m,uint32_t now,bool required);
#endif
