#ifndef PENDANT_USB_BOARD_H
#define PENDANT_USB_BOARD_H
#include <stdbool.h>
/* Main task, HAL tick running, qualified 3.3V rail and active CPU clocks.
 * USB and CRS must be exclusively owned by this module.
 * HSI48/CLK48 are shared: no other owner may reconfigure them while USB runs.
 * Call input init before reading VBUS_N. No USB startup is automatic. */
void board_usb_vbus_init(void);
bool board_usb_vbus_present(void);
bool board_usb_prepare(void);
/* After tud_task returns, outside callbacks/IRQ. Successful stop deinitializes
 * TinyUSB queue and controller before clock-off; caller may then emit
 * HOST_RELEASED. Releases the USB HSI48 lease after controller/CRS shutdown;
 * another active owner keeps the oscillator running. */
bool board_usb_stop(void);
#endif
