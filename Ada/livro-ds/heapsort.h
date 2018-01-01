/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte HeapSort.H      */

#ifndef HEAPSORT
#define HEAPSORT

#include <stdio.h>
#include <process.h>

#include "Heap.H"

#define Key   int
#define Vetor Key

void Heap_Sort(Key V[], int n);
void Imprime_Vetor(char Msg[], Vetor V[], int n);

#endif
