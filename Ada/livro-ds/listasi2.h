// (C) 1999, Arthur Vargas Lopes
// Arquivo fonte ListaSi2.h

#ifndef LISTASIMPLES2
#define LISTASIMPLES2   

#include <stdio.h>
#include <iostream.h>
#include <malloc.h>
#include <process.h>	

typedef struct nodo_simples {
	char Dado;
	struct nodo_simples *Link;
	} No, *Elo;

class ListaSimples
{
public:
	ListaSimples();  // Construtor

	void Insere_Esq(char D);
	void Insere_Dir(char D);
	void Insere_Dir_No(Elo Q, char D);
	void Retira_Esq(char *R);
	void Retira_Dir(char *R);
	void Retira_No(Elo Q, char *R);
	Elo Consulta(char D);
	void Libera_Memoria();
	void Exibe_Lista(char Msg[]);

private:    
 	Elo Head;
};
#endif
