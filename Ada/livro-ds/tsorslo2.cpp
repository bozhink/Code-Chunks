// (C) 1999, Arthur Vargas Lopes 
//  Arquivo fonte TSorIns.cpp

#include "Sort1.h"

int Dados[10] = {10,9,8,7,6,5,4,3,2,1};          
Sort1<int,10> D(Dados);

void main()
{
	D.Imprime_Vetor("Vetor antes da ordenacao:  ");

	D.Sort_Selecao_Linear_Otimizado();

	D.Imprime_Vetor("Vetor depois da ordenacao: ");

} // Selecao_Linear_Otimizado

