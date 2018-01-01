/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte GrafoS.h        */

#ifndef GRAFOS
#define GRAFOS

#ifndef TRUE
#define TRUE 1
#endif

#ifndef FALSE
#define FALSE 0
#endif

#include "GrafoDS.h"
#include <stdio.h>

void Inicializa(Grafo (G));
void Conecta(Grafo (G), int I, int J);
void Desconecta(Grafo (G), int I, int J);
int Adjacente(Grafo (G), int I, int J);
void Imprime(Grafo (G));

#endif
