#ifndef STORAGE_TEST_HAL_H
#define STORAGE_TEST_HAL_H
#include <stdint.h>
typedef enum { HAL_OK,HAL_ERROR } HAL_StatusTypeDef;
uint32_t HAL_GetTick(void);
#endif
