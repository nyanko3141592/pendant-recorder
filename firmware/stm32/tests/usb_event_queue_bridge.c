/* Exercise the actual internal queue_event and OS_NONE FIFO without a USB PHY. */
#include "../vendor/tinyusb/src/device/usbd.c"
void test_event_queue_init(void){_usbd_q=osal_queue_create(&_usbd_qdef);}
bool test_event_queue_push(uint32_t id,bool isr){
 dcd_event_t event={.rhport=0,.event_id=id};return queue_event(&event,isr);
}
unsigned test_event_queue_capacity(void){return CFG_TUD_TASK_QUEUE_SZ;}

bool test_configuration_status(uint16_t value,unsigned result,bool zero_config){
 _usbd_dev.cfg_num=zero_config?0:1;
 _usbd_dev.configuration_acknowledged=false;
 _usbd_dev.ctrl_xfer.request=(tusb_control_request_t){.bmRequestType=0,.bRequest=TUSB_REQ_SET_CONFIGURATION,.wValue=value};
 if(tud_configuration_acknowledged())return false;
 if(!usbd_control_xfer_cb(0,0x80,(xfer_result_t)result,0))return false;
 return tud_configuration_acknowledged();
}
