// (C) 1999, Arthur Vargas Lopes
// Arquivo fonte ListaSi2.cpp

#include "listaSi2.h"


// Substitui Algoritmo 5.1
ListaSimples::ListaSimples()
{
	Head = NULL;
}
                     

// Algoritmo 5.2
void ListaSimples::Insere_Esq(char D)
{
	Elo P;
 
	// Aloca memória para um No com endereço inicial P
	P = (Elo) calloc(1,sizeof(No)); 
	if (P == NULL) {
		cout << "*** Faltou memoria: Insere_Esq.\n";
		exit(1); // Termina a execução do programa 
		}

	P -> Link = Head;
	P -> Dado = D;
	Head      = P;
}


// Algoritmo 5.3
void ListaSimples::Insere_Dir(char D)
{
	Elo P, Q;
                                                                 
	// Aloca memória para um No com endereço inicial P 
	P = (Elo) calloc(1,sizeof(No));
	if (P == NULL)  {
		cout << "*** Faltou memoria: Insere_Dir.\n";
		exit(1); // Termina a execução do programa
		}

	P -> Dado = D;
	P -> Link = NULL;		
	if (Head == NULL)
		Head = P;
	else {
		Q = Head;
		while (Q != NULL) 
			if (Q -> Link == NULL) {
				Q -> Link = P;
				Q         = NULL;
				}
			else
				Q = Q -> Link;
		}
}


// Algoritmo 5.4
void ListaSimples::Insere_Dir_No(Elo Q, char D)
{
	Elo P;
	
	// Aloca memória para um No com endereço inicial P 
	P = (Elo) calloc(1,sizeof(No));
	if (P == NULL)  {
		cout << "*** Faltou memoria: Insere_Dir_No.\n";
		exit(1); // Termina a execução do programa 
		}

	P -> Dado = D;
	P -> Link = Q -> Link;
	Q -> Link = P;
}	


// Algoritmo 5.5
void ListaSimples::Retira_Esq(char *R)
{
	Elo P;
	
	if (Head == NULL)  {
		cout << "*** A lista esta vazia: Retira_Esq.\n";
		exit(1); // Termina a execução do programa 
		}
	
	*R   = Head -> Dado;
	P    = Head;
	Head = Head -> Link;
	free(P); // Libera a memória do nó referenciado por P
}


// Algoritmo 5.6 
void ListaSimples::Retira_Dir(char *R)
{
	Elo P, Q;

	if (Head == NULL)  {
		cout << "*** A lista esta vazia: Retira_Dir.\n";
		exit(1); // Termina a execução do programa
		}
	Q = Head;
	if (Head -> Link == NULL) 
		 // A lista tem apenas um nó e agora está vazia
		 Head = NULL;           
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


// Algoritmo 5.7
void ListaSimples::Retira_No(Elo Q, char *R)
{
	Elo P;
	

	if (Head == Q)
		Head = Q -> Link; // Q é o primeiro nó na lista 
	else {	// Faz o nó antecessor a Q apontar para o sucessor de Q
		P = Head; 
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


// Algoritmo 5.8
Elo ListaSimples::Consulta(char D)
{
	Elo P;
	
	P = Head;
	while (P != NULL)
		if (P -> Dado == D)	
			break;
		else
			P = P -> Link;

	return P;
}

// Algoritmo 5.9
void ListaSimples::Libera_Memoria()
{
	Elo P, Q;

	P = Head;
	while (P != NULL) {
		Q = P;
		P = P -> Link;
		free(Q);
		}
	Head = NULL;
}

void ListaSimples::Exibe_Lista(char Msg[])
{
	Elo P;

	P = Head;
	cout << Msg << ": ";
	while (P != NULL) {
		cout << P -> Dado;
		P = P -> Link;
		}
	cout << '\n';
}
