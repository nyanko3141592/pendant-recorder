/* Compile the real application entry with hardware/lifecycle test doubles. */
#include <stdint.h>
#include <stdbool.h>
#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
static unsigned scenario,sleeps,measures,boots,stops,cold_exports,warm_exports,export_polls,keys,standbys,terminal_faults;
static uint32_t tick;
static bool vbus;
static unsigned input_inits,input_revokes,button_reads,led_on;
static unsigned capacity_pattern_observed;
static jmp_buf done;
typedef struct { uint32_t OPTR; } test_flash_registers;
static test_flash_registers test_flash = { .OPTR = 0x400u };
#define FLASH (&test_flash)
#define FLASH_OPTR_BOR_LEV 0x700u
#define OB_BOR_LEVEL_4 0x400u
void test_wfi(void);
void HAL_Init(void);
void HAL_Delay(uint32_t ms);
uint32_t HAL_GetTick(void);
void HAL_IncTick(void);
#define __WFI test_wfi
#define MDF_BITSTREAM0_RISING 0
#define main pendant_application_main
#define _init pendant_application_init
#include "../app/main.c"
#undef main
#undef _init
void HAL_Init(void){}
void HAL_Delay(uint32_t ms){tick+=ms;}
uint32_t HAL_GetTick(void){return tick;}
void HAL_IncTick(void){tick++;}
void test_wfi(void){
 tick+=1000;
 if(++sleeps==2)vbus=true;
 if(sleeps==8)longjmp(done,1);
}
void board_charge_inhibit_init(void){}
void board_usb_input_v15_init(void){assert(!input_inits++&&!boots&&!cold_exports&&!warm_exports);}
void board_usb_input_v15_revoke(void){assert(input_inits==1);input_revokes++;}
void board_battery_io_init(void){assert(input_inits==1);}
void board_battery_led(bool on){
 if(on)led_on++;
 if(scenario==6&&app.files.capacity_exhausted&&on)capacity_pattern_observed++;
}
void board_battery_led_tick_1ms(void){}
bool board_battery_button_pressed(void){button_reads++;return false;}
bool board_stack_guard_enable(void){return true;}
bool board_system_clock_startup(void){return true;}
bool board_instruction_cache_startup(void){return true;}
bool board_battery_measure_mv(uint16_t *mv){
 measures++;
 if(scenario==2||(scenario==7&&measures>1))return false;
 *mv=scenario==5?3900:scenario==3?4600:(scenario==0?3600:(measures==1?3900:3500));
 return true;
}
void board_usb_vbus_init(void){}
bool board_usb_vbus_present(void){return vbus;}
bool board_low_battery_standby_until_vbus(void){
 board_usb_input_v15_revoke();standbys++;
 if(!vbus)vbus=true; /* model PA0/WKUP1 reset with VBUS present */
 return true;
}
bool board_terminal_fault_quiesce_until_vbus(void){
 terminal_faults++;
 return board_low_battery_standby_until_vbus();
}
int x25519pubkey(char *text,unsigned char key[32]){assert(text);keys++;memset(key,1,32);return 1;}
bool recorder_boot_start(recorder_app *a,const uint8_t key[32],uint32_t edge){
 assert(key[0]&&edge==MDF_BITSTREAM0_RISING);boots++;owner_init(&a->owner,true);return true;
}
bool recorder_runtime_poll(recorder_runtime *r){
 assert(r==&app.runtime&&!stops);
 if(scenario==6){app.files.capacity_exhausted=true;return false;}
 return true;
}
bool recorder_runtime_stop(recorder_runtime *r){
 assert(r==&app.runtime);stops++;
 if(scenario==4)return false;
 owner_step(&app.owner,STOP_RECORDING);owner_step(&app.owner,DEVICE_RELEASED);return true;
}
bool export_runtime_start(export_runtime *r){
 assert(r==&export_app&&vbus&&!boots&&!keys);cold_exports++;r->initialized=true;return true;
}
bool export_runtime_start_after_stop(export_runtime *r,const storage_owner *old){
 assert(r==&export_app&&vbus&&old==&app.owner&&old->state==OWN_STOPPED&&stops==1);
 warm_exports++;r->initialized=true;return true;
}
bool export_runtime_poll(export_runtime *r){assert(r->initialized);export_polls++;r->stopped=true;return true;}
int main(int argc,char **argv){
 assert(argc==2);scenario=(unsigned)atoi(argv[1]);
 if(!setjmp(done))pendant_application_main();
 assert(input_inits==1);
#if PENDANT_AUTOMATIC_BATTERY_INDICATOR_MS
 assert(button_reads==0);
 if(scenario==5)assert(led_on>0);
#else
 if(scenario==5)assert(led_on==0);
 if(scenario==5)assert(button_reads>0);
#endif
 assert(input_revokes==((scenario==0||scenario==1||scenario==2||scenario==3||scenario==4||scenario==6||scenario==7)?1u:0u));
 if(scenario==0||scenario==1)assert(standbys==1&&!terminal_faults);
 else if(scenario==2||scenario==3||scenario==4||scenario==6||scenario==7){
  assert(standbys==1);assert(terminal_faults==1);
 }
 else assert(!standbys&&!terminal_faults);
 if(scenario==0)assert(cold_exports==1&&warm_exports==0&&boots==0&&keys==0&&export_polls>1);
 if(scenario==1)assert(boots==1&&keys==1&&stops==1&&warm_exports==1&&cold_exports==0&&export_polls>1);
 if(scenario==2||scenario==3)assert(!boots&&!keys&&!cold_exports&&!warm_exports&&!stops);
 if(scenario==6)assert(boots==1&&!stops&&capacity_pattern_observed>0);
 if(scenario==5)assert(boots==1&&!stops&&!cold_exports&&!warm_exports);
 if(scenario==4)assert(boots==1&&stops==1&&!cold_exports&&!warm_exports);
 if(scenario==7)assert(boots==1&&keys==1&&stops==1&&!cold_exports&&!warm_exports);
 return 0;
}
