/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte MergeSor.c      */

#include "mergesor.h"

/* Algoritmo 8.7 */
void Merge_Sort(Key V[], int Esq, int Dir, int N)
{
	static Key *Temp = NULL;
	int I, J, K;
	int Metade;

	if (Temp == NULL) {
		Temp = (Key *) calloc(N,sizeof(Key));
		if (Temp == NULL) {
			printf("*** Merge_Sort: faltou memoria!\n");
			exit(1);
			}
		}

	if ((Dir - Esq) > 0)  {
		Metade = (Dir + Esq) / 2;

		Merge_Sort(V,Esq,Metade,N);
		Merge_Sort(V,Metade+1,Dir,N);

		for(I = Esq; I <= Metade; ++I)
			Temp[I-1] = V[I-1];

		for(I = Metade+1; I <= Dir; ++I)
			Temp[Dir+Metade-I] = V[I-1];

		I = Esq;
		J = Dir;

		for(K = Esq; K <= Dir; ++K)
			if (Temp[I-1] < Temp[J-1]) {
				V[K-1] = Temp[I-1];
				I      = I + 1;
				}
			else {
				V[K-1] = Temp[J-1];
				J      = J - 1;
				}
		}

	if (Esq == 1 && Dir == N)
		free(Temp);

} /* Merge_Sort */


void Imprime_Vetor(char Msg[],Key V[], int N)
{
	int I;
	
	printf("%s", Msg);
	for(I = 0; I < N; ++I) {
		printf("%d", V[I]);
		if (I != (N - 1))
			putchar(',');
		}

	putchar('\n');

} /* Imprime_Vetor */
	
