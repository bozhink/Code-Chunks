// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte PesqSeq2.h      

#ifndef PESQSEQ
#define PESQSEQ
                            
#include <iostream.h>
#include <stdio.h>
#include <string.h>
#include <process.h>

template <class Key, int Max> class PesqSeq
{
public:
	PesqSeq();  // Construtor

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
PesqSeq<Key,Max>::PesqSeq()
{
	N = 0;

}; // Inicializa 

// Algoritmo 10.2 
template <class Key, int Max> 
void PesqSeq<Key,Max>::Insere(Key K)
{
	if (N == Max)  {
		cout << "*** overflow na tabela.\n";
		exit(1);
		}

	V[N] = K;
	N    = N + 1;

}; // Insere 

// Algoritmo 10.3 
template <class Key, int Max> 
int PesqSeq<Key,Max>::Consulta(Key K)
{
	int I;
	
	for(I = 0; I < N; ++I)
		if (V[I] == K)
			return I + 1;

	return 0;

}; // Consulta 

// Algoritmo 10.4 
template <class Key, int Max> 
void PesqSeq<Key,Max>::Remove(int P)
{
	if ((P < 1) || (P > N))
		cout << "*** nao pode remover na posicao " <<
		        P << '\n';
	else {
		V[P-1] = V[N - 1];
		N      = N - 1;
		}

}; // Remove 

// Algoritmo 10.5 
template <class Key, int Max> 
void PesqSeq<Key,Max>::Imprime(char *Msg)
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
