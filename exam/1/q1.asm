; ALUNO: Marcos Winicyus Borges Lima

section .data
    tit         db  10, '+-----------------------------------------+',10,'| Insira a nota dos  2 bimestres do aluno |', 10, '+-----------------------------------------+', 0
    ltit        equ $ - tit

    tit2        db  10, 'Valor maximo prova: 5 -- Valor trabalho prova: 4', 0
    ltit2        equ $ - tit2

    trab1      db  10, 'Valor Trabalho 1: ', 0
    ltrab1     equ $ - trab1

    prova1      db  10, 'Valor Prova 1: ', 0
    lprova1     equ $ - prova1

    msg1 db  10, '1º Bimestre', 0
    len1 equ $ - msg1

    msg2 db  10, '2º Bimestre', 0
    len2 equ $ - msg2

    salLinha    db  10,0
    lsalLinha   equ $ - salLinha ;SALTAR LINHA

    msgResulb1    db  10, 'Notas 1º Bimestre : ', 0
    lmsgResulb1   equ $ - msgResulb1

    msgResulb2    db  10, 'Notas 2º Bimestre : ', 0
    lmsgResulb2   equ $ - msgResulb2

    msgResul    db  10, 'Medias 1º e  2º Bimestre : ', 0
    lmsgResul   equ $ - msgResul




section .bss
    num1    resb 10
    num2    resb 10
    num3    resb 10
    num4    resb 10
    resultb1  resb 10
    resultb2  resb 10
    result resb 10
    
section .text
    global _start

        _start:
            mov ecx, tit
            mov edx, ltit
            call mst_saida

            mov ecx, salLinha
            mov edx, lsalLinha
            call mst_saida

            mov ecx, tit2
            mov edx, ltit2
            call mst_saida

            mov ecx, salLinha
            mov edx, lsalLinha
            call mst_saida

; ----------------------------------------------------------------
            ; 1º Bimestre
            mov ecx, msg1
            mov edx, len1
            call mst_saida

            mov ecx, salLinha
            mov edx, lsalLinha
            call mst_saida

            ; Prova 1 
            mov ecx, prova1
            mov edx, lprova1
            call mst_saida

            mov ecx, num1
            mov edx, 10
            mov eax, 3
            mov ebx, 0
            int 80h

            ; Trabalho 1
            mov ecx, trab1
            mov edx, ltrab1
            call mst_saida

            mov ecx, num2
            mov edx, 10
            mov eax, 3
            mov ebx, 0
            int 80h
; ----------------------------------------------------------------
            ; 2º Bimestre
            mov ecx, msg2
            mov edx, len2
            call mst_saida

            mov ecx, salLinha
            mov edx, lsalLinha
            call mst_saida

            ; Prova 1 
            mov ecx, prova1
            mov edx, lprova1
            call mst_saida

            mov ecx, num3
            mov edx, 10
            mov eax, 3
            mov ebx, 0
            int 80h

            ; Trabalho 1
            mov ecx, trab1
            mov edx, ltrab1
            call mst_saida

            mov ecx, num4
            mov edx, 10
            mov eax, 3
            mov ebx, 0
            int 80h

            call  mean_sum

; ----------------------------------------------------------------

        mean_sum:
            ; 1º Bimestre
            ;(num1 + num2)
            mov eax, [num1]
            sub eax, '0'
            mov ebx, [num2]
            sub ebx, '0'
            add eax, ebx
            add eax, '0'
            mov [resultb1], eax

            ; 2º Bimestre
            ;(num3 + num4)
            mov eax, [num3]
            sub eax, '0'
            mov ebx, [num4]
            sub ebx, '0'
            add eax, ebx
            add eax, '0'
            mov [resultb2], eax


            ; resultb2 + resultb1
            mov eax, [resultb1]
            sub eax, '0'
            mov ebx, [resultb2]
            sub ebx, '0'
            add eax, ebx
            add eax, '0'
            mov [result], eax


            ; result / 4
            mov al, [result]
            mov bl, '2'
            mov ah, 0
            mov dx, 0
            sub al, '0'
            sub bl, '0'                             
            div bl
            add ax, '0'
            mov [result], ax

; ----------------------------------------------------------------

            ; Out result B1
            mov ecx, msgResulb1
            mov edx, lmsgResulb1
            call mst_saida

            mov ecx, resultb1
            mov edx, 1
            call mst_saida


            ; Out result B1
            mov ecx, msgResulb2
            mov edx, lmsgResulb2
            call mst_saida

            mov ecx, resultb2
            mov edx, 1
            call mst_saida  

            ; Out average B1 + B2
            mov ecx, msgResul
            mov edx, lmsgResul
            call mst_saida

            mov ecx, result
            mov edx, 1
            call mst_saida  

; ----------------------------------------------------------------

            ; mov eax, '6' 
            ; sub eax, '0'
            ; mov ebx, [result]
            ; sub ebx, '0'
            ; cmp ebx, eax
            ; jge aprovado

            ; mov ecx, msg2
            ; mov edx, len2
            ; call mst_saida
   
            jmp exit

        ; aprovado:
        ;     mov ecx, msg1
        ;     mov edx, len1
        ;     call mst_saida

        ;     jmp exit
        
        mst_saida:
            mov eax, 4
            mov ebx, 1
            int 80h
            ret

        exit:
            mov ecx, salLinha
            mov edx, lsalLinha
            call mst_saida
            mov eax, 1
            mov ebx, 0
            int 80h