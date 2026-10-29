#ifndef PENDANT_CLOCK48_H
#define PENDANT_CLOCK48_H
#include <stdbool.h>
typedef enum { CLOCK48_RNG=1, CLOCK48_USB=2 } clock48_owner;
/* Main thread with interrupts enabled. Each consumer owns at most one lease.
 * Release only after its peripheral and CRS are stopped. Failed transitions
 * latch a fault and retain ownership; reset is required for recovery. */
bool board_clock48_acquire(clock48_owner owner);
bool board_clock48_release(clock48_owner owner);
#endif
