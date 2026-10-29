#ifndef PENDANT_BATTERY_ADC_H
#define PENDANT_BATTERY_ADC_H
#include <stdbool.h>
#include <stdint.h>
/* Bench candidate: main context, IRQ/tick enabled, HCLK16MHz, stable3.3V,
 * exclusive ADC12 ownership, divider settled. May block during calibration.
 * Output unchanged on failure. No SOC/charge-control use before qualification. */
bool board_battery_measure_mv(uint16_t *mv);
#endif
