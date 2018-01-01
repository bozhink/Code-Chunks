// (C) 1999, Arthur Vargas Lopes
// Arquivo fonte Florest2.h

#ifndef FLORESTa
#define FLORESTa

#include <iostream.h>
#include <malloc.h>
#include <process.h>
#include <string.h> 
#include <io.h>
#include <sys/stat.h>
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
	char Status;  //  'I' em uso; 'D' = deletado
	char Len;
	char Key[WLEN+1];
	}  *TKPTR, TKSIZE;

typedef struct {
	FILE *Tfp;
	long Raiz[FLORESTA];
	int  Em_uso;
	int  Deletados;
	char Tfn[WFN+1];
	int Compacte;
	}  *Floresta, FlorestaSIZE;

class Florest
{
public:

	int Inicializa(char *Fn);
	int Abre(char *Fn);
	int Fecha();
	int Squash(char *Fn);
	long Consulta(char *K);
	int Remove(char *K);
	long Insere(char *K, long Tag);
	void Imprime();
	int Tempo_De_Compactar();

private:

	Floresta F;

	long Prepara(char *K, long Tag);
	long Seek(long O, int M);
	int Hash(char *S);
	int Le(TKPTR Nodo, long W);
	int Grava(TKPTR Nodo, long W);
	void Central(long K);
};

#endif
