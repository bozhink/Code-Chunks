/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte QuickSor.c      */

#include "Quicksor.h"

void Swap(Key *X, Key *Y)
{
	Key Temp;

	Temp = *X;
	*X   = *Y;
	*Y   = Temp;

} /* Swap */


/* Algoritmo 8.8 */
void Quick_Sort(Key V[], int Esq, int Dir)
{
	int I, J, Pivo;

	if (Esq < Dir)  {

		Pivo = V[Esq];
		do {
			/* Constrói duas partições */
			I = Esq + 1;

			while (I <= Dir && V[I] <= Pivo) 
				I = I + 1;

			J = Dir;
			while (J >= Esq && V[J] > Pivo)
				J = J - 1;

			/* Troca V(I) com V(J) caso I e J */
			/*  não tenham se cruzado         */
			if (I < J && I <= Dir && J >= Esq)
				Swap(&V[I],&V[J]);

			} while (I <= J);

		/* Neste ponto V(J) contém o menor valor */
		/* e o maior valor até J está em Pivo    */
		V[Esq] = V[J];
		V[J]   = Pivo;
	
		/* Os elementos entre (Esq,J) são menores  */
		/* ou iguais aos elementos entre (J+1,Dir) */
		Quick_Sort(V,Esq,J);
		Quick_Sort(V,J+1,Dir);
	}
} /* Quick_Sort */


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
	
