#ifndef PENDANT_BATTERY_VOLTAGE_H
#define PENDANT_BATTERY_VOLTAGE_H
#include <stdbool.h>
#include <stdint.h>
/* All counts must be normalized to14-bit, including the factory reference.
 * Equal1M/1M divider nominal ratio2. This is voltage, not remaining capacity.
 * Returns false without modifying output for invalid/saturated inputs or rails.
 * Caller must qualify calibration format and ADC acquisition before use. */
bool battery_voltage_mv(uint16_t battery_raw,uint16_t reference_raw,
                        uint16_t reference_cal_14,uint16_t *battery_mv);
#endif
