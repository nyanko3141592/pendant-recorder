#include "storage_spi.h"
static SPI_HandleTypeDef bus;
static bool ready,selected;
HAL_StatusTypeDef storage_spi_init_low_speed(void){
 if(ready)return HAL_BUSY;
 RCC_PeriphCLKInitTypeDef clock={0};clock.PeriphClockSelection=RCC_PERIPHCLK_SPI1;
 clock.Spi1ClockSelection=RCC_SPI1CLKSOURCE_PCLK2;
 if(HAL_RCCEx_PeriphCLKConfig(&clock)!=HAL_OK)return HAL_ERROR;
 __HAL_RCC_GPIOA_CLK_ENABLE();__HAL_RCC_SPI1_CLK_ENABLE();
 /* All SPI transfers are synchronous in main context; WFI is reached only
  * after they return. Stop the unused SPI bus clock during ordinary Sleep.
  * Revisit before adding DMA/interrupt transfers or sleeping inside an exchange.
  * This does not power off the card or stop its internal programming. */
 __HAL_RCC_SPI1_CLK_SLEEP_DISABLE();
 /* Rail must already be stable; external47k CS pullup holds deselected before this. */
 HAL_GPIO_WritePin(GPIOA,GPIO_PIN_4,GPIO_PIN_SET);
 GPIO_InitTypeDef gpio={0};gpio.Pin=GPIO_PIN_4;gpio.Mode=GPIO_MODE_OUTPUT_PP;
 gpio.Pull=GPIO_NOPULL;gpio.Speed=GPIO_SPEED_FREQ_LOW;HAL_GPIO_Init(GPIOA,&gpio);
 gpio.Pin=GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7;gpio.Mode=GPIO_MODE_AF_PP;
 gpio.Alternate=GPIO_AF5_SPI1;HAL_GPIO_Init(GPIOA,&gpio);
 bus.Instance=SPI1;bus.Init.Mode=SPI_MODE_MASTER;bus.Init.Direction=SPI_DIRECTION_2LINES;
 bus.Init.DataSize=SPI_DATASIZE_8BIT;bus.Init.CLKPolarity=SPI_POLARITY_LOW;
 bus.Init.CLKPhase=SPI_PHASE_1EDGE;bus.Init.NSS=SPI_NSS_SOFT;
 bus.Init.BaudRatePrescaler=SPI_BAUDRATEPRESCALER_256; /* PCLK2 16MHz/256=62.5kHz */
 bus.Init.FirstBit=SPI_FIRSTBIT_MSB;bus.Init.TIMode=SPI_TIMODE_DISABLE;
 bus.Init.CRCCalculation=SPI_CRCCALCULATION_DISABLE;bus.Init.CRCPolynomial=7;
 bus.Init.NSSPMode=SPI_NSS_PULSE_DISABLE;bus.Init.NSSPolarity=SPI_NSS_POLARITY_LOW;
 bus.Init.FifoThreshold=SPI_FIFO_THRESHOLD_01DATA;
 bus.Init.MasterKeepIOState=SPI_MASTER_KEEP_IO_STATE_ENABLE;
 HAL_StatusTypeDef result=HAL_SPI_Init(&bus);ready=result==HAL_OK;return result;
}
HAL_StatusTypeDef storage_spi_set_transfer_speed(void){
 if(!ready||selected||bus.State!=HAL_SPI_STATE_READY)return HAL_BUSY;
 bus.Init.BaudRatePrescaler=PENDANT_STORAGE_SPI_PRESCALER;
 HAL_StatusTypeDef result=HAL_SPI_Init(&bus);
 if(result!=HAL_OK){ready=false;return result;}
 GPIO_InitTypeDef gpio={0};gpio.Pin=GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7;
 gpio.Mode=GPIO_MODE_AF_PP;gpio.Pull=GPIO_NOPULL;
 gpio.Speed=GPIO_SPEED_FREQ_MEDIUM;gpio.Alternate=GPIO_AF5_SPI1;
 HAL_GPIO_Init(GPIOA,&gpio);return HAL_OK;
}
HAL_StatusTypeDef storage_spi_exchange(uint8_t *tx,uint8_t *rx,uint16_t n,uint32_t timeout){
 if(!ready||!tx||!rx||!n||timeout==HAL_MAX_DELAY)return HAL_ERROR;
 return HAL_SPI_TransmitReceive(&bus,tx,rx,n,timeout);
}
void storage_spi_select(bool on){
 if(ready){HAL_GPIO_WritePin(GPIOA,GPIO_PIN_4,on?GPIO_PIN_RESET:GPIO_PIN_SET);selected=on;}
}
HAL_StatusTypeDef storage_spi_release_pins(void){
 if(bus.State!=HAL_SPI_STATE_RESET && bus.State!=HAL_SPI_STATE_READY)return HAL_BUSY;
 if(bus.State==HAL_SPI_STATE_READY && HAL_SPI_DeInit(&bus)!=HAL_OK)return HAL_ERROR;
 __HAL_RCC_GPIOA_CLK_ENABLE();
 GPIO_InitTypeDef gpio={0};gpio.Pin=GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7;
 gpio.Mode=GPIO_MODE_ANALOG;gpio.Pull=GPIO_NOPULL;HAL_GPIO_Init(GPIOA,&gpio);
 __HAL_RCC_SPI1_CLK_DISABLE();ready=false;selected=false;return HAL_OK;
}
