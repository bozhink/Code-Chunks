/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte ListaSim.H      */

#ifndef LISTA_SIMPLES
#define LISTA_SIMPLES
#include <stdio.h>  
#include <malloc.h>
#include <process.h>	

typedef struct nodo_simples {
	char Dado;
	struct nodo_simples *Link;
	} No, *Elo;
	               
void Inicializa(Elo *Ls);
void Insere_Esq(Elo *Ls, char D);
void Insere_Dir(Elo *Ls, char D);
void Insere_Dir_No(Elo Q, char D);
void Retira_Esq(Elo *Ls, char *R);
void Retira_Dir(Elo *Ls, char *R);
void Retira_No(Elo *Ls, Elo Q, char *R);
Elo Consulta(Elo Ls, char D);
void Libera_Memoria(Elo *Ls);
void Exibe_Lista(Elo Ls, char Msg[]);
#endif
