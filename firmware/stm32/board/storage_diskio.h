#ifndef PENDANT_STORAGE_DISKIO_H
#define PENDANT_STORAGE_DISKIO_H
#include "storage_probe.h"
/* Bind only while FatFs is unmounted and no callbacks are active.
 * Device must outlive the mount. NULL unbinds; no power/init/format side effects. */
void storage_diskio_bind(board_storage *device);
#endif
