#include "../board/storage_power.h"
#include "../board/storage_spi.h"
#include <assert.h>
#include <stdlib.h>
static unsigned step,scenario;
unsigned __get_IPSR(void){return 0;}
unsigned __get_PRIMASK(void){return scenario==2;}
HAL_StatusTypeDef storage_spi_release_pins(void){assert(step++==0);return scenario==1?HAL_ERROR:HAL_OK;}
void test_clock(void){assert(step++==1);}
void HAL_GPIO_WritePin(void *port,unsigned pin,unsigned value){
 assert(port==GPIOB&&pin==GPIO_PIN_5);
 if(!value)assert(step++==2);else assert(step++==5);
}
void HAL_GPIO_Init(void *port,GPIO_InitTypeDef *p){assert(port==GPIOB&&p->Pin==GPIO_PIN_5&&p->Pull==GPIO_PULLDOWN&&step++==3);}
void HAL_Delay(uint32_t ms){if(ms==50)assert(step++==4);else assert(ms==40&&step++==6);}
int main(int argc,char **argv){
 assert(argc==2);scenario=(unsigned)atoi(argv[1]);
 if(scenario==3){
  assert(board_storage_power_emergency_off());assert(step==4);
  assert(!board_storage_power_startup());
  assert(!board_storage_power_restart_for_export());
  return 0;
 }
 assert(!board_storage_power_restart_for_export());
 assert(board_storage_power_startup()==(scenario==0));
 assert(step==(scenario==0?7:scenario==1?1:0));
 assert(!board_storage_power_startup());
 if(scenario==0){
  step=0;assert(board_storage_power_shutdown());assert(step==3);
  step=0;assert(board_storage_power_restart_for_export());assert(step==7);
  assert(!board_storage_power_restart_for_export());
  step=0;scenario=1;assert(!board_storage_power_shutdown());assert(step==1);
  assert(!board_storage_power_restart_for_export());
  step=0;assert(board_storage_power_emergency_off());assert(step==4);
  assert(!board_storage_power_restart_for_export());
 }
 return 0;
}
