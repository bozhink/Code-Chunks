// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte Shell2.h        

#ifndef SORT_SHELL2
#define  SORT_SHELL2
                            
#include <iostream.h>
#include <malloc.h>
#include <process.h>
#include <string.h> 
                      
//Algoritmo 8.5
template <class Key> void Shell_Sort(Key V[], int N)
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
} // Sort_Shell

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
