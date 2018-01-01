// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte ListaDC2.h 

#ifndef LISTA_DUPLA_CIRCULAR
#define LISTA_DUPLA_CIRCULAR

#include <stdio.h>
#include <iostream.h>
#include <process.h>	
#include <malloc.h>

#define Tipo_Dado char

typedef struct Lista_Dupla {
	struct Lista_Dupla *Esq;
	Tipo_Dado           Dado;
	struct Lista_Dupla *Dir;		
	} No, *Elo;

class ListaDuplaCircular
{
public:
	ListaDuplaCircular();  // Construtor
	void Insere_Esq(char D);
	void Insere_Dir(char D);
	void Insere_Dir_No(Elo Q, char D);
	void Retira_Esq(char *R);
	void Retira_Dir(char *R);
	void Retira_No(Elo Q, char *R);
	Elo Consulta(char D);
	void Libera_Memoria();
	void Exibe_Lista(char *Msg);
private:    
 	Elo Head;
};
#endif


