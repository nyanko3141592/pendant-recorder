#include "../board/audio_adf.h"
#include <assert.h>
static unsigned step,irq,masked;static bool acknowledged=true,fail;
unsigned __get_IPSR(void){return irq;}
unsigned __get_PRIMASK(void){return masked;}
bool pendant_audio_boundary_stopped(MDF_HandleTypeDef *h){assert(h);return acknowledged;}
HAL_StatusTypeDef HAL_MDF_DeInit(MDF_HandleTypeDef *h){assert(h&&step++==0);return fail?1:HAL_OK;}
void test_gpio_clock(void){assert(step++==1);}
void HAL_GPIO_WritePin(void *port,unsigned pin,unsigned value){assert(port==GPIOB&&pin==GPIO_PIN_3&&value==GPIO_PIN_RESET&&step++==2);}
void HAL_GPIO_Init(void *port,GPIO_InitTypeDef *g){
 assert(port==GPIOB&&g->Pull==GPIO_NOPULL);
 if(step==3)assert(g->Pin==GPIO_PIN_3&&g->Mode==GPIO_MODE_OUTPUT_PP&&g->Speed==GPIO_SPEED_FREQ_LOW);
 else assert(step==4&&g->Pin==GPIO_PIN_4&&g->Mode==GPIO_MODE_ANALOG);
 step++;
}
void test_adf_clock_off(void){assert(step++==5);}
int main(void){
 MDF_HandleTypeDef h={ADF1_Filter0,HAL_MDF_STATE_READY};
 assert(!pendant_audio_shutdown(0)&&step==0);
 h.State=2;assert(!pendant_audio_shutdown(&h)&&step==0);h.State=HAL_MDF_STATE_READY;
 irq=1;assert(!pendant_audio_shutdown(&h)&&step==0);irq=0;
 masked=1;assert(!pendant_audio_shutdown(&h)&&step==0);masked=0;
 acknowledged=false;assert(!pendant_audio_shutdown(&h)&&step==0);acknowledged=true;
 fail=true;assert(!pendant_audio_shutdown(&h)&&step==1);
 step=0;fail=false;assert(pendant_audio_shutdown(&h)&&step==6);
}
