/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte Shell.h         */

#ifndef SORT_SHELL
#define  SORT_SHELL
                            
#ifndef TRUE
#define TRUE 1
#endif

#ifndef FALSE
#define FALSE 0
#endif

#include <stdio.h>
                      
#define Key int

#define Vetor Key

void Shell_Sort(Key V[], int N);
void Imprime_Vetor(char Msg[], Vetor V[], int N);

#endif
