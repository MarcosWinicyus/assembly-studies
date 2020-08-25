; ALUNO: Marcos Winicyus Borges Lima

section .data
    tit         db  10, '+-------------+',10,'| Questao 2 |', 10, '+-------------+', 0
    ltit        equ $ - tit

    msgOpc      db  10, 'Digite um numero de  0 a 8 : ',0
    lmsgOpc     equ $ - msgOpc

    msgfinal     db  10, 'PROGRAMA ENCERRADO!',0
    lmsgfinal    equ $ - msgfinal

    salLinha    db  10,0
    lsalLinha   equ $ - salLinha ;SALTAR LINHA

    msgResul    db  10, 'cont: ', 0
    lmsgResul   equ $ - msgResul

section .bss
    cont  resb 10
    result resb 10
    
section .text
    global _start

        _start:
            mov ecx, tit
            mov edx, ltit
            call mst_saida

            mov ecx, msgOpc
            mov edx, lmsgOpc
            call mst_saida

            mov ecx, cont
            mov edx, 10
            mov eax, 3
            mov ebx, 0
            int 80h

            mov eax, '1'
            sub eax, '0'
            mov ebx, [cont]
            sub ebx, '0'
            add eax, ebx
            add eax, '0'
            mov [result], eax

; ===================================================================
            mov ecx, msgResul
            mov edx, 1
            call mst_saida

            mov ecx, result
            mov edx, 1
            call mst_saida

            mov ah, [result]
            sub ah, '0' 
           
            cmp ah, 9
            jl recebe_cont
            cmp ah, 9
            jge exit

        recebe_cont:
            mov ecx, msgOpc
            mov edx, lmsgOpc
            call mst_saida

            mov ecx, cont
            mov edx, 10
            mov eax, 3
            mov ebx, 0
            int 80h

            mov eax, [result]
            sub eax, '0'
            mov ebx, [cont]
            sub ebx, '0'
            add eax, ebx
            add eax, '0'
            mov [result], eax

; ===================================================================

            mov ecx, msgResul
            mov edx, 1
            call mst_saida

            mov ecx, result
            mov edx, 1
            call mst_saida 

            mov ah, [result]
            sub ah, '0'

            cmp ah, 9
            jl recebe_cont
            cmp ah, 9
            jge exit
        
        exit:
            mov ecx, salLinha
            mov edx, lsalLinha
            call mst_saida

            mov ecx, msgfinal
            mov edx, lmsgfinal
            call mst_saida

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
