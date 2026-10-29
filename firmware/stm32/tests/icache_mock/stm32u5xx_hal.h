#ifndef ICACHE_TEST_HAL_H
#define ICACHE_TEST_HAL_H
#include <stdint.h>
typedef enum {HAL_OK,HAL_ERROR} HAL_StatusTypeDef;
#define ICACHE_1WAY 0U
unsigned __get_IPSR(void);
unsigned __get_PRIMASK(void);
uint32_t HAL_ICACHE_IsEnabled(void);
HAL_StatusTypeDef HAL_ICACHE_ConfigAssociativityMode(uint32_t mode);
HAL_StatusTypeDef HAL_ICACHE_Enable(void);
#endif
