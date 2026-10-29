#ifndef PENDANT_MSC_STORAGE_H
#define PENDANT_MSC_STORAGE_H
#include "../board/storage_probe.h"
/* Bind once before USB starts; callbacks run only in serialized tud_task.
 * Application consumes actions after tud_task returns, then drains USB before
 * HOST_RELEASED. The recording LUN is always read-only. Never recover/rebind
 * from inside a USB callback. */
void msc_storage_bind(board_storage *device);
unsigned msc_storage_take_actions(void);
#endif
