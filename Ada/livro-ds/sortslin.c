/* (C) 1999, Arthur Vargas Lopes  */
/*  Arquivo fonte SortSLin.c      */
    
#include "SortSLin.h"
    
void Swap(Key *X, Key *Y)
{
	Key Temp;
	
	Temp = *X;
	*X   = *Y;
	*Y   = Temp;

} /* Swap */


void Sort_Selecao_Linear(Vetor V[], int N)
{
	int IMenor;
	int Candidato;            

	for(IMenor = 0; IMenor < (N - 1); ++IMenor)
		for(Candidato = IMenor + 1; Candidato < N; ++ Candidato)
			if (V[IMenor] > V[Candidato])
				Swap(&V[IMenor],&V[Candidato]);

} /* Sort_Selecao_Linear */


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

