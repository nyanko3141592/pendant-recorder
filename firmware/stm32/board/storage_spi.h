#ifndef PENDANT_STORAGE_SPI_H
#define PENDANT_STORAGE_SPI_H
#include "stm32u5xx_hal.h"
#include <stdbool.h>
/* 8MHz is a bench-only comparison profile; board/card timing unqualified. */
#ifndef PENDANT_STORAGE_SPI_TRANSFER_MHZ
#define PENDANT_STORAGE_SPI_TRANSFER_MHZ 4
#endif
#if PENDANT_STORAGE_SPI_TRANSFER_MHZ == 4
#define PENDANT_STORAGE_SPI_PRESCALER SPI_BAUDRATEPRESCALER_4
#elif PENDANT_STORAGE_SPI_TRANSFER_MHZ == 8
#define PENDANT_STORAGE_SPI_PRESCALER SPI_BAUDRATEPRESCALER_2
#else
#error Storage SPI transfer profile must be 4 or 8 MHz
#endif
/* Main-task, blocking bus primitive, no SD protocol or filesystem yet.
 * Caller must own the medium, establish SD_V3 and allow qualified ramp delay.
 * Requires the qualified 16MHz PCLK2 and a running HAL tick. Does not enable SD power. */
HAL_StatusTypeDef storage_spi_init_low_speed(void);
/* After successful SD initialization only, CS high, no transfer in flight.
 * Default PCLK2/4=4MHz. Optional 8MHz bench profile requires separate
 * signal-integrity/card qualification. Initialization stays at62.5kHz. */
HAL_StatusTypeDef storage_spi_set_transfer_speed(void);
HAL_StatusTypeDef storage_spi_exchange(uint8_t *tx,uint8_t *rx,uint16_t bytes,uint32_t timeout_ms);
void storage_spi_select(bool selected);
/* Only after SD idle/flush and all IO stopped. Float signal pins BEFORE caller
 * switches SD_EN low. Do not use during host ownership or outstanding writes. */
HAL_StatusTypeDef storage_spi_release_pins(void);
#endif
