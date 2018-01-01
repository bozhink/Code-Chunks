// (C) 1999, Arthur Vargas Lopes
// Arquivo fonte ListaD2.h 

#ifndef LISTA_DUPLA
#define LISTA_DUPLA

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

class ListaDupla
{
public:
	ListaDupla();  // Construtor
	void Insere_Esq(Tipo_Dado D);
	void Insere_Dir(Tipo_Dado D);
	void Insere_Dir_No(Elo Q, Tipo_Dado D);
	void Retira_Esq(Tipo_Dado *R);
	void Retira_Dir(Tipo_Dado *R);
	void Retira_No(Elo Q, Tipo_Dado *R);
	Elo Consulta(Tipo_Dado D);
	void Libera_Memoria();
	void Exibe_Lista(char *Msg);
private:    
 	Elo Head;
};
#endif


