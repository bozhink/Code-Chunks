/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte ListaSim.c      */

#include "ListaSim.h"

/* Algoritmo 5.1 */
void Inicializa(Elo *Ls)
{
	*Ls = NULL;
}


/* Algoritmo 5.2 */
void Insere_Esq(Elo *Ls, char D)
{
	Elo P;
 
	/* Aloca memória para um No com endereço inicial P */
	P = (Elo) calloc(1,sizeof(No)); 
	if (P == NULL) {
		printf("*** Faltou memoria: Insere_Esq.\n");
		exit(1); /* Termina a execução do programa */
		}

	P -> Link = *Ls;
	P -> Dado = D;
	*Ls       = P;
}


/* Algoritmo 5.3 */
void Insere_Dir(Elo *Ls, char D)
{
	Elo P, Q;
                                                                 
	/* Aloca memória para um No com endereço inicial P */                                                                 
	P = (Elo) calloc(1,sizeof(No));
	if (P == NULL)  {
		printf("*** Faltou memoria: Insere_Dir.\n");
		exit(1); /* Termina a execução do programa */
		}

	P -> Dado = D;
	P -> Link = NULL;		
	if (*Ls == NULL)
		*Ls = P;
	else {
		Q = *Ls;
		while (Q != NULL) 
			if (Q -> Link == NULL) {
				Q -> Link = P;
				Q         = NULL;
				}
			else
				Q = Q -> Link;
		}
}


/* Algoritmo 5.4 */
void Insere_Dir_No(Elo Q, char D)
{
	Elo P;
	
	/* Aloca memória para um No com endereço inicial P */                                                                 
	P = (Elo) calloc(1,sizeof(No));
	if (P == NULL)  {
		printf("*** Faltou memoria: Insere_Dir_No.\n");
		exit(1); /* Termina a execução do programa */
		}

	P -> Dado = D;
	P -> Link = Q -> Link;
	Q -> Link = P;
}	


/* Algoritmo 5.5 */
void Retira_Esq(Elo *Ls, char *R)
{
	Elo P;
	
	if (*Ls == NULL)  {
		printf("*** A lista esta vazia: Retira_Esq.\n");
		exit(1); /* Termina a execução do programa */
		}
	
	*R  = (*Ls) -> Dado;
	P   = *Ls;
	*Ls = (*Ls) -> Link;
	free(P); /* Libera a memória do nó referenciado por P */
}


/* Algoritmo 5.6 */
void Retira_Dir(Elo *Ls, char *R)
{
	Elo P, Q;

	if (*Ls == NULL)  {
		printf("*** A lista esta vazia: Retira_Dir.\n");
		exit(1); /* Termina a execução do programa */
		}
	Q = *Ls;
	if ((*Ls) -> Link == NULL) 
		 /* A lista tem apenas um nó e agora está vazia */
		 *Ls = NULL;           
	else {
		while (Q -> Link != NULL) {
			P = Q;
			Q = Q -> Link;
			}	
		Q         = P -> Link;
		P -> Link = NULL;
		}                
	*R = Q -> Dado;
	free(Q);
}


/* Algoritmo 5.7 */
void Retira_No(Elo *Ls, Elo Q, char *R)
{
	Elo P;
	

	if (*Ls == Q)
		*Ls = Q -> Link; /* Q é o primeiro nó na lista */	
	else {	/* Faz o nó antecessor a Q apontar para o sucessor de Q */
		P = *Ls; 
		while (P != NULL) 
			if (P -> Link == Q) {
				P -> Link = Q -> Link;
				P         = NULL;
				}
			else
				P = P -> Link;
		}
	*R = Q -> Dado;
	free(Q);
}


/* Algoritmo 5.8 */
Elo Consulta(Elo Ls, char D)
{
	Elo P;
	
	P = Ls;
	while (P != NULL)
		if (P -> Dado == D)	
			break;
		else
			P = P -> Link;

	return P;
}


void Exibe_Lista(Elo Ls, char Msg[])
{
	Elo P;

	P = Ls;
	printf("%s: ", Msg);
	while (P != NULL) {
		putchar(P -> Dado);
		P = P -> Link;
		}
	putchar('\n');
}
