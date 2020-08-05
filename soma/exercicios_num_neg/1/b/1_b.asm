; ALUNO: Marcos Winicyus Borges Lima

section .data
    tit         db  10, '+------------------+',10,'| EXERCICIO 1 - B |', 10, '+------------------+', 0
    ltit        equ $ - tit

    obVal1      db  10, 'Valor 1: ', 0
    lobVal1     equ $ - obVal1

    obVal2      db  10, 'Valor 2: ', 0
    lobVal2     equ $ - obVal2

    obVal3      db  10, 'Valor 3: ', 0
    lobVal3     equ $ - obVal3

    salLinha    db  10,0
    lsalLinha   equ $ - salLinha ;SALTAR LINHA

    msgResul    db  10, 'RESULTADO: ', 0
    lmsgResul   equ $ - msgResul


section .bss
    num1    resb 10
    num2    resb 10
    num3    resb 10
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

            call  function


        function:
             ; RESULT = VAL2 + VAL1 + (VAL1 – VAL3)

            ;(VAL1 – VAL3)
            mov eax, [num1]
            sub eax, '0'
            mov ebx, [num3]
            sub ebx, '0'
            sub eax, ebx
            add eax, '0'
            mov [result], eax
            
            ; VAL1 + result
            mov eax, [num1]
            sub eax, '0'
            mov ebx, [result]
            sub ebx, '0'
            add eax, ebx
            add eax, '0'
            mov [result], eax

            ; VAL2 + result
            mov eax, [num2]
            sub eax, '0'
            mov ebx, [result]
            sub ebx, '0'
            add eax, ebx
            add eax, '0'
            mov [result], eax

            mov ecx, msgResul 
            mov edx, lmsgResul
            call mst_saida

            mov ecx, result
            mov edx, 1
            call mst_saida
            
            jmp exit
        
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
