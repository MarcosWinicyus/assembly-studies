section .data
    tit         db  10, '+-------------+',10,'| EXERCICIO 2 |', 10, '+-------------+', 0
    ltit        equ $ - tit

    obVal1      db  10, 'Digite um valor inteiro 0 - 10: ', 0
    lobVal1     equ $ - obVal1 

    opc1        db  10, 'Digite ‘i’ para incrementar +1',0
    lopc1       equ $ - opc1
    opc2        db  10, 'Digite ‘d’ para decrementar -1',0
    lopc2       equ $ - opc2
    opc3        db  10, 'Digite ‘s’ para finalizar o sistema',0   
    lopc3       equ $ - opc3

    msgOpc      db  10, 'O que deseja Realizar? ',0
    lmsgOpc     equ $ - msgOpc

    msgErro     db  10, 'OPCAO INVALIDA!',0
    lmsgErro    equ $ - msgErro

    salLinha    db  10,0
    lsalLinha   equ $ - salLinha ;SALTAR LINHA

    msgResul    db  10, 'RESULTADO: ', 0
    lmsgResul   equ $ - msgResul

section .bss
    opc     resb 5
    num1    resb 10
    result  resb 10

section .text
    global _start

        _start:
            ;titulo
            mov ecx, tit
            mov edx, ltit
            call mst_saida

            ;Recebe valor
            mov ecx, obVal1
            mov edx, lobVal1
            call mst_saida
            mov ecx, num1
            mov edx, 10
            mov eax, 3
            mov ebx, 0
            int 80h

            ; Da as opcoes
            mov ecx, opc1
            mov edx, lopc1
            call mst_saida

            mov ecx, opc2
            mov edx, lopc2
            call mst_saida

            mov ecx, opc3
            mov edx, lopc3
            call mst_saida

            call recebe_opcao

        recebe_opcao:   
            ;msg receber a opcao
            mov ecx, msgOpc
            mov edx, lmsgOpc
            call mst_saida

            ;receber a opcao
            mov ecx, opc
            mov edx, 2
            mov eax, 3
            mov ebx, 0
            int 80h
            
            mov ah, [opc]

            cmp ah, 'i'
            je  incrementar
            cmp ah, 'd'
            je  decrementar
            cmp ah, 's'
            je  exit

            mov ecx, msgErro
            mov edx, lmsgErro
            call mst_saida

            call recebe_opcao

        incrementar:
            mov eax, [num1]
            sub eax, '0'
            mov ebx, '1'
            sub ebx, '0'
            add eax, ebx
            mov [result], eax
            add eax, '0'
            mov [num1], eax
            

            mov ecx, msgResul 
            mov edx, lmsgResul
            call mst_saida

            mov ecx, num1
            mov edx, 1
            call mst_saida
            
            call recebe_opcao
        
        decrementar:

            mov eax, [num1]
            sub eax, '0'
            mov ebx, '1'
            sub ebx, '0'
            sub eax, ebx
            mov [result], eax
            add eax, '0'
            mov [num1], eax
            

            mov ecx, msgResul 
            mov edx, lmsgResul
            call mst_saida

            mov ecx, num1
            mov edx, 1
            call mst_saida
            
            call recebe_opcao
        
        exit:
            mov ecx, salLinha
            mov edx, lsalLinha
            call mst_saida
            mov eax, 1
            mov ebx, 0
            int 80h

        mst_saida:
            mov eax, 4
            mov ebx, 1
            int 80h
            ret
