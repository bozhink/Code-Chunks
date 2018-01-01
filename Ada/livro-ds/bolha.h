/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte Bolha.h         */

#ifndef SORT_BOLHA
#define  SORT_BOLHA
                            
#ifndef TRUE
#define TRUE 1
#endif

#ifndef FALSE
#define FALSE 0
#endif

#include <stdio.h>
                      
#define Key int

#define Vetor Key

void Sort_Bolha(Key V[], int N);
void Imprime_Vetor(char Msg[], Vetor V[], int N);

#endif
