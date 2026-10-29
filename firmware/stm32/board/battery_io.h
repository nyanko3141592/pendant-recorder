#ifndef PENDANT_BATTERY_IO_H
#define PENDANT_BATTERY_IO_H
#include <stdint.h>
#include <stdbool.h>
/* Initialize only. No voltage/SOC claim until calibrated ADC acquisition exists. */
void board_battery_io_init(void);
bool board_battery_button_pressed(void);
void board_battery_led(bool on);
/* Call once per delivered 1ms SysTick; timeout is conditional on IRQ delivery. */
void board_battery_led_tick_1ms(void);
/* STM32U5 factory VREFINT calibration constants are supplied by the selected
 * STM32U585 CMSIS/HAL device headers; do not substitute a sibling-MCU value. */
bool board_battery_reference_calibration(uint16_t *cal14);
#endif
