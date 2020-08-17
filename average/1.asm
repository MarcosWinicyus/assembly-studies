; ALUNO: Marcos Winicyus Borges Lima

section .data
    tit         db  10, '+------------------+',10,'| Insira as 4 notas do aluno |', 10, '+------------------+', 0
    ltit        equ $ - tit

    obVal1      db  10, 'Valor 1: ', 0
    lobVal1     equ $ - obVal1

    obVal2      db  10, 'Valor 2: ', 0
    lobVal2     equ $ - obVal2

    obVal3      db  10, 'Valor 3: ', 0
    lobVal3     equ $ - obVal3

    obVal4      db  10, 'Valor 4: ', 0
    lobVal4     equ $ - obVal4

    salLinha    db  10,0
    lsalLinha   equ $ - salLinha ;SALTAR LINHA

    msgResul    db  10, 'RESULTADO INTEIRO : ', 0
    lmsgResul   equ $ - msgResul


    msg1 db  10, 'Aluno Aprovado', 0
    len1 equ $ - msg1

    msg2 db  10, 'Aluno Reprovado', 0
    len2 equ $ - msg2


section .bss
    num1    resb 10
    num2    resb 10
    num3    resb 10
    num4    resb 10
    result  resb 10
    
section .text
    global _start

        _start:
            mov ecx, tit
            mov edx, ltit
            call mst_saida

            ; recebe numero 1 
            mov ecx, obVal1
            mov edx, lobVal1
            call mst_saida
            mov ecx, num1
            mov edx, 10
            mov eax, 3
            mov ebx, 0
            int 80h
            ; recebe numero 2
            mov ecx, obVal2
            mov edx, lobVal2
            call mst_saida
            mov ecx, num2
            mov edx, 10
            mov eax, 3
            mov ebx, 0
            int 80h
            ; recebe numero 3
            mov ecx, obVal3
            mov edx, lobVal3
            call mst_saida
            mov ecx, num3
            mov edx, 10
            mov eax, 3
            mov ebx, 0
            int 80h
            ; recebe numero 4
            mov ecx, obVal4
            mov edx, lobVal4
            call mst_saida
            mov ecx, num4
            mov edx, 10
            mov eax, 3
            mov ebx, 0
            int 80h

            call  function


        function:
            ; RESULT = VAL2 + (-(VAL1+VAL3))

            ;(num1 + num2)
            mov eax, [num1]
            sub eax, '0'
            mov ebx, [num2]
            sub ebx, '0'
            add eax, ebx
            add eax, '0'
            mov [result], eax

            ; num3 + result
            mov eax, [num3]
            sub eax, '0'
            mov ebx, [result]
            sub ebx, '0'
            add eax, ebx
            add eax, '0'
            mov [result], eax

            ; num4 + result
            mov eax, [num4]
            sub eax, '0'
            mov ebx, [result]
            sub ebx, '0'
            add eax, ebx
            add eax, '0'
            mov [result], eax


            ;result / 4
            ;media

            mov al, [result]
            mov bl, '4'
            mov ah, 0
            mov dx, 0
            sub al, '0'
            sub bl, '0'                             
            div bl
            add ax, '0'
            mov [result], ax

            mov ecx, msgResul 
            mov edx, lmsgResul
            call mst_saida

            mov ecx, result
            mov edx, 1
            call mst_saida  

            mov eax, '6' 
            sub eax, '0'
            mov ebx, [result]
            sub ebx, '0'
            cmp ebx, eax
            jge aprovado

            mov ecx, msg2
            mov edx, len2
            call mst_saida
   
            jmp exit

        aprovado:
            mov ecx, msg1
            mov edx, len1
            call mst_saida

            jmp exit
        
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