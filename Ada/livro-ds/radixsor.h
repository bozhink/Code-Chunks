/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte RadixSor.H      */

#ifndef RADIXSORT
#define RADIXSORT

#include <stdio.h>
#include <malloc.h>
#include <process.h>

#define Digitos 2
#define B       10

void Radix_Sort(int V[], int N);
void Imprime_Vetor(char Msg[], int V[], int N);

#endif
