#include "../board/low_battery_standby.h"
#include "stm32u5xx_hal.h"
#include <assert.h>
#include <stdbool.h>
#include <stdint.h>

static unsigned ipsr,primask,step,reads,scenario;
static bool charge_revoked,led_on;
unsigned __get_IPSR(void){return ipsr;}
unsigned __get_PRIMASK(void){return primask;}
void board_usb_vbus_init(void){assert(++step==1);}
void board_usb_input_v15_revoke(void){assert(++step==2);charge_revoked=true;}
void board_battery_led(bool on){assert(++step==3);led_on=on;}
bool board_usb_vbus_present(void){
 reads++;
 if(scenario==1)return true;
 if(scenario==2)return reads==2;
 return false;
}
void HAL_PWR_DisableWakeUpPin(uint32_t pin){assert(pin==PWR_WAKEUP_PIN1);step++;}
void mock_clear_flag(uint32_t flag){assert(flag==PWR_WAKEUP_FLAG1);step++;}
void HAL_PWR_EnableWakeUpPin(uint32_t pin){assert(pin==PWR_WAKEUP_PIN1_LOW_0);step++;}
void mock_dsb(void){step++;}
void mock_isb(void){step++;}
void HAL_PWR_EnterSTANDBYMode(void){step++;}

static void reset(unsigned s){ipsr=primask=step=reads=0;scenario=s;charge_revoked=false;led_on=true;}
int main(void){
 reset(0);ipsr=1;assert(!board_low_battery_standby_until_vbus()&&!step);
 reset(0);primask=1;assert(!board_low_battery_standby_until_vbus()&&!step);
 reset(1);assert(board_low_battery_standby_until_vbus());assert(step==3&&reads==1&&charge_revoked&&!led_on);
 reset(2);assert(board_low_battery_standby_until_vbus());assert(step==10&&reads==2&&charge_revoked&&!led_on);
 reset(0);assert(!board_low_battery_standby_until_vbus());assert(step==9&&reads==2&&charge_revoked&&!led_on);
 return 0;
}
