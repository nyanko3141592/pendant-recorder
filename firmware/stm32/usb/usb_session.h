#ifndef PENDANT_USB_SESSION_H
#define PENDANT_USB_SESSION_H
#include "../core/storage_owner.h"
typedef struct { storage_owner *owner; bool configured,pending_configuration; } usb_session;
/* Main task only. Call instead of tud_task. Process returned actions outside
 * USB callbacks. HOST_RELEASED requires actual USB callback/endpoint drain;
 * this adapter never claims that drain or remounts the filesystem. */
void usb_session_init(usb_session *session,storage_owner *owner);
unsigned usb_session_service(usb_session *session);
#endif
