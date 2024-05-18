bits 16
org 0x7c00

start:
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