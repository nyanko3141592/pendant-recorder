#ifndef PENDANT_USB_INPUT_V15_PINS_H
#define PENDANT_USB_INPUT_V15_PINS_H
/* Legacy non-fixed mini-rect-v15 GPIO map, retained only for the compile-time
 * PENDANT_FIXED_USB_LIMIT=0 test path. Canonical XE uses the fixed TPS2552
 * hardware path and does not configure these pins. */
#define USB_INPUT_SUSPEND_PORT GPIOA
#define USB_INPUT_SUSPEND_PIN GPIO_PIN_2
#define USB_INPUT_BUDGET_PORT GPIOB
#define USB_INPUT_BUDGET_PIN GPIO_PIN_6
#define USB_INPUT_RESUME_PORT GPIOB
#define USB_INPUT_RESUME_PIN GPIO_PIN_1
#endif
