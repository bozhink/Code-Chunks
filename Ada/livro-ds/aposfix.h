/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte APosfix.h */
#ifndef AVALIA_POSFIX
#define AVALIA_POSFIX

#include <stdio.h>
#include <process.h>
#include <string.h>
#include <ctype.h>

#define Tipo int /* Define o tipo de valor armazenado na pilha */
#define Max 10   /* Define o número máximo de elementos da pilha */

/* Define o tipo Pilha */
typedef struct {
	Tipo V[Max];
	int Sp;
	} Pilha;

void Inicializa(Pilha *P);

void Push(Pilha *p, Tipo D);

void Pop(Pilha *p, Tipo *R);

void Avalia_Posfix(char E[], Tipo *R);

#endif
