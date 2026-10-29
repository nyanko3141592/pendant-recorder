#ifndef PENDANT_TUSB_CONFIG_H
#define PENDANT_TUSB_CONFIG_H
#define CFG_TUSB_MCU OPT_MCU_STM32U5
#define CFG_TUSB_OS OPT_OS_NONE
#define CFG_TUSB_DEBUG 0
#define CFG_TUD_ENABLED 1
/* Observe reset/deconfigure before processing the next setup event. */
#define CFG_TUD_TASK_EVENTS_PER_RUN 1
#define CFG_TUH_ENABLED 0
#define CFG_TUD_MAX_SPEED OPT_MODE_FULL_SPEED
#define CFG_TUD_ENDPOINT0_SIZE 64
#define CFG_TUD_MSC 1
#define CFG_TUD_MSC_EP_BUFSIZE 512
#define CFG_TUD_HID 1
/* Feature payload64 + report-ID byte. Interrupt endpoint itself remains64. */
#define CFG_TUD_HID_EP_BUFSIZE 65
#define CFG_TUSB_MEM_ALIGN __attribute__((aligned(4)))
#endif
