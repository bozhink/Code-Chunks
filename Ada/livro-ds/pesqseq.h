/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte PesqSeq.h       */

#ifndef PESQSEQ
#define PESQSEQ
                            
#include <stdio.h>
#include <string.h>
#include <process.h>

#define Max		10
#define Key		int

typedef struct {
	Key V[Max];
	int N;
	} Estrutura;

void Inicializa(Estrutura *T);
void Insere(Estrutura *T, Key K);
int Consulta(Estrutura *T, Key K);
void Remove(Estrutura *T, int P);
void Imprime(char *Msg, Estrutura *T);

#endif
