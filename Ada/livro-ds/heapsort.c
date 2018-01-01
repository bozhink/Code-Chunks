/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte HeapSort.c      */

#include "Heapsort.h"
  
void Imprime_Vetor(char Msg[],Key V[], int n)
{
	int I;
	
	printf("%s", Msg);
	for(I = 0; I < n; ++I) {
		printf("%d", V[I]);
		if (I != (n - 1))
			putchar(',');
		}

	putchar('\n');

} /* Imprime_Vetor */


/* Algoritmo 8.6 */
void Heap_Sort(Vetor V[], int n)
{
	Heap H1;
	int I;
	Key X;

	Inicializa(&H1);

	for(I = 0; I < n; ++I)
		Insere(&H1,V[I]);

	for(I = 1; I <= n; ++I) {
		X = Remove(&H1);
		V[n - I] = X;
		}
} /* Heap_Sort */

