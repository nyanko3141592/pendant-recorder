#ifndef PENDANT_USB_INPUT_POLICY_H
#define PENDANT_USB_INPUT_POLICY_H
#include <stdbool.h>
/* Single USB controller, main-task use. Does not grant high input current. */
void usb_input_policy_init(void);
bool usb_input_policy_poll(void);
#endif
