#include "storage_power.h"
#include "storage_power_pins.h"
#include "storage_spi.h"
static bool attempted,clean_off,terminal_off;
static bool power_up(void){
 clean_off=false;
 /* Do this before any output latch change to avoid phantom SD powering. */
 if(storage_spi_release_pins()!=HAL_OK)return false;
 __HAL_RCC_GPIOB_CLK_ENABLE();
 HAL_GPIO_WritePin(STORAGE_ENABLE_PORT,STORAGE_ENABLE_PIN,GPIO_PIN_RESET);
 GPIO_InitTypeDef pin={0};pin.Pin=STORAGE_ENABLE_PIN;pin.Mode=GPIO_MODE_OUTPUT_PP;
 pin.Pull=GPIO_PULLDOWN;pin.Speed=GPIO_SPEED_FREQ_LOW;HAL_GPIO_Init(STORAGE_ENABLE_PORT,&pin);
 /* TPS22917DBVT with CT open, QOD tied to SD_V3, C26=100nF and C27=4.7uF.
  * Final effective load capacitance is unqualified: this is a conservative
  * commissioning wait, not a measured rail decision. Actual <0.5V for >=1ms
  * and monotonic 0.1..35ms ramp must be scoped on the final assembly. */
 HAL_Delay(50);
 HAL_GPIO_WritePin(STORAGE_ENABLE_PORT,STORAGE_ENABLE_PIN,GPIO_PIN_SET);
 HAL_Delay(40);
 return true;
}

bool board_storage_power_startup(void){
 if(attempted||terminal_off||__get_IPSR()||__get_PRIMASK())return false;
 attempted=true;return power_up();
}
bool board_storage_power_restart_for_export(void){
 if(!attempted||!clean_off||terminal_off||__get_IPSR()||__get_PRIMASK())return false;
 return power_up();
}
bool board_storage_power_shutdown(void){
 if(!attempted||terminal_off||__get_IPSR()||__get_PRIMASK())return false;
 clean_off=false;
 if(storage_spi_release_pins()!=HAL_OK)return false;
 __HAL_RCC_GPIOB_CLK_ENABLE();
 HAL_GPIO_WritePin(STORAGE_ENABLE_PORT,STORAGE_ENABLE_PIN,GPIO_PIN_RESET);
 clean_off=true;return true;
}
bool board_storage_power_emergency_off(void){
 if(__get_IPSR()||__get_PRIMASK())return false;
 terminal_off=true;clean_off=false;
 /* A release failure must not leave the load switch enabled forever.  Standby
  * resets the MCU immediately after this path, so no bus access may follow. */
 (void)storage_spi_release_pins();
 __HAL_RCC_GPIOB_CLK_ENABLE();
 HAL_GPIO_WritePin(STORAGE_ENABLE_PORT,STORAGE_ENABLE_PIN,GPIO_PIN_RESET);
 GPIO_InitTypeDef pin={0};pin.Pin=STORAGE_ENABLE_PIN;pin.Mode=GPIO_MODE_OUTPUT_PP;
 pin.Pull=GPIO_PULLDOWN;pin.Speed=GPIO_SPEED_FREQ_LOW;
 HAL_GPIO_Init(STORAGE_ENABLE_PORT,&pin);
 return true;
}
