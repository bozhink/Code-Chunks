/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte MergeSor.H      */

#ifndef MERGESORT
#define MERGESORT

#include <stdio.h>
#include <malloc.h>
#include <process.h>

#define Key   int
#define Vetor Key

void Merge_Sort(Key V[], int Esq, int Dir, int N);
void Imprime_Vetor(char Msg[], Vetor V[], int N);

#endif
