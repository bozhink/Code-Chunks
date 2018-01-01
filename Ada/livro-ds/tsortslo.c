/* (C) 1999, Arthur Vargas Lopes  */
/*  Arquivo fonte TSortSLO.c      */

#include "SortSLO.h"

void main()
{
	Vetor Dados[] = {10,9,8,7,6,5,4,3,2,1,0};          
	int N = sizeof(Dados) / sizeof(Key);

	Imprime_Vetor("Vetor antes da ordenacao:  ", Dados,N);

	Sort_Selecao_Linear_Otimizado(Dados,N);

	Imprime_Vetor("Vetor depois da ordenacao: ", Dados,N);

} /* Selecao_Linear_Otimizado */