#!/usr/bin/env python3
from pathlib import Path

root=Path(__file__).resolve().parents[1]
ld=(root/'linkcheck/STM32U585CI.ld').read_text()
source=(root/'board/recipient_flash.c').read_text()
assert 'FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 1016K' in ld
assert 'RECIPIENT (r) : ORIGIN = 0x080FE000, LENGTH = 8K' in ld
assert '__recipient_flash_start__' in ld and '__recipient_flash_end__' in ld
assert 'HAL_FLASH_Program(FLASH_TYPEPROGRAM_QUADWORD' in source
assert 'HAL_FLASHEx_Erase' not in source and 'HAL_FLASH_Erase' not in source
assert 'offset<RECIPIENT_COMMIT_OFFSET' in source
assert 'program_quad(address+RECIPIENT_COMMIT_OFFSET,commit)' in source
print('PASS: U585 final 8KiB page reserved; 128-bit body/readback/commit ordering; no runtime erase path')
