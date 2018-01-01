// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte ListaDC2.CPP 

#include "ListaDC2.h"  
                   
// Algoritmo 5.19
ListaDuplaCircular::ListaDuplaCircular()
{
	Head = (Elo) calloc(1,sizeof(No));
	if (Head == NULL) {
		cout << "*** Faltou memoria: Construtor ListaDupla.\n";
		exit(1);
		}
	Head -> Esq  = Head;
	Head -> Dir  = Head;
	Head -> Dado = 'D';
}


// Algoritmo 5.20 
void ListaDuplaCircular::Insere_Esq(Tipo_Dado D)
{
	Elo P;

	P = (Elo) calloc(1,sizeof(No));
	if (P == NULL) {
		cout << "*** Faltou memoria: Insere_Esq.\n";
		exit(1);
		}
		
	P -> Dir           = Head -> Dir;
	P -> Esq           = Head;
	Head -> Dir -> Esq = P;
	Head -> Dir        = P;
	P -> Dado          = D;
}


// Algoritmo 5.21 
void ListaDuplaCircular::Insere_Dir(Tipo_Dado D)
{
	Elo P;

	P = (Elo) calloc(1,sizeof(No));
	if (P == NULL) {
		cout << "*** Faltou memoria: Insere_Dir.\n";
		exit(1);
		}
		
	P -> Dado          = D;
	P -> Dir           = Head;
	P -> Esq           = Head -> Esq;
	Head -> Esq -> Dir = P;
	Head -> Esq        = P;
}


// Algoritmo 5.22 
void ListaDuplaCircular::Insere_Dir_No(Elo Q, Tipo_Dado D) 
{
	Elo P;

	P = (Elo) calloc(1,sizeof(No));
	if (P == NULL) {
		cout << "*** Faltou memoria: Insere_Dir_No.\n";
		exit(1);
		}
		
	P -> Dado       = D;
	P -> Dir        = Q -> Dir;
	P -> Esq        = Q;
	Q -> Dir -> Esq = P;
	Q -> Dir        = P;
}


// Algoritmo 5.23 
void ListaDuplaCircular::Retira_Esq(Tipo_Dado *R)
{
	Elo Q;

	if (Head == Head -> Dir)  {
		cout << "*** Operacao Invalida.\n";
		exit(1);
		}

	Q                  = Head -> Dir;
	*R                 = Q -> Dado;
	Head -> Dir -> Esq = Head;
	Head -> Dir        = Head -> Dir -> Dir;
	free(Q);
}


// Algoritmo 5.24 
void ListaDuplaCircular::Retira_Dir(Tipo_Dado *R)
{
	Elo Q;

	if (Head == Head -> Dir)  {
		cout << "*** Operacao Invalida.\n";
		exit(1);
		}

	Q               = Head -> Esq;
	*R              = Q -> Dado;
	Q -> Dir -> Esq = Q -> Esq;
	Q -> Esq -> Dir = Q -> Dir;
	free(Q);
}


// Algoritmo 5.25
void ListaDuplaCircular::Retira_No(Elo Q, Tipo_Dado *R)
{
	*R              = Q -> Dado;
	Q -> Dir -> Esq = Q -> Esq;
	Q -> Esq -> Dir = Q -> Dir;
	free(Q);
}


// Algoritmo 5.26 
Elo ListaDuplaCircular::Consulta(Tipo_Dado D)
{
	Elo P;

	P = Head -> Dir;
	while (P != Head) 
		if (P -> Dado == D)
			break;
		else
			P = P -> Dir;
	return P;
}

		
// Algoritmo 5.27 
void Libera_Memoria()
{
	Elo P, Q;

	P = Head -> Dir;
	while (P != Ld) {
		Q = P;
		P = P -> Dir;
		free(Q);
		}
	free(Head);
	Head = NULL;
}


void ListaDuplaCircular::Exibe_Lista(char *Msg)
{
	Elo P;

	P = Head -> Dir;
	cout << Msg << ": ";
	while (P != Head) {
		cout << P -> Dado;
		P = P -> Dir;
		}
	
	cout << "\n";
}
			
