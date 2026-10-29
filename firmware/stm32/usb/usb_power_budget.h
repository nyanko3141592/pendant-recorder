#ifndef PENDANT_USB_POWER_BUDGET_H
#define PENDANT_USB_POWER_BUDGET_H
/* Canonical XE declares 100mA. U13 TPS2552DBVR-1 independently limits total
 * USB input to its guaranteed 50..100mA range and latches off on overcurrent;
 * this macro is a descriptor/policy value, not an exact current clamp. */
#ifndef PENDANT_USB_MAX_POWER_MA
#define PENDANT_USB_MAX_POWER_MA 100
#endif
/* Canonical XE uses a fixed, active-low TPS2552DBVR-1 latch-off limiter. */
#ifndef PENDANT_FIXED_USB_LIMIT
#define PENDANT_FIXED_USB_LIMIT 1
#endif
#if PENDANT_FIXED_USB_LIMIT != 0 && PENDANT_FIXED_USB_LIMIT != 1
#error "Fixed limit option must be 0 or 1"
#endif
#if PENDANT_FIXED_USB_LIMIT && PENDANT_USB_MAX_POWER_MA != 100
#error "Fixed limit board requires the 100mA descriptor"
#endif
#define PENDANT_USB_GRANT_MA (PENDANT_FIXED_USB_LIMIT ? 100 : 500)
/* Bench-only opt-in until battery, thermal guard and input path qualify. The
 * fixed board may request charging before enumeration, including from a
 * power-only adapter, because TPS2552 independently limits the complete USB
 * input below the declared 100mA one-unit-load budget. */
#ifndef PENDANT_EXPERIMENTAL_USB_CHARGING
#define PENDANT_EXPERIMENTAL_USB_CHARGING 0
#endif
#if PENDANT_EXPERIMENTAL_USB_CHARGING != 0 && PENDANT_EXPERIMENTAL_USB_CHARGING != 1
#error "Charging option must be 0 or 1"
#endif
#if PENDANT_EXPERIMENTAL_USB_CHARGING && !PENDANT_FIXED_USB_LIMIT && PENDANT_USB_MAX_POWER_MA != 500
#error "Non-fixed charging requires the 500mA configuration"
#endif
#endif
