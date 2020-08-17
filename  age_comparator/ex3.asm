section .data
    msg1 db "Digite o nome do usuario 1: "
    len1 equ $ - msg1
    msg2 db "Digite o nome do usuario 2: "
    len2 equ $ - msg2
    msg3 db " é mais velho(a) que "
    len3 equ $ - msg3
    msg4 db "Digite a idade: "
    len4 equ $ - msg4
    msg5 db " tem a mesma idade que o(a)"
    len5 equ $ - msg5

section .bss
    user1   resb 6
    user2   resb 6
    u1      resd 3
    u2      resd 3
    
section .text
    global _start

    _start:

        mov ecx, msg1
        mov edx, len1
        call EXIBIR
        
        mov ecx, user1
        mov edx, 6
        call ENTRADA

        mov ecx, msg4
        mov edx, len4
        call EXIBIR

        mov ecx, u1
        mov edx, 3
        call ENTRADA
        
        mov ecx, msg2
        mov edx, len2
        call EXIBIR
        
        mov ecx, user2
        mov edx, 6
        call ENTRADA

        mov ecx, msg4
        mov edx, len4
        call EXIBIR

        mov ecx, u2
        mov edx, 3
        call ENTRADA

        mov eax, DWORD [u1]
        mov edx, DWORD [u2]
        cmp eax, edx
        jg u1maior
        je iguais
        jmp u2maior

u1maior:
    mov ecx, user1
    mov edx, 5
    call EXIBIR
    mov ecx, msg3
    mov edx, len3
    call EXIBIR
    mov ecx, user2
    mov edx, 6
    call EXIBIR
    jmp final

u2maior:
    mov ecx, user2
    mov edx, 5
    call EXIBIR
    mov ecx, msg3
    mov edx, len3
    call EXIBIR
    mov ecx, user1
    mov edx, 6
    call EXIBIR
    jmp final

iguais:
    mov ecx, user1
    mov edx, 5
    call EXIBIR
    mov ecx, msg5
    mov edx, len5
    call EXIBIR
    mov ecx, user2
    mov edx, 6
    call EXIBIR

final:
    mov eax, 1
    mov ebx, 0
    int 80h

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