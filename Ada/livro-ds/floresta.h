/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte Floresta.h      */

#ifndef FLORESTa
#define FLORESTa

#include <malloc.h>
#include <process.h>
#include <string.h> 
#include <io.h>
#include <stdio.h>
#include <conio.h>
#include <direct.h>
#include <stdlib.h>       
#include <ctype.h>

#define FLORESTA	256

#define WLEN		30
#define WFN			256

#define TREESIZE  ((sizeof(TKSIZE) - WLEN - 1))

typedef struct {
	long LLink , RLink, Tag;
	char Status;  /*  'I' em uso; 'D' = deletado */
	char Len;
	char Key[WLEN+1];
	}  *TKPTR, TKSIZE;

typedef struct {
	FILE *Tfp;
	long Raiz[FLORESTA];
	int  Em_uso;
	int  Deletados;
	int  Compacte;
	char Tfn[WFN+1];
	}  *Floresta, FlorestaSIZE;

Floresta Inicializa(char Fn[]);
Floresta Abre(char Fn[]);
int Fecha(Floresta F);
int Squash(char Fn[]);
long Consulta(Floresta F, char *K);
int Remove(Floresta F, char *K);
long Insere(Floresta F, char *K, long Tag);
void Imprime(Floresta F);
int Tempo_De_Compactar(Floresta F);
long Prepara(Floresta F, char *K, long Tag);
long Seek(Floresta F, long O, int M);
int Hash(char *S);
int Le(Floresta F, TKPTR Nodo, long W);
int Grava(Floresta F, TKPTR Nodo, long W);
void Central(Floresta F, long K);

#endif
