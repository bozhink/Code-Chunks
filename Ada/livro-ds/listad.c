/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte ListaD.c        */

#include "ListaD.h"  
                   
/* Algoritmo 5.10 */
void Inicializa(Elo *Ld)
{
	*Ld = NULL;
}


/* Algoritmo 5.11 */
void Insere_Esq(Elo *Ld, Tipo_Dado D)
{
	Elo P;

	P = (Elo) calloc(1,sizeof(No));
	if (P == NULL) {
		printf("*** Faltou memoria: Insere_Esq.\n");
		exit(1);
		}
		
	if (*Ld != NULL) 
		(*Ld) -> Esq = P;

	P -> Dado = D;
	P -> Esq  = NULL;
	P -> Dir  = *Ld;
	*Ld       = P;
}


/* Algoritmo 5.12 */
void Insere_Dir(Elo *Ld, Tipo_Dado D)
{
	Elo P;
	Elo Q;

	P = (Elo) calloc(1,sizeof(No));
	if (P == NULL) {
		printf("*** Faltou memoria: Insere_Dir.\n");
		exit(1);
		}
		
	P -> Dado = D;
	P -> Dir  = NULL;
	if (*Ld == NULL)     {
		*Ld       = P;
		P -> Esq  = NULL; 
		}
	else  {
		Q = *Ld;
		while (Q != NULL)  
			if (Q -> Dir == NULL) {
				Q -> Dir = P;
				P -> Esq = Q;
				Q        = NULL;
				}
			else
				Q = Q -> Dir;
		}
}


/* Algoritmo 5.13 */
void Insere_Dir_No(Elo Q, Tipo_Dado D) 
{
	Elo P;

	P = (Elo) calloc(1,sizeof(No));
	if (P == NULL) {
		printf("*** Faltou memoria: Insere_Dir_No.\n");
		exit(1);
		}
		
	P -> Dado = D;
	P -> Dir  = Q -> Dir;
	if (Q -> Dir != NULL)
		Q -> Dir -> Esq = P;

	P -> Esq = Q;
	Q -> Dir = P;
}


/* Algoritmo 5.14 */
void Retira_Esq(Elo *Ld,Tipo_Dado *R)
{
	Elo Q;

	if (*Ld == NULL)  {
		printf("*** Operacao Invalida.\n");
		exit(1);
		}

	Q   = *Ld;
	*R  = Q -> Dado;
	*Ld = Q -> Dir;
	if (*Ld != NULL)
		(*Ld) -> Esq = NULL;

	free(Q);
}


/* Algoritmo 5.15 */
void Retira_Dir(Elo *Ld, Tipo_Dado *R)
{
	Elo P;
	Elo Q;

	if (*Ld == NULL)  {
		printf("*** Operacao Invalida.\n");
		exit(1);
		}

	Q = *Ld;
	if (Q -> Dir == NULL)
		*Ld = NULL;
	else	
		while (Q -> Dir != NULL) {
			P = Q;
			Q = Q -> Dir;
			}
	Q        = P -> Dir;
	P -> Dir = NULL;
	*R       = Q -> Dado;
	free(Q);
}


/* Algoritmo 5.16 */
void Retira_No(Elo *Ld, Elo Q, Tipo_Dado *R)
{

	if (*Ld == Q) {
		*Ld = Q -> Dir;
		if (*Ld != NULL)
			(*Ld) -> Esq = NULL;
		}
	else  {
		Q -> Esq -> Dir = Q -> Dir;
		if (Q -> Dir != NULL)
			Q -> Dir -> Esq = Q -> Esq;
		}	

	*R = Q -> Dado;
	free(Q);
}


/* Algoritmo 5.17 */
Elo Consulta(Elo Ld, Tipo_Dado D)
{
	Elo P;

	P = Ld;
	while (P != NULL) 
		if (P -> Dado == D)
			break;
		else
			P = P -> Dir;
	return P;
}


/* Algoritmo 5.18 */
void Libera_Memoria(Elo *Ld)
{
	Elo P, Q;

	P = *Ld;
	while (P != NULL) {
		Q = P;
		P = P -> Dir;
		free(Q);
		}
	*Ld = NULL;
}

		
void Exibe_Lista(Elo Ld, char *Msg)
{
	Elo P;

	P = Ld;
	printf("%s: ", Msg);
	while (P != NULL) {
/* Retire os comentários para exibir o endereço de p e dos
   campos de link Esq e Dir  */
/*		printf("%10x", P);
		printf("%10x", P -> Esq);
		printf(" ");
*/
		printf("%c", P -> Dado);
		P = P -> Dir;
/*		printf("%10x", P); 
		printf("\n"); */
		}
	
	printf("\n");
}
			
