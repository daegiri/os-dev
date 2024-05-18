org 0
bits 16

_start:
  jmp short start
  nop
 
times 33 db 0

start:
  jmp 0x7c0:main

main:
  cli             ; prevents interrupts
  mov ax, 0x7c0
  mov ds, ax
  mov es, ax
  mov ss, ax
  mov ax, 0x00
  mov sp, 0x7c00
  sti             ; enables interrupts

  mov si, message

print_char:
  lodsb           ; putting the first byte of SI into AL
  cmp al, 0       ; checking for null terminator string
  je done         ; end
  mov ah, 0eh     ; teletype 
  int 0x10      
  jmp print_char  ; going for the next character

done:
  hlt

message: db 'Hello Bootloader!', 0

times 510-($ - $$) db 0
dw 0xAA55