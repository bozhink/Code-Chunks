// (C) 1999, Arthur Vargas Lopes
// Arquivo fonte ListaD2.CPP 

#include "ListaD2.h"  
#include <malloc.h>
#include <malloc.h>
                   
// Algoritmo 5.10 
ListaDupla::ListaDupla()
{
	Head = NULL;
}


// Algoritmo 5.11 
void ListaDupla::Insere_Esq(Tipo_Dado D)
{
	Elo P;

	P = (Elo) calloc(1,sizeof(No));
	if (P == NULL) {
		cout << "*** Faltou memoria: Insere_Esq.\n";
		exit(1);
		}
		
	if (Head != NULL) 
		(Head) -> Esq = P;

	P -> Dado = D;
	P -> Esq  = NULL;
	P -> Dir  = Head;
	Head       = P;
}


// Algoritmo 5.12 
void ListaDupla::Insere_Dir(Tipo_Dado D)
{
	Elo P;
	Elo Q;

	P = (Elo) calloc(1,sizeof(No));
	if (P == NULL) {
		cout << "*** Faltou memoria: Insere_Dir.\n";
		exit(1);
		}
		
	P -> Dado = D;
	P -> Dir  = NULL;
	if (Head == NULL) {
		Head       = P;
		P -> Esq  = NULL; 
		}
	else  {
		Q = Head;
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


// Algoritmo 5.13 
void ListaDupla::Insere_Dir_No(Elo Q, Tipo_Dado D) 
{
	Elo P;

	P = (Elo) calloc(1,sizeof(No));
	if (P == NULL) {
		cout << "*** Faltou memoria: Insere_Dir_No.\n";
		exit(1);
		}
		
	P -> Dado = D;
	P -> Dir  = Q -> Dir;
	if (Q -> Dir != NULL)
		Q -> Dir -> Esq = P;

	P -> Esq = Q;
	Q -> Dir = P;
}


// Algoritmo 5.14 
void ListaDupla::Retira_Esq(Tipo_Dado *R)
{
	Elo Q;

	if (Head == NULL)  {
		cout << "*** Operacao Invalida.\n";
		exit(1);
		}

	Q   = Head;
	*R  = Q -> Dado;
	Head = Q -> Dir;
	if (Head != NULL)
		(Head) -> Esq = NULL;

	free(Q);
}


// Algoritmo 5.15 
void ListaDupla::Retira_Dir(Tipo_Dado *R)
{
	Elo P;
	Elo Q;

	if (Head == NULL)  {
		cout << "*** Operacao Invalida.\n";
		exit(1);
		}

	Q = Head;
	if (Q -> Dir == NULL)
		Head = NULL;
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


// Algoritmo 5.16
void ListaDupla::Retira_No(Elo Q, Tipo_Dado *R)
{

	if (Head == Q) {
		Head = Q -> Dir;
		if (Head != NULL)
			(Head) -> Esq = NULL;
		}
	else  {
		Q -> Esq -> Dir = Q -> Dir;
		if (Q -> Dir != NULL)
			Q -> Dir -> Esq = Q -> Esq;
		}	

	*R = Q -> Dado;
	free(Q);
}


// Algoritmo 5.17 
Elo ListaDupla::Consulta(Tipo_Dado D)
{
	Elo P;

	P = Head;
	while (P != NULL) 
		if (P -> Dado == D)
			break;
		else
			P = P -> Dir;
	return P;
}

// Algoritmo 5.17 
void ListaDupla::Libera_Memoria()
	Elo P, Q;

	P = Head;
	while (P != NULL) {
		Q = P;
		P = P -> Dir;
		free(Q);
		}
	Head = NULL;
}
		
void ListaDupla::Exibe_Lista(char *Msg)
{
	Elo P;

	P = Head;
	cout << Msg << ": ";
	while (P != NULL) {
		cout << P -> Dado;
		P = P -> Dir;
		}
	
	cout << "\n";
}
			
