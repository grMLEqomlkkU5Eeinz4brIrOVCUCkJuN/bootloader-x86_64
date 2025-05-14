; bootloader.asm - a simple x86 bootloader
BITS 16
ORG 0x7C00

start:
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00


    mov si, message

.print_char:
    lodsb                   ; Load byte at DS:SI into AL, increment SI
    cmp al, 0
    je .hang                ; If null terminator, stop
    mov ah, 0x0E            ; BIOS teletype function
    int 0x10                ; Call BIOS interrupt
    jmp .print_char

.hang:
    cli                    ; Clear interrupts
    hlt                    ; Halt CPU

message db "Hello, world!", 0

; Fill rest of sector with 0s
times 510 - ($ - $$) db 0
dw 0xAA55
