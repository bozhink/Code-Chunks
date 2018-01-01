// (C) 1999, Arthur Vargas Lopes 
//  Arquivo fonte TRadixSo.cpp     

#include "Radixso2.h"

RadixSort<int,10,2> RS;

void main()
{
	int Dados[10] = {10,9,8,7,6,5,4,3,2,1};          

	RS.Imprime_Vetor("Vetor antes da ordenacao:  ",Dados);

	RS.Radix_Sort(Dados);

	RS.Imprime_Vetor("Vetor depois da ordenacao: ",Dados);

} // main

