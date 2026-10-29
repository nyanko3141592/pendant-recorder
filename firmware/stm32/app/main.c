/* Bench application entry point. Not a released/flashed product image.
 * Explicit recipient configuration required; private age keys stay on host. */
#include "recorder_boot.h"
#include "system_clock.h"
#include "instruction_cache.h"
#include "charge_inhibit.h"
#include "battery_io.h"
#include "battery_adc.h"
#include "battery_monitor.h"
#include "battery_indicator.h"
#include "terminal_indicator.h"
#include "low_battery_standby.h"
#include "terminal_fault.h"
#include "recipient_flash.h"
#include "recipient_provisioning.h"

#include "battery_stop.h"
#include "export_runtime.h"
#include "usb_board.h"
#include "usb_input_v15.h"
#ifdef PENDANT_BATTERY_STOP_MV
_Static_assert(PENDANT_BATTERY_STOP_MV>=3000 && PENDANT_BATTERY_STOP_MV<=4200,"Invalid bench stop threshold");
static battery_stop voltage_stop;
static export_runtime export_app;
#endif
#include "stack_guard.h"
#include "agec.h"
#if !defined(PENDANT_FACTORY_COMMON_FIRMWARE) && !defined(PENDANT_AGE_RECIPIENT)
#error Supply a provisioned public age recipient through the configuration header
#endif
static recorder_app app;
static battery_monitor battery;
static battery_indicator indicator;
#ifndef PENDANT_FACTORY_COMMON_FIRMWARE
static char recipient_text[]=PENDANT_AGE_RECIPIENT;
#endif
static uint8_t recipient[32];
static void halted(void){
 /* Never blink forever from the 110mAh cell.  A terminal fault may sacrifice
  * only the incomplete storage tail; SD and USB are quiesced before Standby.
  * With VBUS present the externally powered fault indication remains visible. */
 while(!board_terminal_fault_quiesce_until_vbus()){}
 uint32_t started=HAL_GetTick();
 for(;;){
  if(!board_usb_vbus_present()){
   board_battery_led(false);
   while(!board_terminal_fault_quiesce_until_vbus()){}
   started=HAL_GetTick();
  }
  board_battery_led(terminal_indicator_on(HAL_GetTick()-started,app.files.capacity_exhausted));
  __WFI();
 }
}
#ifdef PENDANT_BATTERY_STOP_MV
static void low_battery_export(const storage_owner *stopped){
 /* Cold boot or successfully stopped recording: no active storage/audio IO.
  * Stay charge-inhibited; VBUS is a presence indication, not power validation. */
 if(!board_low_battery_standby_until_vbus())halted();
 if(!(stopped?export_runtime_start_after_stop(&export_app,stopped):
              export_runtime_start(&export_app)))halted();
 for(;;){
  if(!export_runtime_poll(&export_app))halted();
  __WFI();
 }
 /* No recording restart on unplug/eject or battery rebound. */
}
#endif
int main(void){
 HAL_Init();board_charge_inhibit_init();board_usb_input_v15_init();board_battery_io_init();
 /* The candidate power analysis requires BOR4. Read only: option bytes must
  * be provisioned and reloaded by the manufacturing procedure, never silently
  * changed here. Refuse storage, audio and USB startup on a mismatched board.
  * This does not establish the dynamic brownout response or rail margins. */
 if((FLASH->OPTR & FLASH_OPTR_BOR_LEV) != OB_BOR_LEVEL_4)halted();
 if(!board_stack_guard_enable())halted();
 battery_monitor_init(&battery,HAL_GetTick());
 if(!board_system_clock_startup())halted();
 if(!board_instruction_cache_startup())halted();
#ifdef PENDANT_BATTERY_STOP_MV
 /* Bench preflight: divider RC=5ms; allow100ms before ADC acquisition.
  *100mV restart margin is provisional, not a qualified voltage budget.
  * No SD init, mount/recovery or audio DMA before this check passes. */
 HAL_Delay(100);
 uint16_t startup_mv=0;
 if(!board_battery_measure_mv(&startup_mv) || startup_mv>4500U)halted();
 if(startup_mv<=PENDANT_BATTERY_STOP_MV+100U)low_battery_export(NULL);
#endif
#ifdef PENDANT_FACTORY_COMMON_FIRMWARE
 if(!board_recipient_flash_load(NULL,recipient)){
  if(!board_recipient_provisioning_run())halted();
  halted();
 }
#else
 if(!x25519pubkey(recipient_text,recipient))halted();
#endif
 /* SELECT=GND; sampling edge remains a microphone bench qualification item. */
 if(!recorder_boot_start(&app,recipient,MDF_BITSTREAM0_RISING))halted();
 for(;;){
  if(!recorder_runtime_poll(&app.runtime))halted();
  bool quiet=app.owner.state==OWN_DEVICE &&
   atomic_load_explicit(&app.queue.produced,memory_order_acquire)==
   atomic_load_explicit(&app.queue.consumed,memory_order_relaxed);
  battery_monitor_poll(&battery,HAL_GetTick(),quiet,board_battery_measure_mv);
  uint16_t mv=0;uint32_t now=HAL_GetTick();
  bool valid=battery_monitor_read(&battery,now,&mv);
#ifdef PENDANT_BATTERY_STOP_MV
  bool device_owned=app.owner.state==OWN_DEVICE;
  if(!battery_monitor_healthy(&battery,now,device_owned)){
   /* ADC/cadence failure removes the firmware over-discharge barrier.  Try to
    * commit and unmount, but terminal quiescence remains mandatory on failure. */
   if(device_owned)(void)recorder_runtime_stop(&app.runtime);
   halted();
  }
  if(battery_stop_poll(&voltage_stop,now,device_owned,valid,mv,
                       PENDANT_BATTERY_STOP_MV,3000U) && device_owned){
   if(!recorder_runtime_stop(&app.runtime))halted();
   low_battery_export(&app.owner);
  }
#endif
#if PENDANT_AUTOMATIC_BATTERY_INDICATOR_MS
  board_battery_led(battery_indicator_periodic_poll(&indicator,now,
    PENDANT_AUTOMATIC_BATTERY_INDICATOR_MS,valid,mv));
#else
  board_battery_led(battery_indicator_poll(&indicator,now,board_battery_button_pressed(),valid,mv));
#endif
  /* Sleep only, not Stop2: clocks/retention qualification is still pending.
   * SysTick/USB/DMA wake this loop. Never sleep with IRQs masked. */
  __WFI();
 }
}
void SysTick_Handler(void){HAL_IncTick();board_battery_led_tick_1ms();}
void _init(void){}
