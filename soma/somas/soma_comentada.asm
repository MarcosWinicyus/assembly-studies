; ALUNO: MARCOS WINICYUS BORGES LIMA

section .data 
  v1 dw '105', 0xa ; Variavel tipo 'word' com valor já definido de '105'

section .bss ;
  buffer: resb 10 ; Variavel que permite mudanças tamanho 10

section .text
  global _start

  _start:
    call converter_valor ; chamada de funcao  para converter o valor de entrada para int e SOMAR 1 a ele
    call mostrar_valor ; chamada de funcao  para converter o valor de entrada para string e mostrar o mesmo

  _final: ; Finaliza o codigo
    mov eax, 1
    mov ebx, 0
    int 0x80

converter_valor:
  lea esi, [v1] ; adicionando ponteiro de V1 em esi
  mov ecx, 3 ;
  call string_to_int ; chamada função de conversao
  ;Nesse momento o valor ja foi convertido para INT
  add eax, 1 ; É somado 1 ao valor convertido
  ret ; Retorna para _start

mostrar_valor:
  lea esi, [buffer]  ; adicionando ponteiro do buffer em esi
  call int_to_string ; chamada de conversao 'INT' para 'STR'
  mov eax, 4
  mov ebx, 1
  mov ecx, buffer  ; Valor correto em string do buffer para ecx
  mov edx, 10 ; buffet tem o tamanho de 10
  int 0x80
  ret ; Retorna onde foi chamado
  
  string_to_int:
    ;CONVERTER STRING PARA INTEIRO
    ;ENTRADA: ESI -> PONTEI DA STRING QUE EU PRECISO CONVERTER
    ;ENTRADA: ECX -> NUMERO DE DIGITOS QUE ESSA STRING TEM
    ;SAIDA: EAX COM O VALOR
    
    xor ebx, ebx ; verificação e limpeza de exb
    .prox_digito: ; Label do processo de conversão caracter a caracter
      movzx eax, byte[esi]
      inc esi
      sub al, '0' ; PROCESSO DE CONVERSÃO
      imul ebx, 10 ; MULTIPLICA EBX EM 10
                    
      add ebx, eax ; EBX = EBX * 10 + EAX
      loop .prox_digito ; SERIA O MESMO QUE WHILE (--ECX) 

      ;APÓS O lOOP

      mov eax, ebx ; COLOCANDO O VALOR EM EAX
      ret ; RETORNA PARA converter_valor

  int_to_string:
    ;CONVERTER INTEIRO PARA STRING
    ;ENTRADA: EAX -> INTEIRO PARA CONVERTER
    ;ENTRADA: ESI -> PONTEIDO PARA ONDE VAI ARMAZENAR A STRING RESULTANTE
    ;SAIDA: EAX STRINS -> PONTEIRO PARA O PRIMEIRO CARACTER DA STRING

    add esi, 9
    mov byte [esi], 0
    mov ebx, 10
    .prox_digito:
    xor edx, edx 
    ; JÁ QUE MULTIPLICOU ANTES  É FEITO O INVERSO
    div ebx ;DIVISSAO POR 10
    add dl, '0' ; PROCESSO DE CONVERSÃO PARA STRING
    dec esi ; DECREMENTA O ESI
    mov [esi], dl
    test eax, eax  ; verifica se o eax contem eax
    jnz .prox_digito  ; ESSE LAÇO VAI ATÉ EAX == 0
    mov eax, esi
    ret ; Retorna onde foi chamado