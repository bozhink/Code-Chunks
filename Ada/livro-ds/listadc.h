/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte ListaDC.h       */

#ifndef LISTA_DUPLA_CIRCULAR
#define LISTA_DUPLA_CIRCULAR

#include <stdio.h>
#include <process.h>
#include <malloc.h>

#define Tipo_Dado char

typedef struct Lista_Dupla {
	struct Lista_Dupla *Esq;
	Tipo_Dado           Dado;
	struct Lista_Dupla *Dir;		
	} No, *Elo;
		
void Inicializa(Elo *Ld);
void Insere_Esq(Elo Ld, Tipo_Dado D);	
void Insere_Dir(Elo Ld, Tipo_Dado D);	
void Insere_Dir_No(Elo Q, Tipo_Dado D);	
void Retira_Esq(Elo Ld, Tipo_Dado *R);	
void Retira_Dir(Elo Ld, Tipo_Dado *R);	
void Retira_No(Elo Ld,Elo Q, Tipo_Dado *R);	
Elo Consulta(Elo  Ld, Tipo_Dado D);	
void Libera_Memoria(Elo *Ld);
void Exibe_Lista(Elo Ld, char *Msg);
#endif
