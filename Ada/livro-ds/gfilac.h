// (C) 1999, Arthur Vargas Lopes
// Arquivo fonte GFilaC.h

#ifndef FILAC
#define FILAC 

#include <stdio.h>
#include <iostream.h>
#include <process.h>	
#include <malloc.h>

template <class Tipo_Dado,int N> class FilaC
{
public:
	Filac();  // Construtor

	void Queue(Tipo_Dado D);
	void DeQueue(Tipo_Dado *R);
	int Tamanho();

private:    
	Tipo_Dado Q[N];
	int       Inicio;
	int       Fim;
	int       tamanho;
};

// Algoritmo 4.4
template <class Tipo_Dado, int N>
FilaC<Tipo_Dado,N>::Filac() // Substitui procedimento de inicialização
{
	Inicio  = 0;
	Fim     = -1;
	tamanho = 0;

}; // Inicializa
	
// Algoritmo 4.5
template <class Tipo_Dado, int N>
void FilaC<Tipo_Dado,N>::Queue(Tipo_Dado D)
{

	if (N == tamanho) {
		cout << "*** Overflow na fila ***" << '\n';
		exit(1);
		}
	else {
		Q[Fim]  = D;
		Fim     = (Fim + 1) % N;
		tamanho += 1;
		}

}; // Queue


// Algoritmo 4.6
template <class Tipo_Dado, int N>
void FilaC<Tipo_Dado,N>::DeQueue(Tipo_Dado *R)
{
	if (tamanho == 0) {
		cout << "*** Underflow na fila ***\n";
		exit(1);
		}
	else	{
		*R       = Q[Inicio];
		Inicio   = (Inicio + 1) % N;
		tamanho -= 1;
		}

}; // DeQueue

template <class Tipo_Dado, int N>
int FilaC<Tipo_Dado,N>::Tamanho() 
{   
	return tamanho;

}; // Tamanho

#endif

