// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte GCaminh2.h      

#ifndef G_CAMINHAMENTOS
#define G_CAMINHAMENTOS

#include "GrafoS2.h"
#include "GFilaC.H" 

template <class Tipo_Dado,int N> class Caminhamentos 
{
public:
	Caminhamentos();  // Construtor

	void DFS(Tipo_Dado I);
	void BFS(Tipo_Dado I);
	void Inicializa_Visitados();
	
	Grafo_Orientado<Tipo_Dado,N> G;
	
private:    
	FilaC<Tipo_Dado,N> F;
	Tipo_Dado V[N]; // Vetor de Visitados

};


template <class Tipo_Dado, int N>
Caminhamentos<Tipo_Dado,N>::Caminhamentos() // Substitui procedimento de inicialização
{ 
	int I, J;

	for(I = 0; I < N; ++I)
		for(J = 0; J < N; ++J)
			G.G[I][J] = FALSE;
};


// Algoritmo 6.12
template <class Tipo_Dado, int N>
void Caminhamentos<Tipo_Dado,N>::DFS(Tipo_Dado I)
{
	int J;
	char saida[10];
	
	V[I-1] = TRUE;
	sprintf(saida,"%3d", I);
	cout << saida;
	for(J = 0; J < N; ++J)
		if (G.Adjacente(I,J+1))
			if (!V[J])
				DFS(J+1);
}; // DFS


// Algoritmo 6.13
template <class Tipo_Dado, int N>
void Caminhamentos<Tipo_Dado,N>::BFS(Tipo_Dado I)
{
	int  X;
	int  J;
	char saida[10];

	/* Inicializa vetor de visitados */
	Inicializa_Visitados();

	sprintf(saida,"%3d", I);
	cout << saida;
	V[I-1] = TRUE;
	F.Queue(I);
	while(F.Tamanho() > 0) {
		F.DeQueue(&X);
		for(J = 0; J < N; ++J)
			if (G.Adjacente(X,J+1))
				if (!V[J]) {
					sprintf(saida,"%3d", J+1);
					cout << saida;
					V[J] = TRUE;
					F.Queue(J+1);
					}
		}
}; // BFS 

template <class Tipo_Dado, int N>
void Caminhamentos<Tipo_Dado,N>::Inicializa_Visitados()
{
	Tipo_Dado I;

	for(I = 0; I < N; ++I)
		V[I] = FALSE;
}; // Inicializa_Visitados

#endif
