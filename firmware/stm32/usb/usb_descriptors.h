#ifndef PENDANT_USB_DESCRIPTORS_H
#define PENDANT_USB_DESCRIPTORS_H
#include <stdint.h>
/* Call once before USB initialization, with STM32 96-bit UID words.
 * Never change identity while connected. VID/PID are build-time allocations. */
void usb_descriptors_set_uid(const uint32_t uid[3]);
const uint8_t *tud_hid_descriptor_report_cb(uint8_t instance);
#endif
