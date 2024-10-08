%include 'io.mac'
global copiar
global obtenerOverflowFlag
global obtenerSingFlag
global obtenerZeroFlag
global obtenerCarryFlag
global multiplicar
global disminuir
global aumentar
global comparar
global saltoNoIgual
global saltoMayorIgual
global saltoIgual
global sumar
global DAEMLM
segment .data

segment .text
;==========================================
;Objetivo: Pasar el dato de una variable a otra
;Input: Puntero a la instrucción y dato a copiar
;==========================================
    copiar:
      enter 0,0
      mov ecx, [ebp+8] 
      mov eax, [ebp+12] 
      mov [ecx],eax
      leave
      ret
;==========================================
;Objetivo: Mostrar el valor de la OF
;Input: Puntero donde se almacena el valor
;Output: El valor de la flag
;==========================================
    obtenerOverflowFlag:
      enter 0,0
      jo over
      mov ecx, [ebp+8] 
      mov byte[ecx],0
      jmp endO
      over:
      mov ecx, [ebp+8] 
      mov byte[ecx],1
      endO:
      leave
      ret
;==========================================
;Objetivo: Mostrar el valor de la CF
;Input: Puntero donde se almacena el valor
;Output: El valor de la flag
;==========================================
    obtenerCarryFlag:
      enter 0,0
      jc carry
      mov ecx, [ebp+8] 
      mov byte[ecx],0
      jmp endC
      carry:
      mov ecx, [ebp+8] 
      mov byte[ecx],1
      endC:
      leave
      ret
;==========================================
;Objetivo: Mostrar el valor de la ZF
;Input: Puntero donde se almacena el valor
;Output: El valor de la flag
;==========================================
    obtenerZeroFlag:
      enter 0,0
      jz zero
      mov ecx, [ebp+8] 
      mov byte[ecx],0
      jmp endZ
      zero:
      mov ecx, [ebp+8] 
      mov byte[ecx],1
      endZ:
      leave
      ret
;==========================================
;Objetivo: Mostrar el valor de la SF
;Input: Puntero donde se almacena el valor
;Output: El valor de la flag
;==========================================
      obtenerSingFlag:
      enter 0,0
      js sing
      mov ecx, [ebp+8] 
      mov byte[ecx],0
      jmp endS
      sing:
      mov ecx, [ebp+8] 
      mov byte[ecx],1
      endS:
      leave
      ret
;==========================================
;Objetivo: Multiplicar dos numeros
;Input: Puntero donde se almacena el resultado y dos valores
;==========================================
    multiplicar:
      enter 0,0
      mov edx, [ebp+8]
      mov eax, [ebp+12]
      mov ecx, [ebp+16]
      sumas:
        cmp ecx,1
        je fin
        add eax,[edx]
        dec ecx
        jmp sumas
      fin:
      mov dword[edx],eax
      leave
      ret
;==========================================
;Objetivo: Decrementar el valor de una variable en 1
;Input: Puntero donde se almacena el valor a disminuir
;==========================================
    disminuir:
      enter 0,0
      mov edx, [ebp+8]
      mov eax,[edx]
      dec eax
      mov dword[edx],eax
      leave
      ret
;==========================================
;Objetivo: Aumentar el valor de una variable en 1
;Input: Puntero donde se almacena el valor a aumentar
;==========================================
    aumentar:
      enter 0,0
      mov edx, [ebp+8]
      mov eax,[edx]
      inc eax
      mov dword[edx],eax
      leave
      ret
;==========================================
;Objetivo: Mostrar las flags al comparar
;Input: Punteros a para cada flag y los valores a comparar
;==========================================
    comparar:
      enter 0,0
      mov edx, [ebp+8]
      mov eax, [ebp+12]
      mov ecx, [ebp+16]
      cmp edx,eax
      jz isZero
      mov dword[ecx],0
      jmp evalSing
      isZero:
      mov dword[ecx],1
      evalSing:
      mov ecx, [ebp+20]
      cmp edx,eax
      js isSing
      mov dword[ecx],0
      jmp evalCarry
      isSing:
      mov dword[ecx],1
      evalCarry:
      mov ecx, [ebp+24]
      cmp edx,eax
      jc isCarry
      mov dword[ecx],0
      jmp evalOver
      isCarry:
      mov dword[ecx],1
      evalOver:
      mov ecx, [ebp+28]
      cmp edx,eax
      jo isOver
      mov dword[ecx],0
      jmp endEval
      isOver:
      mov dword[ecx],1
      endEval:
      leave
      ret
;==========================================
;Objetivo: Mover el PC si no es igual
;Input: Puntero del pc y los valores a comparar
;Output: El valor de la flag
;==========================================
    saltoNoIgual:
      enter 0,0
      mov edx, [ebp+8]
      mov eax, [ebp+12]
      mov ecx, [ebp+16]
      cmp edx,eax
      je endSaltoNoIgual
      mov edx, [ebp+20]
      mov dword[ecx],edx
      endSaltoNoIgual:
      leave
      ret
;==========================================
;Objetivo: Mover el PC si es mayor o igual
;Input: Puntero del pc y los valores a comparar
;Output: El valor de la flag
;==========================================
    saltoMayorIgual:
      enter 0,0
      mov edx, [ebp+8]
      mov eax, [ebp+12]
      mov ecx, [ebp+16]
      cmp edx,eax
      jnae endSaltoMayorIgual
      mov edx, [ebp+20]
      mov dword[ecx],edx
      endSaltoMayorIgual:
      leave
      ret
;==========================================
;Objetivo: Mover el PC si es igual
;Input: Puntero del pc y los valores a comparar
;Output: El valor de la flag
;==========================================
    saltoIgual:
      enter 0,0
      mov edx, [ebp+8]
      mov eax, [ebp+12]
      mov ecx, [ebp+16]
      cmp edx,eax
      jne endSaltoIgual
      mov edx, [ebp+20]
      mov dword[ecx],edx
      endSaltoIgual:
      leave
      ret
;==========================================
;Objetivo: Sumar dos valores
;Input: Puntero de la fuente y valor a sumar
;==========================================
    sumar:
      enter 0,0
      mov edx, [ebp+8]
      mov eax, [ebp+12]
      add [edx],eax
      leave
      ret
;==========================================
;Objetivo: Obtener el modulo de dos numeros
;Input: Los dos valores y el puntero donde se almacena
;==========================================
    DAEMLM:
      enter 0,0
      mov edx, [ebp+8]
      mov ecx, [ebp+12]
      mov eax, [ebp+16]
      cicloDivision:
        sub ecx,eax
        cmp ecx,eax
        jae cicloDivision
      mov [edx],ecx
      leave
      ret
