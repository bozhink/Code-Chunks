/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte GrafoA.h        */

#ifndef GRAFOA
#define GRAFOA

#ifndef TRUE
#define TRUE 1
#endif

#ifndef FALSE
#define FALSE 0
#endif

#include "GrafoDA.h"

#include <stdio.h>
#include <malloc.h>
#include <process.h>

typedef struct Grafo_A_Nodo {
		Tipo_Dado            Dado;
		struct Grafo_A_Nodo *Link;
		} Nodo, *Elo, *Grafo[N];

void Inicializa(Grafo G);
void Conecta(Grafo G, Tipo_Dado I, Tipo_Dado J);
void Desconecta(Grafo G, Tipo_Dado I, Tipo_Dado J);
int Adjacente(Grafo G, Tipo_Dado I, Tipo_Dado J);
void Libera_Memoria(Grafo G);
void Imprime(Grafo G);

#endif
