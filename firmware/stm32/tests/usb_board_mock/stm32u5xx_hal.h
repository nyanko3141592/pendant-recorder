#include <stdint.h>
#include <stddef.h>
typedef enum {HAL_OK,HAL_ERROR} HAL_StatusTypeDef;
typedef struct {unsigned OscillatorType,HSI48State;} RCC_OscInitTypeDef;
typedef struct {unsigned PeriphClockSelection,IclkClockSelection;} RCC_PeriphCLKInitTypeDef;
typedef struct {unsigned Prescaler,Source,Polarity,ReloadValue,ErrorLimitValue,HSI48CalibrationValue;} RCC_CRSInitTypeDef;
typedef struct {unsigned Pin,Mode,Pull,Speed,Alternate;} GPIO_InitTypeDef;
unsigned __get_IPSR(void);unsigned __get_PRIMASK(void);
HAL_StatusTypeDef HAL_RCC_OscConfig(RCC_OscInitTypeDef *);
HAL_StatusTypeDef HAL_RCCEx_PeriphCLKConfig(RCC_PeriphCLKInitTypeDef *);
void HAL_RCCEx_CRSConfig(RCC_CRSInitTypeDef *);
void HAL_NVIC_DisableIRQ(unsigned);void HAL_NVIC_ClearPendingIRQ(unsigned);
void HAL_NVIC_SetPriority(unsigned,unsigned,unsigned);
void HAL_GPIO_Init(unsigned,GPIO_InitTypeDef *);
unsigned HAL_GPIO_ReadPin(unsigned,unsigned);
void HAL_PWREx_EnableVddUSB(void);void HAL_PWREx_DisableVddUSB(void);
uint32_t HAL_GetUIDw0(void);uint32_t HAL_GetUIDw1(void);uint32_t HAL_GetUIDw2(void);
void event(unsigned);
#define RCC_OSCILLATORTYPE_HSI48 1
#define RCC_HSI48_ON 1
#define RCC_HSI48_OFF 0
#define GPIOA 1
#define USB_IRQn 2
#define GPIO_PIN_0 1
#define GPIO_PIN_11 2048
#define GPIO_PIN_12 4096
#define GPIO_PIN_RESET 0
#define GPIO_MODE_INPUT 1
#define GPIO_MODE_AF_PP 2
#define GPIO_MODE_ANALOG 3
#define GPIO_NOPULL 0
#define GPIO_SPEED_FREQ_HIGH 3
#define GPIO_AF10_USB 10
#define RCC_PERIPHCLK_CLK48 1
#define RCC_CLK48CLKSOURCE_HSI48 1
#define RCC_CRS_SYNC_DIV1 0
#define RCC_CRS_SYNC_SOURCE_USB 1
#define RCC_CRS_SYNC_POLARITY_RISING 0
#define RCC_CRS_ERRORLIMIT_DEFAULT 34
#define RCC_CRS_HSI48CALIBRATION_DEFAULT 32
#define __HAL_RCC_GPIOA_CLK_ENABLE() event(1)
#define __HAL_RCC_CRS_CLK_ENABLE() event(2)
#define __HAL_RCC_PWR_CLK_ENABLE() event(3)
#define __HAL_RCC_USB_FS_CLK_ENABLE() event(4)
#define __HAL_RCC_USB_FS_FORCE_RESET() event(5)
#define __HAL_RCC_USB_FS_RELEASE_RESET() event(6)
#define __HAL_RCC_USB_FS_CLK_DISABLE() event(7)
#define __HAL_RCC_CRS_AUTOMATIC_CALIB_DISABLE() event(8)
#define __HAL_RCC_CRS_FREQ_ERROR_COUNTER_DISABLE() event(9)
#define __HAL_RCC_CRS_CLK_DISABLE() event(10)
