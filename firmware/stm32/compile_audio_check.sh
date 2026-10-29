#!/bin/sh
set -eu
# Compile check only. No linked image or runnable acquisition driver is produced.
SDK_ROOT=${PENDANT_STM32_SDK:-/tmp/pendant-stm32-sdk}
PROJECT_ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)
arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -mfloat-abi=soft -DSTM32U585xx -DUSE_HAL_DRIVER -std=c11 -Wall -Wextra -Werror -I "$PROJECT_ROOT/firmware/stm32/board" -I "$SDK_ROOT/hal/Inc" -I "$SDK_ROOT/device/Include" -I "$SDK_ROOT/cmsis/CMSIS/Core/Include" -c "$PROJECT_ROOT/firmware/stm32/board/audio_adf.c" -o /tmp/pendant-audio-adf.o

arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -mfloat-abi=soft -DSTM32U585xx -DUSE_HAL_DRIVER -std=c11 -Wall -Wextra -Werror -I "$PROJECT_ROOT/firmware/stm32/board" -I "$SDK_ROOT/hal/Inc" -I "$SDK_ROOT/device/Include" -I "$SDK_ROOT/cmsis/CMSIS/Core/Include" -c "$PROJECT_ROOT/firmware/stm32/board/audio_dma.c" -o /tmp/pendant-audio-dma.o

arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -mfloat-abi=soft -DSTM32U585xx -DUSE_HAL_DRIVER -std=c11 -Wall -Wextra -Werror -I "$PROJECT_ROOT/firmware/stm32/board" -I "$SDK_ROOT/hal/Inc" -I "$SDK_ROOT/device/Include" -I "$SDK_ROOT/cmsis/CMSIS/Core/Include" -c "$PROJECT_ROOT/firmware/stm32/board/audio_callbacks.c" -o /tmp/pendant-audio-callbacks.o
arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -mfloat-abi=soft -DSTM32U585xx -DUSE_HAL_DRIVER -std=c11 -Wall -Wextra -Werror -I "$PROJECT_ROOT/firmware/stm32/board" -I "$SDK_ROOT/hal/Inc" -I "$SDK_ROOT/device/Include" -I "$SDK_ROOT/cmsis/CMSIS/Core/Include" -c "$PROJECT_ROOT/firmware/stm32/core/audio_queue.c" -o /tmp/pendant-audio-queue.o

arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -mfloat-abi=soft -DSTM32U585xx -DUSE_HAL_DRIVER -std=c11 -Wall -Wextra -Werror -I "$PROJECT_ROOT/firmware/stm32/board" -I "$SDK_ROOT/hal/Inc" -I "$SDK_ROOT/device/Include" -I "$SDK_ROOT/cmsis/CMSIS/Core/Include" -c "$PROJECT_ROOT/firmware/stm32/core/ima_adpcm.c" -o /tmp/pendant-ima-adpcm.o

arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -mfloat-abi=soft -DSTM32U585xx -DUSE_HAL_DRIVER -std=c11 -Wall -Wextra -Werror -I "$PROJECT_ROOT/firmware/stm32/board" -I "$SDK_ROOT/hal/Inc" -I "$SDK_ROOT/device/Include" -I "$SDK_ROOT/cmsis/CMSIS/Core/Include" -c "$PROJECT_ROOT/firmware/stm32/core/wav_chunk.c" -o /tmp/pendant-wav-chunk.o

arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -mfloat-abi=soft -DSTM32U585xx -DUSE_HAL_DRIVER -std=c11 -Wall -Wextra -Werror -I "$PROJECT_ROOT/firmware/stm32/board" -I "$SDK_ROOT/hal/Inc" -I "$SDK_ROOT/device/Include" -I "$SDK_ROOT/cmsis/CMSIS/Core/Include" -c "$PROJECT_ROOT/firmware/stm32/core/recording_pipeline.c" -o /tmp/pendant-recording-pipeline.o

arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -mfloat-abi=soft -DSTM32U585xx -DUSE_HAL_DRIVER -std=c11 -Wall -Wextra -Werror -I "$PROJECT_ROOT/firmware/stm32/board" -I "$SDK_ROOT/hal/Inc" -I "$SDK_ROOT/device/Include" -I "$SDK_ROOT/cmsis/CMSIS/Core/Include" -c "$PROJECT_ROOT/firmware/stm32/board/charge_inhibit.c" -o /tmp/pendant-charge-inhibit.o

# Candidate input-control driver only; not yet linked into the application.
arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -mfloat-abi=soft -DSTM32U585xx -DUSE_HAL_DRIVER -std=c11 -Wall -Wextra -Werror -I "$PROJECT_ROOT/firmware/stm32/board" -I "$SDK_ROOT/hal/Inc" -I "$SDK_ROOT/device/Include" -I "$SDK_ROOT/cmsis/CMSIS/Core/Include" -c "$PROJECT_ROOT/firmware/stm32/board/usb_input_v15.c" -o /tmp/pendant-usb-input-v15.o
