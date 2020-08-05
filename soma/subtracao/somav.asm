section .data
    msg1    db  "Digite um numero [0-9]: "
    len1    equ $ - msg1
    msg2    db  "Resutado da soma [0-9]: "
    len2    equ $ - msg2
    fl      db  " ", 0xa

section .bss
    num1    resb    2
    num2    resb    2
    resul   resb    2

section .text
    global _start

    _start:
    mov ecx, msg1
    mov edx, len1
    call EXIBIR

    mov ecx, num1
    mov edx, 2
    call ENTRADA

    mov ecx, msg1
    mov edx, len1
    call EXIBIR

    mov ecx, num2
    mov edx, 2
    call ENTRADA    

    mov eax, [num1]
    sub eax, '0' ;convertendo para inteiro

    mov ebx, [num2]
    sub ebx, '0'

    sub eax, ebx ;instrução de soma

    add eax, '0'

    mov [resul], eax

    mov ecx, msg2
    mov edx, len2
    call EXIBIR

    mov ecx, resul
    mov edx, 2
    call EXIBIR

    mov ecx, fl
    mov edx, 3
    call EXIBIR

    jmp final

    EXIBIR:
        mov eax, 4
        mov ebx, 1
        int 80h
        ret 
    
    ENTRADA:
        mov eax, 3
        mov ebx, 0
        int 80h
        ret 
    
    final:
        mov eax, 1
        mov ebx, 0
        int 80h