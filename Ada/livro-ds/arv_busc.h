/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte Arv_Busc.h      */

#ifndef ARVORE_DE_BUSCA
#define  ARVORE_DE_BUSCA
                            
#include <stdio.h>
#include <malloc.h>
#include <process.h>
                            
#define Key char

#ifndef TRUE
#define TRUE 1
#endif

#ifndef FALSE
#define FALSE 0
#endif

typedef struct no_arvore_de_busca {
	struct no_arvore_de_busca *Esq;	
	Key                       Chave;
	struct no_arvore_de_busca *Dir;	
	struct no_arvore_de_busca *Pai;	
	} No, *Elo;
	
void Pre_Fixado(Elo R); 
void Central(Elo R); 
void Pos_Fixado(Elo R);
void Inicializa(Elo *R); 
void Insere(Elo *R, Key K); 
Elo Consulta(Elo R, Key K);
Elo Minimo(Elo R);
Elo Sucessor(Elo Quem);
void Remove(Elo *R, Elo Quem);

#endif
