#include "stm32u5xx_hal.h"
#include "battery_io.h"
#include "battery_indicator.h"
#include <assert.h>
#include <stdbool.h>
static uint32_t mask;
static bool output,pending,inject_before_disable,inject_at_write,in_tick;
static unsigned writes,button_reads,pin15_mode,off_before_init;
static void tick(void){
 if(mask){pending=true;return;}
 in_tick=true;board_battery_led_tick_1ms();in_tick=false;
}
uint32_t __get_PRIMASK(void){return mask;}
void __disable_irq(void){
 if(inject_before_disable){inject_before_disable=false;tick();}
 mask=1;
}
void __set_PRIMASK(uint32_t value){
 assert(value<=1);mask=value;
 if(!mask&&pending){pending=false;tick();}
}
void HAL_SYSCFG_DisableIOAnalogBooster(void){assert(mask);}
void HAL_SYSCFG_EnableIOAnalogVoltageSelection(void){assert(mask);}
void HAL_GPIO_WritePin(void *port,uint32_t pin,GPIO_PinState state){
 assert(port==GPIOA&&pin==GPIO_PIN_8);assert(mask||in_tick);
 output=state==GPIO_PIN_SET;writes++;
 if(inject_at_write){inject_at_write=false;tick();}
}
void HAL_GPIO_Init(void *port,GPIO_InitTypeDef *pin){
 assert(port==GPIOA&&mask);
 if(pin->Pin==GPIO_PIN_8){assert(!output&&writes>0);off_before_init++;}
 if(pin->Pin==GPIO_PIN_15)pin15_mode=pin->Mode;
}
GPIO_PinState HAL_GPIO_ReadPin(void *port,uint32_t pin){assert(port==GPIOA&&pin==GPIO_PIN_15);button_reads++;return GPIO_PIN_RESET;}
int main(void){
 tick();board_battery_led(true);assert(writes==0&&!mask); /* pre-init no IO */
 mask=1;board_battery_io_init();assert(mask==1&&!output&&off_before_init==1);
 __set_PRIMASK(0);
#if PENDANT_AUTOMATIC_BATTERY_INDICATOR_MS
 assert(pin15_mode==GPIO_MODE_ANALOG&&!board_battery_button_pressed()&&!button_reads);
#else
 assert(pin15_mode==GPIO_MODE_INPUT&&board_battery_button_pressed()&&button_reads==1);
#endif
 board_battery_led(true);assert(output&&!mask);
 for(unsigned i=0;i<649;i++)tick();assert(output);
 /* Timeout arrives just before main's critical section; repeated high must not relight. */
 inject_before_disable=true;board_battery_led(true);assert(!output&&!mask);
 board_battery_led(true);assert(!output);
 board_battery_led(false);assert(!output);
 /* Tick requested during GPIO write is deferred until mask restore. */
 inject_at_write=true;board_battery_led(true);assert(output&&!mask&&!pending);
 for(unsigned i=0;i<648;i++)tick();assert(output);tick();assert(!output);
 mask=1;board_battery_led(false);assert(mask==1);board_battery_led(true);assert(mask==1&&output);
 for(unsigned i=0;i<1000;i++)tick();assert(output&&pending); /* IRQ starvation is NOT wall-time protection. */
 __set_PRIMASK(0);assert(output&&!pending);
 for(unsigned i=0;i<649;i++)tick();assert(!output);
 board_battery_led(false);board_battery_led(true);board_battery_io_init();assert(!output&&!mask);
 for(unsigned i=0;i<700;i++)tick();assert(!output);
 return 0;
}
