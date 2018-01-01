// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte Heapsor2.h        

#ifndef HEAPSORT
#define HEAPSORT
                            
#include <iostream.h>
#include <malloc.h>
#include <process.h>
#include <string.h> 
#include "Heap2.H"

template <class Key, int n, int MValor> class HeapSort
{
public:
	void Heap_Sort(Key V[], int n);
	void Imprime_Vetor(char Msg[],Key V[], int n);

private:
	Heap<Key,n,MValor> H1;
};

	
template <class Key, int n, int MValor> 
void HeapSort<Key,n,MValor>::Heap_Sort(Key V[], int n) 
{
	int I;
	Key X;

	for(I = 0; I < n; ++I)
		H1.Insere(V[I]);

	for(I = 1; I <= n; ++I) {
		X = H1.Remove();
		V[n - I] = X;
		}
}; // Heap_Sort


template <class Key, int n, int MValor> 
void HeapSort<Key,n,MValor>::Imprime_Vetor(char Msg[],Key V[], int n)
{
	int I;
	
	cout << Msg;
	for(I = 0; I < n; ++I) {
		cout << V[I];
		if (I != (n - 1))
			cout << ',';
		}

	cout << '\n';

}; // Imprime_Vetor 
	
#endif
