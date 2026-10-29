#ifndef PENDANT_LOW_BATTERY_STANDBY_H
#define PENDANT_LOW_BATTERY_STANDBY_H
#include <stdbool.h>
/* Returns true only when VBUS is already present.  With VBUS absent, enters
 * Standby and must wake by reset from PA0/WKUP1 low; a HAL return is failure. */
bool board_low_battery_standby_until_vbus(void);
#endif
