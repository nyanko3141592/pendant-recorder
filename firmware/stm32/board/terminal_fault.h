#ifndef PENDANT_TERMINAL_FAULT_H
#define PENDANT_TERMINAL_FAULT_H
#include <stdbool.h>
/* Quiesces externally powered peripherals and enters Standby when VBUS is
 * absent.  Returns true only while VBUS is present.  An incomplete storage
 * tail may be lost; previously committed files rely on power-loss recovery. */
bool board_terminal_fault_quiesce_until_vbus(void);
#endif
