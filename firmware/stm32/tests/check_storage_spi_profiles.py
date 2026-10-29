"""Compile real STM32 HAL adapter and verify profile mappings; no hardware test."""
from pathlib import Path
import subprocess,tempfile,os
root=Path(__file__).resolve().parents[1]
sdk=Path(os.environ.get('PENDANT_STM32_SDK','/tmp/pendant-stm32-sdk'))
flags=['arm-none-eabi-gcc','-mcpu=cortex-m33','-mthumb','-mfloat-abi=soft','-DSTM32U585xx','-DUSE_HAL_DRIVER','-std=gnu11','-Werror']
for p in [root/'board',sdk/'hal/Inc',sdk/'device/Include',sdk/'cmsis/CMSIS/Core/Include']:flags+=['-I',str(p)]
with tempfile.TemporaryDirectory(prefix='pendant-spi-profiles-') as tmp:
 tmp=Path(tmp)
 for profile,prescaler in [(None,4),(4,4),(8,2)]:
  extra=[] if profile is None else [f'-DPENDANT_STORAGE_SPI_TRANSFER_MHZ={profile}']
  check=tmp/'mapping.c';check.write_text(f'#include "storage_spi.h"\n_Static_assert(PENDANT_STORAGE_SPI_PRESCALER == SPI_BAUDRATEPRESCALER_{prescaler}, "wrong SPI divider");\n')
  for source in [check,root/'board/storage_spi.c']:
   subprocess.run(flags+extra+['-c',str(source),'-o',str(tmp/'check.o')],check=True)
 for invalid in [0,2,16]:
  result=subprocess.run(flags+[f'-DPENDANT_STORAGE_SPI_TRANSFER_MHZ={invalid}','-c',str(check),'-o',str(tmp/'bad.o')],capture_output=True,text=True)
  assert result.returncode and 'Storage SPI transfer profile must be 4 or 8 MHz' in result.stderr
print('PASS actual HAL adapter default4/explicit4/bench8; invalid0/2/16 rejected')
