/* (C) 1999, Arthur Vargas Lopes  */
/*  Arquivo fonte SortSLO.c       */
    
#include "SortSLO.h"
    
void Swap(Key *X, Key *Y)
{
	Key Temp;
	
	Temp = *X;
	*X   = *Y;
	*Y   = Temp;

} /* Swap */


void Sort_Selecao_Linear_Otimizado(Vetor V[], int N)
{
	int IMenor;
	int Candidato;            
	int IndiceC;
	Key MenorC;

	for(IMenor = 0; IMenor < (N - 1); ++IMenor) {
		IndiceC = IMenor;
		MenorC  = V[IMenor];
		for(Candidato = IMenor + 1; Candidato < N; ++ Candidato)
			if (MenorC > V[Candidato]) {
				IndiceC = Candidato;
				MenorC  = V[Candidato];
				}
		Swap(&V[IMenor],&V[IndiceC]);
		}

} /* Sort_Selecao_Linear_Otimizado */


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

