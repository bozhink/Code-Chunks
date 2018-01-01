/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte Bolha.c         */

#include "bolha.h"

void Swap(Key *X, Key *Y)
{
	Key Temp;
	
	Temp = *X;
	*X   = *Y;
	*Y   = Temp;

} /* Swap */

void Sort_Bolha(Key V[], int N)
{
	int Atual;
	int Ultimo;
	int Outro_Ciclo;

	Ultimo      = N - 1;
	Outro_Ciclo = TRUE;
	while (Outro_Ciclo) {
		Outro_Ciclo = FALSE;
		for(Atual = 0; Atual < Ultimo; ++Atual) 
			if (V[Atual] > V[Atual+1]) {
				Swap(&V[Atual],&V[Atual+1]);
				Outro_Ciclo = TRUE;
				}
		Ultimo = Ultimo - 1;
		}	

} /* Sort_Bolha */

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
	
