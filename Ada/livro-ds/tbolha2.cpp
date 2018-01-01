// (C) 1999, Arthur Vargas Lopes 
//  Arquivo fonte TBolha2.cpp

#include "bolha2.h"

void main()
{
	int Dados[10] = {10,9,8,7,6,5,4,3,2,1};          

	Imprime_Vetor("Vetor antes da ordenacao:  ",Dados,10);

	Sort_Bolha(Dados,10);

	Imprime_Vetor("Vetor depois da ordenacao: ",Dados,10);

} // Bolha2

