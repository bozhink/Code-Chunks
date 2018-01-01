/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte MergePV.h       */

#ifndef MERGEPV
#define MERGEPV
                            
#include <io.h>
#include <stdio.h>
#include <conio.h>
#include <direct.h>
#include <stdlib.h>       
#include <ctype.h>

#define N           (26 * 26)
#define P           4
#define M           (N / P)                      
#define NOME_SIZE   2

#define Entrada "A.DAT"
#define Saida   "A2.DAT"

typedef struct {
	char  Nome[NOME_SIZE+1];
	int   Idade;
	float Salario;
	} Data;

typedef struct {
	char Chave[NOME_SIZE+1];
	int  Tag;
	} Rec;


/* Descritor de cada Via */
typedef struct {
	Rec  R;        /* Buffer para merge */
	FILE *F;       /* Descritor do arquivo */
	int  n;        /* Número de registros da via */
	char Fn[7];    /* Nome externo do arquivo */
	int  Fim;      /* TRUE se encontrou EOF */
	} Via;   

void Merge_P_Vias(char A[], char A2[]);

#endif
