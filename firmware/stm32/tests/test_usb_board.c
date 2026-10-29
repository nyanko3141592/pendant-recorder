#include "../board/usb_board.h"
#include "../board/clock48.h"
#include "stm32u5xx_hal.h"
#include <assert.h>
#include <stdlib.h>
#include "device/dcd.h"
static unsigned irq_revokes;
void board_usb_input_v15_revoke_from_isr(void){irq_revokes++;}
void tud_event_hook_cb(uint8_t,uint32_t,bool);
void tud_event_queue_overflow_cb(uint8_t,bool);
static unsigned scenario,ipsr,masked,reads,starts,stops,usb,crs,uid,initialized,deinit_calls;
void event(unsigned n){if(n==2)crs=1;if(n==4)usb=1;if(n==7){assert(!initialized);usb=0;}if(n==10)crs=0;}
unsigned __get_IPSR(void){return ipsr;}unsigned __get_PRIMASK(void){return masked;}
HAL_StatusTypeDef HAL_RCC_OscConfig(RCC_OscInitTypeDef *c){
 if(c->HSI48State){starts++;return scenario==1?HAL_ERROR:HAL_OK;}
 assert(!usb&&!crs&&!initialized);stops++;return scenario==6?HAL_ERROR:HAL_OK;
}
HAL_StatusTypeDef HAL_RCCEx_PeriphCLKConfig(RCC_PeriphCLKInitTypeDef *c){assert(c->IclkClockSelection==RCC_CLK48CLKSOURCE_HSI48);return scenario==2?HAL_ERROR:HAL_OK;}
void HAL_RCCEx_CRSConfig(RCC_CRSInitTypeDef *c){assert(crs&&c->ReloadValue==47999);}
void HAL_NVIC_DisableIRQ(unsigned n){assert(n==USB_IRQn);}void HAL_NVIC_ClearPendingIRQ(unsigned n){assert(n==USB_IRQn);}
void HAL_NVIC_SetPriority(unsigned n,unsigned p,unsigned s){assert(n==USB_IRQn&&p==5&&!s);}
void HAL_GPIO_Init(unsigned a,GPIO_InitTypeDef *p){assert(a==GPIOA&&p);}
unsigned HAL_GPIO_ReadPin(unsigned a,unsigned p){assert(a==GPIOA&&p==GPIO_PIN_0);reads++;return scenario==3&&reads>=2;}
void HAL_PWREx_EnableVddUSB(void){}void HAL_PWREx_DisableVddUSB(void){assert(!usb);}
uint32_t HAL_GetUIDw0(void){return 1;}uint32_t HAL_GetUIDw1(void){return 2;}uint32_t HAL_GetUIDw2(void){return 3;}
void usb_descriptors_set_uid(const uint32_t *p){uid=p!=NULL;if(p)assert(p[0]==1&&p[2]==3);}
bool tud_inited(void){return initialized;}
bool tud_deinit(unsigned n){assert(!n);deinit_calls++;if(scenario==4)return false;if(scenario!=5)initialized=0;return true;}
void tusb_int_handler(unsigned n,bool b){assert(!n&&b);}
int main(int argc,char **argv){
 for(unsigned isr=0;isr<2;isr++){
  unsigned before=irq_revokes;
  tud_event_hook_cb(0,DCD_EVENT_BUS_RESET,isr);tud_event_hook_cb(0,DCD_EVENT_UNPLUGGED,isr);tud_event_hook_cb(0,DCD_EVENT_SUSPEND,isr);
  assert(irq_revokes==before+3);
  tud_event_hook_cb(0,DCD_EVENT_RESUME,isr);tud_event_hook_cb(0,DCD_EVENT_XFER_COMPLETE,isr);tud_event_hook_cb(1,DCD_EVENT_SUSPEND,isr);
  assert(irq_revokes==before+3);
  tud_event_hook_cb(0,DCD_EVENT_SETUP_RECEIVED,isr);assert(irq_revokes==before+4);
  tud_event_queue_overflow_cb(0,isr);assert(irq_revokes==before+5);
  tud_event_queue_overflow_cb(1,isr);assert(irq_revokes==before+5);
 }

 assert(argc==2);scenario=atoi(argv[1]);
 ipsr=1;assert(!board_usb_prepare()&&!board_usb_stop());ipsr=0;masked=1;assert(!board_usb_prepare()&&!board_usb_stop());masked=0;assert(!starts);
 if(scenario>=1&&scenario<=3){assert(!board_usb_prepare());assert(!usb&&!crs&&!uid);assert(stops==(scenario!=1));return 0;}
 assert(board_usb_prepare());assert(usb&&crs&&uid&&starts==1);assert(!board_usb_prepare());initialized=1;
 if(scenario==4||scenario==5){assert(!board_usb_stop());assert(usb&&crs&&uid&&!stops);scenario=0;}
 if(scenario==6){assert(!board_usb_stop());assert(!usb&&!crs&&!uid&&stops==1);assert(!board_usb_prepare());assert(!board_usb_stop());return 0;}
 assert(board_usb_stop());assert(!usb&&!crs&&!uid&&stops==1&&deinit_calls);
 assert(board_usb_stop());assert(stops==1);
 assert(board_clock48_acquire(CLOCK48_RNG));assert(board_usb_prepare());assert(board_usb_stop());assert(stops==1);
 assert(board_clock48_release(CLOCK48_RNG));assert(stops==2);
 return 0;
}
