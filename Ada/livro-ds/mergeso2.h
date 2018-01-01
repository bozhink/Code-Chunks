// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte MergeSo2.h        

#ifndef MERGESORT
#define MERGESORT
                            
#include <iostream.h>
#include <malloc.h>
#include <process.h>
#include <string.h> 
                      
// Algoritmo 8.7 
template <class Key> void Merge_Sort(Key V[], int Esq, int Dir, int N)
{
	static Key *Temp = NULL;
	int I, J, K;
	int Metade;

	if (Temp == NULL) {
		Temp = (Key *) calloc(N,sizeof(Key));
		if (Temp == NULL) {
			cout << "*** Merge_Sort: faltou memoria!\n";
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
} // Merge_Sort


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
