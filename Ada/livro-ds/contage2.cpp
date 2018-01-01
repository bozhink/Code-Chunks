// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte Contage2.cpp    

#include "contage2.h"

// Algoritmo 8.9 
void Contagem(int V[], int N)
{
	int *R;
	int *T;
	int I, M = 0, P;
	
	for(I = 0; I < N; ++I)
		if (V[I] > M)
			M = V[I];

	R = (int *) calloc(N,sizeof(int));
	if (R == NULL)  {
		cout << "*** Contagem: faltou memoria!\n";
		exit(1);
		}

	T = (int *) calloc(M,sizeof(int));
	if (T == NULL) {
		cout << "*** Contagem: faltou memoria!\n";
		exit(1);
		}

	// Inicializa o vetor T; por isso o intervalo
	// de chaves deve estar entre 1 e M 
	for(I = 0; I < M; ++I)
		T[I] = 0;

	// Determina T[I] de modo a indicar o número
	// de elementos iguais a I 
	for(I = 0; I < N; ++I)
		T[V[I]-1] = T[V[I]-1] + 1;

	// Faz com que T[I] contenha o número
	// de elementos menores ou iguais a I 
	for(I = 1; I < M; ++I)
		T[I] = T[I] + T[I - 1];

	// Coloca cada elemento V[I] em sua
	// posição correta 
	for(I = 0; I < N; ++I) {
		P           = V[I];
		R[T[P-1]-1] = P;
		T[P-1]      = T[P-1] - 1;
		}

	// Copia R para V 
	for(I = 0; I < N; ++I) 
		V[I] = R[I];

	free(R);
	free(T);

} // Contagem 


void Imprime_Vetor(char Msg[],int V[], int N)
{
	int I;
	
	cout << Msg;
	for(I = 0; I < N; ++I) {
		cout << V[I];
		if (I != (N - 1))
			cout << ',';
		}

	cout << '\n';

} // Imprime_Vetor 
