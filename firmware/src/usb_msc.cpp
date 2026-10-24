#include "modules.h"
#include "config.h"
// TODO: USBMSC (TinyUSB) の onRead/onWrite で SD のセクタを読み書き
// 注意: MSC中はファームからSDに触らない
bool usb_vbus_present() { return false; }
void usb_msc_enter() {}
void usb_msc_exit() {}
