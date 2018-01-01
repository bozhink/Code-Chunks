// (C) 1999, Arthur Vargas Lopes 
//  Arquivo fonte THeapSor.cpp     

#include "Heapsor2.h"

HeapSort<int,10,99> HS;

void main()
{
	int Dados[10] = {10,9,8,7,6,5,4,3,2,1};          

	HS.Imprime_Vetor("Vetor antes da ordenacao:  ",Dados,10);

	HS.Heap_Sort(Dados,10);

	HS.Imprime_Vetor("Vetor depois da ordenacao: ",Dados,10);

} // main

