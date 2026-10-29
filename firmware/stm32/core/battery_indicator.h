#ifndef PENDANT_BATTERY_INDICATOR_H
#define PENDANT_BATTERY_INDICATOR_H
#include <stdint.h>
#include <stdbool.h>
#ifndef PENDANT_AUTOMATIC_BATTERY_INDICATOR_MS
#define PENDANT_AUTOMATIC_BATTERY_INDICATOR_MS 0
#endif
#if PENDANT_AUTOMATIC_BATTERY_INDICATOR_MS != 0 && PENDANT_AUTOMATIC_BATTERY_INDICATOR_MS < 1000
#error "Automatic indication interval must be zero or at least 1000 ms"
#endif
typedef struct {uint32_t changed,shown,automatic_last;bool raw,stable,active,automatic_started;uint8_t pulses;} battery_indicator;
/* Zero-init. Debounce30ms. A held button cannot retrigger. Voltage bands are
 * provisional, NOT state-of-charge or remaining-runtime estimates.
 * Unknown=600ms solid; valid=1/2/3 flashes for <3600/3600..3899/>=3900mV. */
bool battery_indicator_poll(battery_indicator *s,uint32_t now,bool pressed,bool valid,uint16_t mv);
/* Optional buttonless candidate: immediate first indication, then interval_ms.
 * interval_ms must be >=1000; zero disables. No catch-up bursts. */
bool battery_indicator_periodic_poll(battery_indicator *s,uint32_t now,
 uint32_t interval_ms,bool valid,uint16_t mv);
#endif
