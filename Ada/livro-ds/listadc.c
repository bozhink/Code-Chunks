/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte ListaDC.c       */

#include "ListaDC.h"  
                   
/* Algoritmo 5.19 */
void Inicializa(Elo *Ld)
{
	*Ld = (Elo) calloc(1,sizeof(No));
	if (*Ld == NULL) {
		printf("*** Faltou memoria: Inicializa.\n");
		exit(1);
		}
	(*Ld) -> Esq  = *Ld;
	(*Ld) -> Dir  = *Ld;
	(*Ld) -> Dado = 'D';
}


/* Algoritmo 5.20 */
void Insere_Esq(Elo Ld, Tipo_Dado D)
{
	Elo P;

	P = (Elo) calloc(1,sizeof(No));
	if (P == NULL) {
		printf("*** Faltou memoria: Insere_Esq.\n");
		exit(1);
		}
		
	P -> Dir         = Ld -> Dir;
	P -> Esq         = Ld;
	Ld -> Dir -> Esq = P;
	Ld -> Dir        = P;
	P -> Dado        = D;
}


/* Algoritmo 5.21 */
void Insere_Dir(Elo Ld, Tipo_Dado D)
{
	Elo P;

	P = (Elo) calloc(1,sizeof(No));
	if (P == NULL) {
		printf("*** Faltou memoria: Insere_Dir.\n");
		exit(1);
		}
		
	P -> Dado        = D;
	P -> Dir         = Ld;
	P -> Esq         = Ld -> Esq;
	Ld -> Esq -> Dir = P;
	Ld -> Esq        = P;
}


/* Algoritmo 5.22 */
void Insere_Dir_No(Elo Q, Tipo_Dado D) 
{
	Elo P;

	P = (Elo) calloc(1,sizeof(No));
	if (P == NULL) {
		printf("*** Faltou memoria: Insere_Dir_No.\n");
		exit(1);
		}
		
	P -> Dado       = D;
	P -> Dir        = Q -> Dir;
	P -> Esq        = Q;
	Q -> Dir -> Esq = P;
	Q -> Dir        = P;
}


/* Algoritmo 5.23 */
void Retira_Esq(Elo Ld,Tipo_Dado *R)
{
	Elo Q;

	if (Ld == Ld -> Dir)  {
		printf("*** Operacao Invalida.\n");
		exit(1);
		}
	Q                = Ld -> Dir;
	*R               = Q -> Dado;
	Ld -> Dir -> Esq = Ld;
	Ld -> Dir        = Ld -> Dir -> Dir;
	free(Q);
}


/* Algoritmo 5.24 */
void Retira_Dir(Elo Ld, Tipo_Dado *R)
{
	Elo Q;

	if (Ld == Ld -> Dir)  {
		printf("*** Operacao Invalida.\n");
		exit(1);
		}
	Q               = Ld -> Esq;
	*R              = Q -> Dado;
	Q -> Dir -> Esq = Q -> Esq;
	Q -> Esq -> Dir = Q -> Dir;
	free(Q);
}


/* Algoritmo 5.25 */
void Retira_No(Elo Ld, Elo Q, Tipo_Dado *R)
{
	*R              = Q -> Dado;
	Q -> Dir -> Esq = Q -> Esq;
	Q -> Esq -> Dir = Q -> Dir;
	free(Q);
}


/* Algoritmo 5.26 */
Elo Consulta(Elo Ld, Tipo_Dado D)
{
	Elo P;

	P = Ld -> Dir;
	while (P != Ld) 
		if (P -> Dado == D)
			break;
		else
			P = P -> Dir;
	return P;
}

/* Algoritmo 5.27 */
void Libera_Memoria(Elo *Ld)
{
	Elo P, Q;

	P = *Ld -> Dir;
	while (P != Ld) {
		Q = P;
		P = P -> Dir;
		free(Q);
		}
	free(*Ld);
	*Ld = NULL;
}

		
void Exibe_Lista(Elo Ld, char *Msg)
{
	Elo P;

	P = Ld -> Dir;
	printf("%s: ", Msg);
	while (P != Ld) {
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


