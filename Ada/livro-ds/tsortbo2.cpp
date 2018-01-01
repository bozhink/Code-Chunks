// (C) 1999, Arthur Vargas Lopes 
//  Arquivo fonte TSortBo2.cpp

#include "Sort3.h"

int Dados[10] = {10,9,8,7,6,5,4,3,2,1};          
Sort3<int,10> D(Dados);

void main()
{
	D.Imprime_Vetor("Vetor antes da ordenacao:  ");

	D.Sort_Bolha();

	D.Imprime_Vetor("Vetor depois da ordenacao: ");

} // Bolha

