section .data
    x dd 50     ; dd - Define double word - 4 bytes
                ; db - define byte - Byte 
                ; dw - define word - 2 Bytes
                ; dq - Define Quad Word - 4 Bytes
                ; dt - Define ten Word - 10 bytes
    y dd 10
    msg1 db 'X maior que Y', 0xa
    len1 equ $ - msg1
    msg2 db 'Y maior que X', 0xa
    len2 equ $ - msg2

section .text

global _start

_start:
    mov eax, DWORD [x]
    mov ebx, DWORD [y]
    cmp eax, ebx            ; eax > ebx ,  eax < ebx
    jge maior                        ; je = jg > jge >= jl < jle <= jne !=
    mov edx, len2
    mov ecx, msg2
    jmp final   ; jmp salto incondicional

maior:
    mov edx, len1
    mov ecx, msg1

final:
    mov ebx, 1
    mov eax, 4
    int 0x80
    mov eax, 1
    int 0x80