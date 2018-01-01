// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte Radixso2.h        

#ifndef RADIXSORT
#define RADIXSORT
                            
#include <iostream.h>
#include <process.h>

#define B 10

template <class Key, int N, int Digitos> class RadixSort
{
public:
	void Radix_Sort(Key V[]);
	void Imprime_Vetor(char Msg[],Key V[]);

private:
	Key T[B];
	Key R[N];

	int Digito(int Val, int D);
	void Contagem(Key V[],int D);
};


template <class Key, int N, int Digitos> 
int RadixSort<Key,N,Digitos>::Digito(int Val, int D)
{
	switch(D) {
		case 1  : return Val % B;
		case 2  : return (Val % (B * B)) / B;
		default :
			cout << "Modifique a funcao Digito\n";
			exit(1);
		}
	return 0;
}; // Digito 

// Algoritmo 8.9  modificado 
template <class Key, int N, int Digitos> 
void RadixSort<Key,N,Digitos>::Contagem(Key V[],int D)
{
	int I, P;


	// Inicializa o vetor T; por isso o intervalo
	//   de chaves deve estar entre 1 e B 
	for(I = 0; I < B; ++I)
			T[I] = 0;

	// Determina T[I] de modo a indicar o número
	// de elementos iguais a I 
	for(I = 0; I < N; ++I)
		T[Digito(V[I],D)] = T[Digito(V[I],D)] + 1;

	// Faz com que T[I] contenha o número
	// de elementos menores ou iguais a I 
	for(I = 1; I < B; ++I)
		T[I] = T[I] + T[I - 1];

	// Coloca cada elemento V[I] em sua
	// posição correta 
	for(I = 0; I < N; ++I) {
		P         = Digito(V[I],D);
		R[N-T[P]] = V[I];
		T[P]      = T[P] - 1;
		}

	// Copia R para V 
	for(I = 0; I < N; ++I) 
		if (D == Digitos)
			V[N-I-1] = R[I];
		else
			V[I]     = R[I];
	
}; // Contagem 


// Algoritmo 8.10
template <class Key, int N, int Digitos> 
void RadixSort<Key,N,Digitos>::Radix_Sort(Key V[]) 
{
	int I;

	for(I = 1; I <= Digitos; ++I)
		Contagem(V,I);

}; // Radix_Sort


template <class Key, int N, int Digitos> 
void RadixSort<Key,N,Digitos>::Imprime_Vetor(char Msg[],Key V[])
{
	int I;
	
	cout << Msg;
	for(I = 0; I < N; ++I) {
		cout << V[I];
		if (I != (N - 1))
			cout << ',';
		}

	cout << '\n';

}; // Imprime_Vetor 
	
#endif
