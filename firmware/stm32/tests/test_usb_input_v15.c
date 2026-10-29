#include "../board/usb_input_v15.h"
#include "stm32u5xx_hal.h"
#include "../board/usb_input_v15_pins.h"
#include <assert.h>
#include "../usb/usb_power_budget.h"
#include <stdbool.h>
static bool pending_revoke,race_inhibit;
static uint32_t tick;
uint32_t HAL_GetTick(void){return tick;}
static unsigned bits[3],irq,masked,delays,writes,inits,charge_inits;static bool vbus=true,off=true,charge_inhibited;
#define SUSPEND (bits[USB_INPUT_SUSPEND_PORT]&USB_INPUT_SUSPEND_PIN)
#define BUDGET (bits[USB_INPUT_BUDGET_PORT]&USB_INPUT_BUDGET_PIN)
#define RESUME (bits[USB_INPUT_RESUME_PORT]&USB_INPUT_RESUME_PIN)
#define ALL_LOW (!bits[GPIOA]&&!bits[GPIOB])
unsigned __get_IPSR(void){return irq;}unsigned __get_PRIMASK(void){return masked;}
void __disable_irq(void){masked=1;}
void __set_PRIMASK(unsigned value){masked=value;if(!masked&&pending_revoke){pending_revoke=false;irq=1;board_usb_input_v15_revoke_from_isr();irq=0;}}
bool board_usb_vbus_present(void){return vbus;}
void board_charge_inhibit_init(void){assert(!irq&&!masked);charge_inits++;charge_inhibited=true;bits[GPIOB]&=~GPIO_PIN_2;if(race_inhibit){race_inhibit=false;irq=1;board_usb_input_v15_revoke_from_isr();irq=0;}}
void HAL_GPIO_WritePin(unsigned port,unsigned pins,unsigned value){
 assert(port<3);
 if(PENDANT_FIXED_USB_LIMIT)assert(port!=USB_INPUT_BUDGET_PORT||!(pins&USB_INPUT_BUDGET_PIN));if(port==GPIOB&&(pins&GPIO_PIN_2)){charge_inhibited=!value;if(value)assert(masked&&(PENDANT_FIXED_USB_LIMIT||BUDGET));}bool old_suspend=SUSPEND;writes++;
 if(value)bits[port]|=pins;else bits[port]&=~pins;
 if(old_suspend&&!SUSPEND){assert(charge_inhibited&&!BUDGET);off=true;}
 if(port==USB_INPUT_BUDGET_PORT&&pins==USB_INPUT_BUDGET_PIN&&value){assert(masked);}
 if(RESUME){assert(charge_inhibited&&!SUSPEND&&!BUDGET);off=false;}
}
void HAL_GPIO_Init(unsigned port,GPIO_InitTypeDef *p){assert(!irq&&!masked);inits++;assert(p->Mode==GPIO_MODE_OUTPUT_PP&&p->Pull==GPIO_PULLDOWN);assert(!(bits[port]&p->Pin));}
void HAL_Delay(uint32_t n){assert(!irq&&!masked);assert(n==1);delays++;}
int main(void){
 irq=1;board_usb_input_v15_revoke_from_isr();assert(writes==0&&inits==0&&charge_inits==0);irq=0;

 assert(!board_usb_input_v15_suspend()&&!board_usb_input_v15_resume()&&!board_usb_input_v15_configured(PENDANT_USB_GRANT_MA,board_usb_input_v15_epoch()));
 board_usb_input_v15_init();assert(off&&ALL_LOW);
 assert(!board_usb_input_v15_configured(PENDANT_FIXED_USB_LIMIT ? 500 : 100,board_usb_input_v15_epoch()));assert(ALL_LOW);
 irq=1;unsigned before=writes;assert(!board_usb_input_v15_suspend()&&!board_usb_input_v15_resume()&&!board_usb_input_v15_configured(PENDANT_USB_GRANT_MA,board_usb_input_v15_epoch()));assert(writes==before);irq=0;
 masked=1;assert(!board_usb_input_v15_suspend());masked=0;
 assert(board_usb_input_v15_resume());
 assert(PENDANT_FIXED_USB_LIMIT ? (off&&ALL_LOW&&delays==0) : (!off&&ALL_LOW&&delays==3));
 assert(board_usb_input_v15_configured(PENDANT_USB_GRANT_MA,board_usb_input_v15_epoch()));assert((PENDANT_FIXED_USB_LIMIT ? !BUDGET : !!BUDGET)&&!SUSPEND&&!RESUME);
 charge_inhibited=false;assert(board_usb_input_v15_suspend());assert(off&&charge_inhibited&&ALL_LOW);
 assert(!board_usb_input_v15_configured(PENDANT_USB_GRANT_MA,board_usb_input_v15_epoch()));assert(off&&ALL_LOW);
 board_usb_input_v15_init();assert(off&&ALL_LOW);
 vbus=false;assert(!board_usb_input_v15_resume()&&!board_usb_input_v15_configured(PENDANT_USB_GRANT_MA,board_usb_input_v15_epoch()));assert(off&&ALL_LOW);
 vbus=true;assert(board_usb_input_v15_resume());assert(PENDANT_FIXED_USB_LIMIT ? off : !off);assert(ALL_LOW);
 assert(board_usb_input_v15_configured(PENDANT_USB_GRANT_MA,board_usb_input_v15_epoch()));board_usb_input_v15_revoke();assert(ALL_LOW&&charge_inhibited);
 /* Interrupt and masked-context revocation must not call init or delay. */
 assert(board_usb_input_v15_configured(PENDANT_USB_GRANT_MA,board_usb_input_v15_epoch()));
 bits[GPIOB]|=GPIO_PIN_2;charge_inhibited=false;
 unsigned old_delays=delays,old_inits=inits,old_charge_inits=charge_inits;
 irq=1;board_usb_input_v15_revoke_from_isr();
 assert(!BUDGET&&charge_inhibited&&!(bits[GPIOB]&GPIO_PIN_2));
 assert(delays==old_delays&&inits==old_inits&&charge_inits==old_charge_inits);irq=0;
 assert(board_usb_input_v15_configured(PENDANT_USB_GRANT_MA,board_usb_input_v15_epoch()));masked=1;board_usb_input_v15_revoke_from_isr();
 assert(!BUDGET&&delays==old_delays&&inits==old_inits);masked=0;
 uint32_t stale=board_usb_input_v15_epoch();
 irq=1;board_usb_input_v15_revoke_from_isr();irq=0;
 assert(!board_usb_input_v15_configured(PENDANT_USB_GRANT_MA,stale)&&!BUDGET);
 stale=board_usb_input_v15_epoch();race_inhibit=true;
 assert(!board_usb_input_v15_configured(PENDANT_USB_GRANT_MA,stale)&&!BUDGET);
 stale=board_usb_input_v15_epoch();pending_revoke=true;
 assert(!board_usb_input_v15_configured(PENDANT_USB_GRANT_MA,stale));
 assert(!BUDGET&&board_usb_input_v15_epoch()!=stale);
 /* Charging needs an actual grant, not merely a current epoch. */
 tick=UINT32_MAX-4; /* settling interval must survive the tick rollover */
 assert(!board_usb_input_v15_charge_request(board_usb_input_v15_epoch()));
 assert(board_usb_input_v15_configured(PENDANT_USB_GRANT_MA,board_usb_input_v15_epoch()));
 assert(!board_usb_input_v15_charge_request(board_usb_input_v15_epoch()));
 tick+=9;assert(!board_usb_input_v15_charge_request(board_usb_input_v15_epoch()));
 tick+=1;assert(board_usb_input_v15_charge_request(board_usb_input_v15_epoch()));
 assert(!charge_inhibited&&(bits[GPIOB]&GPIO_PIN_2));
 unsigned renewal_writes=writes,renewal_inits=charge_inits;
 assert(board_usb_input_v15_configured(PENDANT_USB_GRANT_MA,board_usb_input_v15_epoch()));
 assert(writes==renewal_writes&&charge_inits==renewal_inits&&!charge_inhibited);
 stale=board_usb_input_v15_epoch();pending_revoke=true;
 assert(!board_usb_input_v15_configured(PENDANT_USB_GRANT_MA,stale));
 assert(ALL_LOW&&charge_inhibited);
 assert(board_usb_input_v15_configured(PENDANT_USB_GRANT_MA,board_usb_input_v15_epoch()));
 tick+=10;assert(board_usb_input_v15_charge_request(board_usb_input_v15_epoch()));
 irq=1;assert(!board_usb_input_v15_charge_request(board_usb_input_v15_epoch()));
 board_usb_input_v15_revoke_from_isr();irq=0;
 assert(ALL_LOW&&charge_inhibited);
 assert(!board_usb_input_v15_charge_request(board_usb_input_v15_epoch()));
 assert(board_usb_input_v15_configured(PENDANT_USB_GRANT_MA,board_usb_input_v15_epoch()));
 stale=board_usb_input_v15_epoch();pending_revoke=true;
 assert(!board_usb_input_v15_charge_request(stale));assert(ALL_LOW);
 assert(board_usb_input_v15_configured(PENDANT_USB_GRANT_MA,board_usb_input_v15_epoch()));
 assert(!board_usb_input_v15_charge_request(stale)&&charge_inhibited);
 tick+=10;assert(board_usb_input_v15_charge_request(board_usb_input_v15_epoch()));
 assert(!board_usb_input_v15_configured(PENDANT_FIXED_USB_LIMIT ? 500 : 100,board_usb_input_v15_epoch()));
 assert(!board_usb_input_v15_charge_request(board_usb_input_v15_epoch())&&ALL_LOW);
 assert(board_usb_input_v15_configured(PENDANT_USB_GRANT_MA,board_usb_input_v15_epoch()));
 vbus=false;assert(!board_usb_input_v15_charge_request(board_usb_input_v15_epoch()));
 assert(charge_inhibited);vbus=true;
 masked=1;assert(!board_usb_input_v15_charge_request(board_usb_input_v15_epoch()));masked=0;
 return 0;
}
