/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte Trie.h          */

#ifndef TRIE
#define TRIE

#include <stdio.h>
#include <string.h>
#include <malloc.h>
#include <process.h>
#include <ctype.h>                            

#ifndef TRUE
#define TRUE 1
#endif

#ifndef FALSE
#define FALSE 0
#endif

#define Max   27

typedef struct Nodo_Ptr {
		struct Nodo_Ptr *C[Max];
		int             Tag;
		}  No, *Elo;

Elo Inicializa();
void Insere(Elo R, char K[], int Tag);
int Consulta(Elo R, char K[]);
int Remove(Elo R, char K[]);
void Imprime(Elo R, char K[]);

#endif
