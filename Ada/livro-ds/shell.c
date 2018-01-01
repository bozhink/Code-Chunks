/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte Shell.c         */

#include "shell.h"

void Swap(Key *X, Key *Y)
{
	Key Temp;
	
	Temp = *X;
	*X   = *Y;
	*Y   = Temp;

} /* Swap */

/* Algoritmo 8.5 */
void Shell_Sort(Key V[], int N)
{
	int D;
	int Ref;
	int Base;

	D = N / 2;
	while(D > 0)  {
			for(Ref = D; Ref < N; ++Ref) {
				Base = Ref - D;
				while (Base >= 0) 
					if (V[Base] > V[Base+D])  {
						Swap(&V[Base],&V[Base+D]);
						Base = Base - D;
						}
					else
						break;
				}
			D = D / 2;
			}

} /* Sort_Shell */

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
	
