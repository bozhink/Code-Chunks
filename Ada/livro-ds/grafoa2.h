// (C) 1999, Arthur Vargas Lopes
// Arquivo fonte GrafoA2.h 

#ifndef GRAFOA
#define GRAFOA

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

	Grafo_Orientado();  // Construtor - Inicializa grafo
	~Grafo_Orientado();  // Destrutor - Libera memória
	
	void Conecta(Tipo_Dado I, Tipo_Dado J);
	void Desconecta(Tipo_Dado I, Tipo_Dado J);
	int Adjacente(Tipo_Dado I, Tipo_Dado J);
	void Imprime();

private:    

	typedef struct Grafo_A_Nodo {
		Tipo_Dado            Dado;
		struct Grafo_A_Nodo *Link;
		} Nodo, *Elo, *Grafo[N];

	Grafo G;
};


// algoritmo 6.6
template <class Tipo_Dado, int N>
Grafo_Orientado<Tipo_Dado,N>::Grafo_Orientado()
{
	Tipo_Dado I;

	for(I = 0; I < N; ++I)
		G[I] = NULL;
}; 

	
// algoritmo 6.7
template <class Tipo_Dado, int N>
void Grafo_Orientado<Tipo_Dado,N>::Conecta(Tipo_Dado I, Tipo_Dado J)
{
	Elo P;

	P = (Elo) calloc(1,sizeof(Nodo));
	if (P == NULL) {
		cout << "*** Faltou memoria: Conecta.\n";
		exit(1); /* Termina a execução do programa */
		}

	P -> Dado = J;
	P -> Link = G[I-1];
	G[I-1]      = P;

}; // Conecta


// algoritmo 6.8
template <class Tipo_Dado, int N>
void Grafo_Orientado<Tipo_Dado,N>::Desconecta(Tipo_Dado I, Tipo_Dado J)
{
	Elo P, Q;
		
	P = G[I-1];
	while (P != NULL) 
		if (P -> Dado == J)
			break;
		else {
			Q = P;
			P = P -> Link;
			}

	if (P == NULL) {
			cout << "Operacao_Invalida\n";
			exit(1);
			}

	if (G[I-1] == P)
		G[I-1] = P -> Link;
	else
		Q -> Link = P -> Link;

	free(P);

}; // Desconecta


// algoritmo 6.9
template <class Tipo_Dado, int N>
int Grafo_Orientado<Tipo_Dado,N>::Adjacente(Tipo_Dado I, Tipo_Dado J)
{
	Elo P;

	for(P = G[I-1]; P != NULL; P = P -> Link)
		if (P -> Dado == J)
			return 1;
		else
			P = P -> Link;
	return 0;

}; // Adjacente


// algoritmo 6.10
template <class Tipo_Dado, int N>
Grafo_Orientado<Tipo_Dado,N>::~Grafo_Orientado()
{
	Elo P, Q;
	Tipo_Dado I;

	for(I = 0; I < N; ++I) {
		P    = G[I];
		G[I] = NULL;
		while (P != NULL) {
			Q = P;
			P = P -> Link;
			free(Q);
			}
		}	

};


// algoritmo 6.11
template <class Tipo_Dado, int N>
void Grafo_Orientado<Tipo_Dado,N>::Imprime()
{
	Tipo_Dado I;
	Elo P;

	for(I = 0; I < N; ++I) {
		cout << I + 1 << " : ";
		P = G[I];
		while (P != NULL) {
			cout << P -> Dado;
			P = P -> Link;
			if (P != NULL)
				cout << ", ";
			}
		if (G[I] == NULL)
			cout << "nao tem adjacencia";
		cout << ".\n";
		}
}; // Imprime

#endif

