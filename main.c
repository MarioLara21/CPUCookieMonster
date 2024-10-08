#include <stdio.h>
#include "CPPS/Computador.c"
int main(void)
{
    computador computadorStruct;
    computador * computadorPointer = &computadorStruct;
    iniciarComputador(computadorPointer);
    comenzarProceso(computadorPointer);
    return 0;
}