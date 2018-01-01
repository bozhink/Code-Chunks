/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte QuickSor.H      */

#ifndef QUICKSORT
#define QUICKSORT

#include <stdio.h>
#include <process.h>

#define Key   int
#define Vetor Key

void Quick_Sort(Key V[], int Esq, int Dir);
void Imprime_Vetor(char Msg[], Vetor V[], int N);

#endif
