// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte SortSLi2.h       

#ifndef SORT_SELECAO_LINEAR
#define  SORT_SELECAO_LINEAR
                            
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

template <class Key,int N> class Sort
{
public:

	Sort(Key K[N]) { int i; for(i = 0; i < N; ++i) V[i] = K[i]; }
	void Sort_Selecao_Linear();
	void Imprime_Vetor(char Msg[]);

private:
	void Swap(Key *X, Key *Y);

	Key V[N];

};

	
template <class Key,int N>
void Sort<Key,N>::Swap(Key *X, Key *Y)
{
	Key Temp;
	
	Temp = *X;
	*X   = *Y;
	*Y   = Temp;

}; // Swap 


template <class Key,int N>
void Sort<Key,N>::Sort_Selecao_Linear()
{
	int IMenor;
	int Candidato;            

	for(IMenor = 0; IMenor < (N - 1); ++IMenor)
		for(Candidato = IMenor + 1; Candidato < N; ++Candidato)
			if (V[IMenor] > V[Candidato])
				Swap(&V[IMenor],&V[Candidato]);

}; // Sort_Selecao_Linear 


template <class Key,int N>
void Sort<Key,N>::Imprime_Vetor(char Msg[])
{
	int I;
	
	cout << Msg;
	for(I = 0; I < N; ++I) {
		cout << V[I];
		if (I != (N - 1))
			cout << ',';
		}

	cout << '\n';

}; // Imprime_Vetor 


#endif
  
