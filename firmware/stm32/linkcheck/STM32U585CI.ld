ENTRY(Reset_Handler)
_estack = ORIGIN(RAM) + LENGTH(RAM);
_sstack = _estack - _Min_Stack_Size;
_Min_Heap_Size = 0x200;
_Min_Stack_Size = 0x6000;
MEMORY
{
  RAM   (xrw) : ORIGIN = 0x20000000, LENGTH = 768K
  SRAM4 (xrw) : ORIGIN = 0x28000000, LENGTH = 16K
  FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 1016K
  RECIPIENT (r) : ORIGIN = 0x080FE000, LENGTH = 8K
}
SECTIONS
{
  .lpbam (NOLOAD) : { . = ALIGN(32); __lpbam_start__ = .; *(.lpbam) . = ALIGN(32); __lpbam_end__ = .; } >SRAM4
  .isr_vector : { KEEP(*(.isr_vector)) } >FLASH
  .text : { *(.text) *(.text*) *(.glue_7) *(.glue_7t) *(.eh_frame) KEEP(*(.init)) KEEP(*(.fini)) _etext = .; } >FLASH
  .rodata : { *(.rodata) *(.rodata*) } >FLASH
  .ARM.extab (READONLY) : { *(.ARM.extab* .gnu.linkonce.armextab.*) } >FLASH
  .ARM (READONLY) : { __exidx_start = .; *(.ARM.exidx*) __exidx_end = .; } >FLASH
  .preinit_array (READONLY) : { PROVIDE_HIDDEN(__preinit_array_start = .); KEEP(*(.preinit_array*)) PROVIDE_HIDDEN(__preinit_array_end = .); } >FLASH
  .init_array (READONLY) : { PROVIDE_HIDDEN(__init_array_start = .); KEEP(*(SORT(.init_array.*))) KEEP(*(.init_array*)) PROVIDE_HIDDEN(__init_array_end = .); } >FLASH
  .fini_array (READONLY) : { PROVIDE_HIDDEN(__fini_array_start = .); KEEP(*(SORT(.fini_array.*))) KEEP(*(.fini_array*)) PROVIDE_HIDDEN(__fini_array_end = .); } >FLASH
  _sidata = LOADADDR(.data);
  .data : { _sdata = .; *(.data) *(.data*) *(.RamFunc) *(.RamFunc*) _edata = .; } >RAM AT>FLASH
  .bss : { _sbss = .; __bss_start__ = _sbss; *(.bss) *(.bss*) *(COMMON) _ebss = .; __bss_end__ = _ebss; } >RAM
  ._user_heap_stack : { . = ALIGN(8); PROVIDE(end = .); PROVIDE(_end = .); . += _Min_Heap_Size; . += _Min_Stack_Size; . = ALIGN(8); } >RAM
  .recipient_reserve (NOLOAD) : {
    __recipient_flash_start__ = .;
    . += LENGTH(RECIPIENT);
    __recipient_flash_end__ = .;
  } >RECIPIENT
  /DISCARD/ : { libc.a(*) libm.a(*) libgcc.a(*) }
  .ARM.attributes 0 : { *(.ARM.attributes) }
}
