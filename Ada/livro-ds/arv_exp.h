/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte Arv_Exp.h       */

#ifndef ARVORE_DE_EXPRESSAO
#define  ARVORE_DE_EXPRESSAO
                            
#include <stdio.h>
#include <malloc.h>
#include <process.h>
#include <string.h> 
                            
#define Key char

#ifndef TRUE
#define TRUE 1
#endif

#ifndef FALSE
#define FALSE 0
#endif

typedef struct no_arvore_de_expressao {
	struct no_arvore_de_expressao *Esq;	
	Key                            Op_Val;
	struct no_arvore_de_expressao *Dir;	
	struct no_arvore_de_expressao *Pai;	
	unsigned char                  P;
	} No, *Elo;

int Calcula(Elo R); /* Algoritmo 7.3 Modificado */
void Gera_Expressao(char *Exp, Elo *Raiz);
	
#endif
