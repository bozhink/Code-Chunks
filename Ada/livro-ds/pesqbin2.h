// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte PesqBin2.h      

#ifndef PESQBIN
#define PESQBIN
                            
#include <iostream.h>
#include <stdio.h>
#include <string.h>
#include <process.h>

template <class Key, int Max> class PesqBin
{
public:
	PesqBin();  // Construtor

	void Insere(Key K);
	int Consulta(Key K);
	void Remove(int P);
	void Imprime(char *Msg);

private:

	Key V[Max];
	int N;
};


// Algoritmo 10.1 
template <class Key, int Max> 
PesqBin<Key,Max>::PesqBin()
{
	N = 0;

}; // Inicializa 

// Algoritmo 10.6 
template <class Key, int Max> 
void PesqBin<Key,Max>::Insere(Key K)
{
	int I, J;

	if (N == Max)  {
		cout << "*** overflow na tabela.\n";
		exit(1);
		}

	// Encontra a posição correta para inserir K 
	I = 0;
	while ((I < (N - 1)) && (K > V[I]))  
		I = I + 1;

	// Move as chaves a direita de I - 1 uma posiçao
	// para a direita 
	for(J = N - 1; J >= I; --J)
		V[J+1] = V[J];

	N    = N + 1;
	V[I] = K;

}; // Insere 

// Algoritmo 10.7 
template <class Key, int Max> 
int PesqBin<Key,Max>::Consulta(Key K)
{
	int L, H, M;
	
	L = 0;
	H = N - 1;

	while (L <= H)  {

		M = (L + H) / 2;

		if (K == V[M])
			return M + 1;
		else if (K < V[M])
			H = M - 1;
		else
			L = M + 1;
		}

	return 0;

}; // Consulta 

// Algoritmo 10.8 
template <class Key, int Max> 
void PesqBin<Key,Max>::Remove(int P)
{
	int I;

	if ((P < 1) || (P > N))
		cout << "*** nao pode remover na posicao " <<
		        P << '\n';
	else {
		for(I = P - 1; I < (N - 1); ++I)
			V[I] = V[I+1];

		N = N - 1;
		}

}; // Remove 

// Algoritmo 10.5 
template <class Key, int Max> 
void PesqBin<Key,Max>::Imprime(char *Msg)
{
	int I;

	cout << Msg;

	for(I = 0; I < N; ++I)  {
		cout << V[I];
		if ((I + 1) != N)
			cout << ',';
		}

	cout << '\n';

}; // Imprime 

#endif
