// (C) 1999, Arthur Vargas Lopes 
//  Arquivo fonte TSortIn2.cpp

#include "Sort2.h"

int Dados[10] = {10,9,8,7,6,5,4,3,2,1};
          

Sort2<int,10> D(Dados);

void main()
{
	
	D.Imprime_Vetor("Vetor antes da ordenacao:  ");

	D.Sort_Insercao();

	D.Imprime_Vetor("Vetor depois da ordenacao: ");

} // Insercao

