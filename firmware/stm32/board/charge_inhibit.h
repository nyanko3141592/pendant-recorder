#ifndef PENDANT_CHARGE_INHIBIT_H
#define PENDANT_CHARGE_INHIBIT_H
/* Call early after HAL initialization, before enabling peripheral interrupts.
 * Current battery/NTC/harness is unqualified: default policy keeps charging off.
 * Not a substitute for the external reset-state pulldown or ramp validation. */
void board_charge_inhibit_init(void);
#endif
