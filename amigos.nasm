.DATOS
numeroUno dw 0
numeroDos dw 0
sumaUno   dw 0
sumaDos   dw 0
solUno db "Ingrese el numero uno: ",0
solDos db "Ingrese el numero dos: ",0
son db "Son amigos",0
noSon db "No son amigos",0
.CODIGO
.INICIO
mstrrCdn solUno 
tmrNtr [numeroUno]
mstrrCdn solDos 
tmrNtr [numeroDos]
cpr DI,1
evaluarCicloUno:
DAEMLM numeroUno,DI
cmprr DX,0
si esMultiplo
aum DI
cmprr DI,numeroUno
si sigueUno
slt evaluarCicloUno
esMultiploUno:
sum [sumaUno],DI
slt evaluarCicloUno
sigueUno:
cmprr [sumaUno],[numeroDos]
sni noSonA
cpr DI,1
evaluarCicloDos:
DAEMLM numeroDos,DI
cmprr DX,0
si esMultiploDos
aum DI
cmprr DI,numeroDos
si sigueDos
slt evaluarCicloDos
esMultiploDos:
sum [sumaDos],DI
slt evaluarCicloDos
cmprr [sumaDos],[numeroUno]
sni noSonA
  mstrr son
  slt fin
noSonA:
  mstrr noSon
  slt fin
fin:
.EXIT