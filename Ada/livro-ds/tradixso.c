/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte TRadixSo.c      */

#include "radixsor.h"

void main()
{
	int Dados[10] = {10,9,8,7,6,5,4,3,2,1};          

	Imprime_Vetor("Vetor antes da ordenacao:  ",Dados,10);

	Radix_Sort(Dados,10);

	Imprime_Vetor("Vetor depois da ordenacao: ",Dados,10);

} /* main */