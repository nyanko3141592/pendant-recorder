/* Link/memory integration fixture, NOT a recorder firmware release.
 * No acquisition, storage, USB, RNG or charging is enabled here. */
#include "stm32u5xx_hal.h"
#include "charge_inhibit.h"
#include "recording_pipeline.h"
#include "audio_queue.h"
#include "recorder_boot.h"
static recorder_app app; /* Include complete application RAM in link budget. */
int main(void){
 HAL_Init();
 board_charge_inhibit_init();
 recording_pipeline_init(&app.pipeline);
 audio_queue_init(&app.queue);
 for(;;)__WFI();
}
void SysTick_Handler(void){HAL_IncTick();}
/* Bare-metal C runtime hook; no C++ constructors or board side effects. */
void _init(void){}
