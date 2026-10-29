#include "usb_board.h"
#include "clock48.h"
#include "usb_input_v15.h"
#include "device/dcd.h"
#include "stm32u5xx_hal.h"
#include "../usb/usb_descriptors.h"
#include "tusb.h"
#if defined(STM32U585xx)
#define PENDANT_USB_IRQn OTG_FS_IRQn
#define PENDANT_USB_CLK_ENABLE() __HAL_RCC_USB_OTG_FS_CLK_ENABLE()
#define PENDANT_USB_CLK_DISABLE() __HAL_RCC_USB_OTG_FS_CLK_DISABLE()
#define PENDANT_USB_FORCE_RESET() __HAL_RCC_USB_OTG_FS_FORCE_RESET()
#define PENDANT_USB_RELEASE_RESET() __HAL_RCC_USB_OTG_FS_RELEASE_RESET()
#else
#define PENDANT_USB_IRQn USB_IRQn
#define PENDANT_USB_CLK_ENABLE() __HAL_RCC_USB_FS_CLK_ENABLE()
#define PENDANT_USB_CLK_DISABLE() __HAL_RCC_USB_FS_CLK_DISABLE()
#define PENDANT_USB_FORCE_RESET() __HAL_RCC_USB_FS_FORCE_RESET()
#define PENDANT_USB_RELEASE_RESET() __HAL_RCC_USB_FS_RELEASE_RESET()
#endif
static bool usb_resources,crs_owned,clock_owned;
void board_usb_vbus_init(void){
 __HAL_RCC_GPIOA_CLK_ENABLE();
 GPIO_InitTypeDef pin={0};pin.Pin=GPIO_PIN_0;pin.Mode=GPIO_MODE_INPUT;pin.Pull=GPIO_NOPULL;
 HAL_GPIO_Init(GPIOA,&pin);
}
bool board_usb_vbus_present(void){return HAL_GPIO_ReadPin(GPIOA,GPIO_PIN_0)==GPIO_PIN_RESET;}
bool board_usb_prepare(void){
 if(__get_IPSR()||__get_PRIMASK()||tud_inited()||usb_resources||crs_owned||clock_owned||!board_usb_vbus_present())return false;
 HAL_NVIC_DisableIRQ(PENDANT_USB_IRQn);
 if(!board_clock48_acquire(CLOCK48_USB))return false;
 clock_owned=true;
 RCC_PeriphCLKInitTypeDef clocks={0};clocks.PeriphClockSelection=RCC_PERIPHCLK_CLK48;
 clocks.IclkClockSelection=RCC_CLK48CLKSOURCE_HSI48;
 if(HAL_RCCEx_PeriphCLKConfig(&clocks)!=HAL_OK){(void)board_usb_stop();return false;}
 __HAL_RCC_CRS_CLK_ENABLE();crs_owned=true;
 RCC_CRSInitTypeDef crs={0};crs.Prescaler=RCC_CRS_SYNC_DIV1;
 crs.Source=RCC_CRS_SYNC_SOURCE_USB;crs.Polarity=RCC_CRS_SYNC_POLARITY_RISING;
 crs.ReloadValue=47999;crs.ErrorLimitValue=RCC_CRS_ERRORLIMIT_DEFAULT;
 crs.HSI48CalibrationValue=RCC_CRS_HSI48CALIBRATION_DEFAULT;
 HAL_RCCEx_CRSConfig(&crs);
 __HAL_RCC_PWR_CLK_ENABLE();HAL_PWREx_EnableVddUSB();
 __HAL_RCC_GPIOA_CLK_ENABLE();
 GPIO_InitTypeDef pins={0};pins.Pin=GPIO_PIN_11|GPIO_PIN_12;
 pins.Mode=GPIO_MODE_AF_PP;pins.Pull=GPIO_NOPULL;pins.Speed=GPIO_SPEED_FREQ_HIGH;
 pins.Alternate=GPIO_AF10_USB;HAL_GPIO_Init(GPIOA,&pins);
 PENDANT_USB_CLK_ENABLE();usb_resources=true;
 PENDANT_USB_FORCE_RESET();PENDANT_USB_RELEASE_RESET();
 uint32_t uid[3]={HAL_GetUIDw0(),HAL_GetUIDw1(),HAL_GetUIDw2()};usb_descriptors_set_uid(uid);
 HAL_NVIC_ClearPendingIRQ(PENDANT_USB_IRQn);HAL_NVIC_SetPriority(PENDANT_USB_IRQn,5,0);
 /* TinyUSB init enables peripheral IRQ; caller starts it only after state
  * bindings are ready. PA10 is not an OTG ID pin in this device-only design. */
 if(!board_usb_vbus_present()){(void)board_usb_stop();return false;}
 return true;
}
bool board_usb_stop(void){
 if(__get_IPSR()||__get_PRIMASK())return false;
 /* Call only after usb_session_service/tud_task has returned. OS_NONE means
  * no USB callback is in flight here; block backend is synchronous. */
 HAL_NVIC_DisableIRQ(PENDANT_USB_IRQn);
 if(tud_inited()&&!tud_deinit(0))return false;
 if(tud_inited())return false;
 HAL_NVIC_ClearPendingIRQ(PENDANT_USB_IRQn);
 if(usb_resources){
  PENDANT_USB_FORCE_RESET();PENDANT_USB_RELEASE_RESET();
  PENDANT_USB_CLK_DISABLE();
  GPIO_InitTypeDef pins={0};pins.Pin=GPIO_PIN_11|GPIO_PIN_12;
  pins.Mode=GPIO_MODE_ANALOG;pins.Pull=GPIO_NOPULL;HAL_GPIO_Init(GPIOA,&pins);
  HAL_PWREx_DisableVddUSB();usb_resources=false;
 }
 if(crs_owned){
  __HAL_RCC_CRS_AUTOMATIC_CALIB_DISABLE();__HAL_RCC_CRS_FREQ_ERROR_COUNTER_DISABLE();
  __HAL_RCC_CRS_CLK_DISABLE();crs_owned=false;
 }
 usb_descriptors_set_uid(NULL);
 if(clock_owned){
  if(!board_clock48_release(CLOCK48_USB))return false;
  clock_owned=false;
 }
 return true;
}
#if defined(STM32U585xx)
void OTG_FS_IRQHandler(void){tusb_int_handler(0,true);}
#else
void USB_IRQHandler(void){tusb_int_handler(0,true);}
#endif

/* Called while TinyUSB queues an event, before the deferred task callback.
 * Only GPIO revocation is permitted here: this hook can run in interrupt context.
 * The local TinyUSB patch invokes this before enqueue, including queue overflow. */
void tud_event_hook_cb(uint8_t rhport,uint32_t eventid,bool in_isr){
 (void)in_isr;
 if(rhport!=0)return;
 if(eventid==DCD_EVENT_BUS_RESET||eventid==DCD_EVENT_UNPLUGGED||eventid==DCD_EVENT_SUSPEND||eventid==DCD_EVENT_SETUP_RECEIVED)
  board_usb_input_v15_revoke_from_isr();
}

void tud_event_queue_overflow_cb(uint8_t rhport,bool in_isr){
 (void)in_isr;
 if(rhport==0)board_usb_input_v15_revoke_from_isr();
}
