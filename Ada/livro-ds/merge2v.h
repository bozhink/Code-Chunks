/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte Merge2v.h       */

#ifndef MERGE2V
#define MERGE2V
                            
#include <io.h>
#include <stdio.h>
#include <conio.h>
#include <direct.h>
#include <stdlib.h>       
#include <ctype.h>

#define N           (26 * 26)
#define M           (N / 2)                      
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

void Merge_Duas_Vias(char A[], char A2[]);

#endif
