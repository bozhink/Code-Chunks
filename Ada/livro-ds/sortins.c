/* (C) 1999, Arthur Vargas Lopes  */
/*  Arquivo fonte SortIns.c       */
    
#include "SortIns.h"
    
void Swap(Key *X, Key *Y)
{
	Key Temp;
	
	Temp = *X;
	*X   = *Y;
	*Y   = Temp;

} /* Swap */


void Sort_Insercao(Vetor V[], int N)
{
	int Atual;
	int Anterior;
	Key Chave_Atual;

	for(Atual = 1; Atual < N; ++ Atual)  {
			Chave_Atual = V[Atual];
			Anterior    = Atual - 1;
			while (Anterior >= 0) 
				if (V[Anterior] > Chave_Atual)  {
					V[Anterior+1] = V[Anterior];
					Anterior      = Anterior - 1;
					}
				else
					break;
			V[Anterior+1] = Chave_Atual;
			}

} /* Sort_Insercao */


void Imprime_Vetor(char Msg[], Vetor V[], int N)
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

