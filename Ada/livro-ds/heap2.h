// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte Heap2.h

#ifndef HEAP
#define HEAP

#include <stdio.h>
#include <iostream.h>
#include <process.h>	

template <class Tipo_Dado,int N,int MValor> class Heap
{
public:
	Heap();  // Construtor
	
	void Insere(Tipo_Dado Va);
	Tipo_Dado Remove();
	void Imprime(char Msg[]);

private:
	Tipo_Dado V[N+1];
	int Q;
};


// Algoritmo 7.5 
template <class Tipo_Dado, int N, int MValor>
Heap<Tipo_Dado,N,MValor>::Heap()
{
	Q    = 0;
	V[0] = MValor;

}; // Inicializa


// Algoritmo 7.6 
template <class Tipo_Dado, int N, int MValor>
void Heap<Tipo_Dado,N,MValor>::Insere(Tipo_Dado Va)
{
	int I;

	if (Q == N)  
		throw "*** Heap overflow.";

	Q      = Q + 1;
	V[Q] = Va;
	I        = Q;
	while(V[I / 2] <= Va) {
		V[I] = V[I / 2];
		I      = I / 2;
		}
	V[I] = Va;

}; // Insere 


// Algoritmo 7.7 
template <class Tipo_Dado, int N, int MValor>
Tipo_Dado Heap<Tipo_Dado,N,MValor>::Remove()
{
	int J, K;
	Tipo_Dado Va, X;

	if (Q == 0)  
		throw "*** Heap underflow.";

	X    = V[1];
	V[1] = V[Q];
	Q    = Q - 1;
	Va   = V[1];
	K    = 1;
	while(K <= (Q / 2)) {
		J = K + K;
		if (J < Q)
			if (V[J] < V[J+1])
				J = J + 1;
		if (Va >= V[J])
			break;
		else {
			V[K] = V[J];
			K    = J;
			}
		}

	V[K] = Va;
	return X;

}; // Remove 

	
// Algoritmo 7.8 
template <class Tipo_Dado, int N, int MValor>
void Heap<Tipo_Dado,N,MValor>::Imprime(char Msg[])
{
	int I, J;
	int Nivel;
	char linha[80], format[5];

	cout << Msg << '\n';
	Nivel = 1;
	sprintf(linha, "%30s%d\n", " ", V[1]);
	cout << linha;
	I     = Nivel + 1;
	while(I <= Q) {
		J = 1;
		while((J <= Nivel * 2) && (I <= Q))  {
			sprintf(format,"%c%ds", '%', 80 / (Nivel * 2 + 1));
			sprintf(linha,format, " ");
			cout << linha << V[I];
			I = I + 1;
			J = J + 1;
			}
		cout << '\n';
		Nivel = Nivel + 1;
		}
}; // Imprime 

#endif