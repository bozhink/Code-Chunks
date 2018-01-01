// (C) 1999, Arthur Vargas Lopes
// Arquivo fonte SortTop2.h

#ifndef SORTTOPO
#define SORTTOPO

#include "GrafoS2.h"


template <class Tipo_Dado,int N> class SortTopologico
{
public:
	SortTopologico();  // Construtor

	Grafo_Orientado<Tipo_Dado,N> D;

	void Sort_Topologico();

	
private:    
	Tipo_Dado V[N]; // Vetor de Visitados

	void Sort(int I);
};


template <class Tipo_Dado, int N>
SortTopologico<Tipo_Dado,N>::SortTopologico()
{
	int I;

	for(I = 0; I < N; ++I)
		V[I] = FALSE;
};



// Sub-algoritmo 6.25.1 
template <class Tipo_Dado, int N>
void SortTopologico<Tipo_Dado,N>::Sort(int I)
{
	int J;
	char out[4];

	V[I] = TRUE;

	for(J = 0; J < N; ++J)
		if (D.Adjacente(I+1,J+1))
			if (!V[J]) 
				Sort(J);

	sprintf(out,"%3d", I+1);
	cout << out;

}; // Sort 


// Algoritmo 6.25 
template <class Tipo_Dado, int N>
void SortTopologico<Tipo_Dado,N>::Sort_Topologico()
{
	int           I;

	// Inicializa vetor de visitados 
	for(I = 0; I < N; ++I)
		V[I] = FALSE;

	for(I = 0; I < N; ++I)
		if (!V[I]) 
			Sort(I);

}; // Sort_Topologico 

#endif