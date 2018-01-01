// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte Sort1.h       

#ifndef SORT_SELECAO_LINEAR_OTIMIZADO
#define  SORT_SELECAO_LINEAR_OTIMIZADO
                            
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

template <class Key,int N> class Sort1
{
public:

	Sort1(Key K[N]) { int i; for(i = 0; i < N; ++i) V[i] = K[i]; }
	void Sort_Selecao_Linear();
	void Sort_Selecao_Linear_Otimizado();
	void Imprime_Vetor(char Msg[]);

private:
	void Swap(Key *X, Key *Y);

	Key V[N];

};

	
template <class Key,int N>
void Sort1<Key,N>::Swap(Key *X, Key *Y)
{
	Key Temp;
	
	Temp = *X;
	*X   = *Y;
	*Y   = Temp;

}; // Swap 


template <class Key,int N>
void Sort1<Key,N>::Sort_Selecao_Linear()
{
	int IMenor;
	int Candidato;            

	for(IMenor = 0; IMenor < (N - 1); ++IMenor)
		for(Candidato = IMenor + 1; Candidato < N; ++Candidato)
			if (V[IMenor] > V[Candidato])
				Swap(&V[IMenor],&V[Candidato]);

}; // Sort_Selecao_Linear 


template <class Key,int N>
void Sort1<Key,N>::Sort_Selecao_Linear_Otimizado()
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

}; // Sort_Selecao_Linear_Otimizado


template <class Key,int N>
void Sort1<Key,N>::Imprime_Vetor(char Msg[])
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
  
