.DATOS
numero db 1
resultado db 1
solicitud db "Ingrese el dato: ",0
msgResultado db "El resultado es: ",0

.CODIGO
.INICIO
cpr [resultado],1
pnrCdn solicitud
tmrNtr [numero]
cicloFactorial:
    cpr AX,[numero]
    cpr BX,[resultado]
    mult BX
    cpr [resultado],EAX
    cpr AX,[numero]
    dis AX
    cpr [numero],EAX
    cmprr AX,1
    jne ciclo factorial
    mstrnl
    mstrCdn msgResultado
    mstrNtr [resultado]
    .FIN