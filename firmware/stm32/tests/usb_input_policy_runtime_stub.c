/* Runtime tests mock hardware; policy edge sequences have their own test. */
#include <stdbool.h>
#include <stdint.h>
bool test_usb_suspended,test_input_suspend_failure,test_charge_requested,test_charge_request_seen;
void board_usb_input_v15_revoke(void){test_charge_requested=false;}
bool board_usb_input_v15_suspend(void){return !test_input_suspend_failure;}
bool board_usb_input_v15_resume(void){return true;}
bool tud_suspended(void){return test_usb_suspended;}

bool test_usb_queue_overflow;
bool tud_event_queue_overflowed(void){return test_usb_queue_overflow;}
uint32_t board_usb_input_v15_epoch(void){return 0;}
bool board_usb_input_v15_configured(unsigned granted_ma,uint32_t expected_epoch){
 (void)granted_ma;(void)expected_epoch;return true;
}
bool board_usb_input_v15_charge_request(uint32_t expected_epoch){
 (void)expected_epoch;test_charge_requested=true;test_charge_request_seen=true;return true;
}
bool tud_task_event_ready(void){return false;}
bool tud_configuration_acknowledged(void){return true;}
