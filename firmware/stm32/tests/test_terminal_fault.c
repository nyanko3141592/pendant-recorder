#include "../board/terminal_fault.h"
#include <assert.h>
#include <stdbool.h>

static unsigned ipsr,primask,step;
static bool usb_stop_result,storage_result,standby_result;
unsigned __get_IPSR(void){return ipsr;}
unsigned __get_PRIMASK(void){return primask;}
void board_usb_input_v15_revoke(void){assert(++step==1);}
void board_battery_led(bool on){assert(!on&&++step==2);}
bool board_usb_stop(void){assert(++step==3);return usb_stop_result;}
bool board_storage_power_emergency_off(void){assert(++step==4);return storage_result;}
bool board_low_battery_standby_until_vbus(void){assert(++step==5);return standby_result;}

static void reset(void){ipsr=primask=step=0;usb_stop_result=storage_result=standby_result=true;}
int main(void){
 reset();ipsr=1;assert(!board_terminal_fault_quiesce_until_vbus()&&!step);
 reset();primask=1;assert(!board_terminal_fault_quiesce_until_vbus()&&!step);
 reset();assert(board_terminal_fault_quiesce_until_vbus()&&step==5);
 reset();usb_stop_result=false;storage_result=false;standby_result=false;
 assert(!board_terminal_fault_quiesce_until_vbus()&&step==5);
 return 0;
}
