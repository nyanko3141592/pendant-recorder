#include "../board/audio_adf.h"
#include <assert.h>
void HAL_MDF_AcqHalfCpltCallback(MDF_HandleTypeDef *h);
void HAL_MDF_ErrorCallback(MDF_HandleTypeDef *h);
static MDF_HandleTypeDef device;
static audio_queue q;
static unsigned ipsr,mask,tick,stop_calls,disable_calls,clear_calls,fault_stops;
void pendant_audio_fault_stop(MDF_HandleTypeDef *h){assert(h==&device);fault_stops++;}
static bool notify,stop_error;
unsigned __get_IPSR(void){return ipsr;}
unsigned __get_PRIMASK(void){return mask;}
uint32_t HAL_GetTick(void){return tick;}
void __WFI(void){tick++;if(notify&&tick%10==0)HAL_MDF_AcqHalfCpltCallback(&device);}
void HAL_NVIC_DisableIRQ(int irq){(void)irq;disable_calls++;}
void HAL_NVIC_ClearPendingIRQ(int irq){(void)irq;clear_calls++;}
bool pendant_audio_dma_owns(MDF_HandleTypeDef *h){return h==&device;}
HAL_StatusTypeDef pendant_audio_dma_stop(MDF_HandleTypeDef *h){
 assert(h==&device&&disable_calls);stop_calls++;
 if(stop_error)return HAL_ERROR;h->State=HAL_MDF_STATE_READY;return HAL_OK;
}
static void setup(void){
 ipsr=mask=tick=stop_calls=disable_calls=clear_calls=fault_stops=0;notify=true;stop_error=false;
 device.State=HAL_MDF_STATE_READY;assert(pendant_audio_bind_queue(&device,&q));
 device.State=HAL_MDF_STATE_ACQUISITION;
}
int main(void){
 setup();assert(pendant_audio_stop_and_drain(&device));
 assert(tick==10&&stop_calls==1&&clear_calls==1&&atomic_load(&q.produced)==1);
 assert(pendant_audio_stop_and_drain(&device)&&stop_calls==1);
 setup();notify=false;assert(!pendant_audio_stop_and_drain(&device));
 assert(tick==150&&stop_calls==1&&clear_calls==1&&fault_stops==1&&atomic_load(&q.produced)==0);
 setup();stop_error=true;assert(!pendant_audio_stop_and_drain(&device));assert(stop_calls==1);
 setup();ipsr=1;assert(!pendant_audio_stop_and_drain(&device)&&!stop_calls);
 setup();mask=1;assert(!pendant_audio_stop_and_drain(&device)&&!stop_calls);
 setup();MDF_HandleTypeDef other={0};assert(!pendant_audio_stop_and_drain(&other)&&!stop_calls);
 setup();HAL_MDF_ErrorCallback(&device);assert(!pendant_audio_stop_and_drain(&device));
 setup();tick=UINT32_MAX-5;notify=false;assert(!pendant_audio_stop_and_drain(&device));
 assert(tick==144&&stop_calls==1);
 return 0;
}
