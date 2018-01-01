/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte GrafoV.h        */

#ifndef GRAFOV
#define GRAFOV

#include "GrafoDV.h"
#include <stdio.h>


void Inicializa(Grafo (G));
void Conecta(Grafo (G), int I, int J, Tipo_Dado V);
void Desconecta(Grafo (G), int I, int J);
Tipo_Dado Adjacente(Grafo (G), int I, int J);
void Imprime(Grafo (G));
void Menores_Custos(Grafo (G), Grafo (C));
void Gera_Caminhos(Grafo (G), Grafo (P));
void Exibe_Caminho(Grafo (P), int I, int J, int F);
void Menor_Caminho(Grafo (G), int I, int J);
void Gera_Conectividade(Grafo (G), Grafo (Cd));
Tipo_Dado Centro(Grafo (G));

#endif
