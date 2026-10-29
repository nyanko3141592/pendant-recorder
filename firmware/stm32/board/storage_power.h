#ifndef PENDANT_STORAGE_POWER_H
#define PENDANT_STORAGE_POWER_H
#include <stdbool.h>
/* Cold startup only, once per reset, before probe/mount/USB. No storage owner,
 * open handles or IO may exist. HAL tick/interrupts and stable V3V3 required.
 * Floats PA4..PA7 before PB5 SD_EN low, waits50ms, enables and waits40ms.
 * These are provisional delays, NOT measured rail-voltage qualification.
 * Never invoke as recovery from a mounted filesystem or after host writes. */
bool board_storage_power_startup(void);
/* Terminal power-off after successful sync/unmount and USB teardown only.
 * Releases SPI pins before SD_EN low; successful stop permits export restart. */
bool board_storage_power_shutdown(void);
/* Irreversible terminal-fault cutoff.  Best-effort releases the SPI pins, but
 * always drives SD_EN low even when that release reports an error.  This can
 * discard an incomplete write and never permits restart in the same reset;
 * use only after the application has latched a terminal fault. */
bool board_storage_power_emergency_off(void);
/* Only after successful controlled stop: no mounted filesystem, audio or USB
 * access. Requires successful shutdown in this reset, never a fault recovery. */
bool board_storage_power_restart_for_export(void);
#endif
