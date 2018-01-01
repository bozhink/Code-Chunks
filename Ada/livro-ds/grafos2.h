// (C) 1999, Arthur Vargas Lopes
// Arquivo fonte GrafoS2.h 

#ifndef GRAFOS
#define GRAFOS

#ifndef TRUE
#define TRUE 1
#endif

#ifndef FALSE
#define FALSE 0
#endif

#include <stdio.h>
#include <iostream.h>
#include <process.h>	
#include <malloc.h>

template <class Tipo_Dado,int N> class Grafo_Orientado
{
public:
	Grafo_Orientado();  // Construtor
	
	void Conecta(int I, int J);
	void Desconecta(int I, int J);
	int Adjacente(int I, int J);
	void Imprime();

	Tipo_Dado G[N][N]; 	
};


// algoritmo 6.1
template <class Tipo_Dado, int N>
Grafo_Orientado<Tipo_Dado,N>::Grafo_Orientado()
{
	int I, J;

	for(I = 0; I < N; ++I)
		for(J = 0; J < N; ++J)
			G[I][J] = FALSE;
};

	
// algoritmo 6.2
template <class Tipo_Dado, int N>
void Grafo_Orientado<Tipo_Dado,N>::Conecta(int I, int J)
{
	G[I-1][J-1] = TRUE;

}; // Conecta


// algoritmo 6.3
template <class Tipo_Dado, int N>
void Grafo_Orientado<Tipo_Dado,N>::Desconecta(int I, int J)
{
	G[I-1][J-1] = FALSE;

}; // Desconecta


// algoritmo 6.4
template <class Tipo_Dado, int N>
int Grafo_Orientado<Tipo_Dado,N>::Adjacente(int I, int J)
{
	return G[I-1][J-1];

}; // Adjacente


// algoritmo 6.5
template <class Tipo_Dado, int N>
void Grafo_Orientado<Tipo_Dado,N>::Imprime()
{
	int I, J;
	char V[3];

	cout << ' ';
	for(I = 0; I < N; ++I)  {
		sprintf(V,"%2d", I+1);
		cout << V;
		}
	cout << '\n';

	for(I = 0; I < N; ++I)  {
		cout << I+1;
		for(J = 0; J < N; ++J)
			if (Adjacente(I+1,J+1))
				cout << " 1";
			else
				cout << " 0";
		cout << '\n';
		}
}; // Imprime

#endif
