.DATOS
solicita "Ingrese una cadena: ",0
.NDATOS
cadena resb 300

.CODIGO
.INICIO
pnrCdn solicita
tmrCdn [cadena]
CPR AX,[cadena]
cicloMinimizar:
cmprr AX,"a"
smae saltarCorreccion
cmprr AX,0
si mostrarCadena
res AX,30h
saltarCorreccion:
    aum AX
slt cicloMinimizar
mostrarCadena:
    CPR AX,[cadena]
    mstrCdn cadena
    . FIN