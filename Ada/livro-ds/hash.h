/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte Hash.h          */

#ifndef HASH
#define HASH

#include <stdio.h>
#include <string.h>
#include <process.h>
#include <ctype.h>                            

#ifndef TRUE
#define TRUE 1
#endif

#ifndef FALSE
#define FALSE 0
#endif

#define Tamanho_Chave  14
#define Tamanho_Tabela 81
#define Valor_Hash     19

typedef struct {
	char Id[Tamanho_Chave+1];
	int  Tag;
	int  Next;
	} Rec_Tabela;

typedef struct {
	int        N;
	int        Livre;
	int        Bucket[Valor_Hash];
	Rec_Tabela Tab[Tamanho_Tabela];
	} Tabela;

void Inicializa(Tabela *T);
int Hash(char K[]);
void Insere_Tab(Tabela *T, char K[], int Tag, int Colide, int *B);
int Consulta(Tabela T, char K[]);
void Remove(Tabela *T, char K[], int *R);
void Insere(Tabela *T, char K[], int Tag);
int Quantidade(Tabela T);
void Imprime(Tabela T);

#endif