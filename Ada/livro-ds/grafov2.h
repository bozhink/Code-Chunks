// (C) 1999, Arthur Vargas Lopes
// Arquivo fonte GrafoV2.h 

#ifndef GRAFOV
#define GRAFOV

#include <stdio.h>
#include <iostream.h>
#include <process.h>	
#include <malloc.h>

template <class Tipo_Dado,int N,int MValor> class Grafo_Valorado
{
public:
	Grafo_Valorado();  // Construtor

#define Grafo(X) Tipo_Dado X[N][N]
	
	void Conecta(int I, int J, Tipo_Dado V);
	void Desconecta(int I, int J);
	Tipo_Dado Adjacente(Grafo (G), int I, int J);
	void Imprime(Grafo (G));
	void Menores_Custos();
	void Gera_Caminhos();
	void Exibe_Caminho(int I, int J, int F = 1);
	void Menor_Caminho(int I, int J);
	void Gera_Conectividade();
	Tipo_Dado Centro();


	Grafo (G);
	Grafo (C);
	Grafo (P);
	Grafo (Cd);
};


// algoritmo 6.14
template <class Tipo_Dado, int N,int MValor>
Grafo_Valorado<Tipo_Dado,N,MValor>::Grafo_Valorado()
{
	int I, J;

	for(I = 0; I < N; ++I)
		for(J = 0; J < N; ++J)
			G[I][J] = (Tipo_Dado) 0;
};

	
// algoritmo 6.15
template <class Tipo_Dado, int N,int MValor>
void Grafo_Valorado<Tipo_Dado,N,MValor>::Conecta(int I, int J, Tipo_Dado V)
{
	G[I-1][J-1] = V;

}; // Conecta


// algoritmo 6.16
template <class Tipo_Dado, int N,int MValor>
void Grafo_Valorado<Tipo_Dado,N,MValor>::Desconecta(int I, int J)
{
	G[I-1][J-1] = (Tipo_Dado) 0;

}; // Desconecta


// algoritmo 6.17
template <class Tipo_Dado, int N,int MValor>
Tipo_Dado Grafo_Valorado<Tipo_Dado,N,MValor>::Adjacente(Grafo (G)
                                                       ,int I
                                                       ,int J)
{
	return G[I-1][J-1];

}; // Adjacente


// algoritmo 6.18
template <class Tipo_Dado, int N,int MValor>
void Grafo_Valorado<Tipo_Dado,N,MValor>::Imprime(Grafo (G))
{
	int I, J;
	char V[4];

	cout << ' ';
	for(I = 0; I < N; ++I)  {
		sprintf(V,"%3d", I+1);
		cout << V;
		}
	cout << '\n';

	for(I = 0; I < N; ++I)  {
		cout << I+1;
		for(J = 0; J < N; ++J) {
			sprintf(V,"%3d", Adjacente(G,I+1,J+1));
			cout << V;
			}
		cout << '\n';
		}
}; // Imprime


// algoritmo 6.19
template <class Tipo_Dado, int N,int MValor>
void Grafo_Valorado<Tipo_Dado,N,MValor>::Menores_Custos()
{
	int I, J, K;

	for(I = 0; I < N; ++I)
		for(J = 0; J < N; ++J)
			if (G[I][J] != (Tipo_Dado) 0)
				C[I][J] = G[I][J];
			else
				C[I][J] = MValor;

	for(I = 0; I < N; ++I)
		C[I][I] = (Tipo_Dado)0;

	for(K = 0; K < N; ++K)
		for(I = 0; I < N; ++I)
			for(J = 0; J < N; ++J)
				if ((C[I][K] + C[K][J]) < C[I][J])
					 C[I][J] = C[I][K] + C[K][J];

}; // Menores_Custos 


// algoritmo 6.20 
template <class Tipo_Dado, int N,int MValor>
void Grafo_Valorado<Tipo_Dado,N,MValor>::Gera_Caminhos()
{
	int I, J, K;
	Grafo (C);

	for(I = 0; I < N; ++I)
		for(J = 0; J < N; ++J)  {
			P[I][J] = (Tipo_Dado)0;
			if (G[I][J] != (Tipo_Dado) 0)
				C[I][J] = G[I][J];
			else
				C[I][J] = MValor;
			}

	for(I = 0; I < N; ++I)
		C[I][I] = (Tipo_Dado)0;

	for(K = 0; K < N; ++K)
		for(I = 0; I < N; ++I)
			for(J = 0; J < N; ++J)
				if ((C[I][K] + C[K][J]) < C[I][J])  {
					C[I][J] = C[I][K] + C[K][J];
					P[I][J] = K + 1;
					}

}; // Gera_Caminhos 


// algoritmo 6.21 
template <class Tipo_Dado, int N,int MValor>
void Grafo_Valorado<Tipo_Dado,N,MValor>::Exibe_Caminho(int I
                                                      ,int J
													  ,int F)
{
	Tipo_Dado K;
	char V[4];

	if (F == 1) { // Exibe o vértice inicial 
		sprintf(V,"%3d", I);
		cout << V;
		}

	K = P[I-1][J-1];

	if (K != 0) {
		Exibe_Caminho(I,K,F+1);
		sprintf(V,"%3d", K);
		cout << V;
		Exibe_Caminho(K,J,F+1);
		}

	if (F == 1) { // Exibe o vértice final 
		sprintf(V,"%3d", J);
		cout << V << '\n';
		}


}; // Exibe_Caminho 


// algoritmo 6.22
template <class Tipo_Dado, int N,int MValor>
void Grafo_Valorado<Tipo_Dado,N,MValor>::Menor_Caminho(int I
													  ,int J)
{
	cout << "O menor caminho entre " << I << " e " << J << " e': ";

	Gera_Caminhos();

	Exibe_Caminho(I,J);

}; // Menor_Caminho 


// algoritmo 6.23 
template <class Tipo_Dado, int N,int MValor>
void Grafo_Valorado<Tipo_Dado,N,MValor>::Gera_Conectividade()
{
	int I, J, K;

	for(I = 0; I < N; ++I)
		for(J = 0; J < N; ++J)
			if (G[I][J] > ((Tipo_Dado)0))
				Cd[I][J] = (Tipo_Dado)1;
			else
				Cd[I][J] = (Tipo_Dado)0;

	for(K = 0; K < N; ++K)
		for(I = 0; I < N; ++I)
			for(J = 0; J < N; ++J)
				if (Cd[I][J] == ((Tipo_Dado)0)) 
					if ((Cd[I][K] > ((Tipo_Dado)0)) &&
					    (Cd[K][J] > ((Tipo_Dado)0))) 
						Cd[I][J] = (Tipo_Dado)1;

}; // Gera_Conectividade 


// algoritmo 6.24 
template <class Tipo_Dado, int N,int MValor>
Tipo_Dado Grafo_Valorado<Tipo_Dado,N,MValor>::Centro()
{
	// declara o vetor de exentricidades 
	Tipo_Dado E[N];
	int       I, J;
	Tipo_Dado X;

	Menores_Custos();

	for(I = 0; I < N; ++I)
		E[I] = (Tipo_Dado) 0;

	for(J = 0; J < N; ++J)
		for(I = 0; I < N; ++I)
			if (C[I][J] > E[J])
				E[J] = C[I][J];

	X = MValor;

	for(I = 0; I < N; ++I) {
		cout << "          E(" << I + 1 << ") = " << E[I] << '\n';
		if (E[I] < X)
			X = E[I];
		}

	return X;

}; // Centro 

#endif
