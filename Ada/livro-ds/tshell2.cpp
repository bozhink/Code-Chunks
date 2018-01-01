// (C) 1999, Arthur Vargas Lopes 
//  Arquivo fonte TShell2.cpp     

#include "shell2.h"

void main()
{
	int Dados[10] = {10,9,8,7,6,5,4,3,2,1};          

	Imprime_Vetor("Vetor antes da ordenacao:  ",Dados,10);

	Shell_Sort(Dados,10);

	Imprime_Vetor("Vetor depois da ordenacao: ",Dados,10);

} // Shell2

