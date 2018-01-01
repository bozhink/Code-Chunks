//(C) 1999, Arthur Vargas Lopes 
//Arquivo fonte Bolha2h         

#ifndef SORT_BOLHA2
#define  SORT_BOLHA2
                            
#include <iostream.h>
#include <malloc.h>
#include <process.h>
#include <string.h> 
                            
#ifndef TRUE
#define TRUE 1
#endif

#ifndef FALSE
#define FALSE 0
#endif

template <class Key> void Sort_Bolha(Key V[], int N)
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

} // Sort_Bolha


template <class Key> void Swap(Key *X, Key *Y)
{
	Key Temp;
	
	Temp = *X;
	*X   = *Y;
	*Y   = Temp;

} // Swap 

template <class Key> void Imprime_Vetor(char Msg[],Key V[], int N)
{
	int I;
	
	cout << Msg;
	for(I = 0; I < N; ++I) {
		cout << V[I];
		if (I != (N - 1))
			cout << ',';
		}

	cout << '\n';

} // Imprime_Vetor 
	
#endif
