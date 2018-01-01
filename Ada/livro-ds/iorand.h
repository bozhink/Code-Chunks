/* (C) 1996-1998, Arthur Vargas Lopes */
/* Arquivo fonte Iorand.h             */

#ifndef IOR_MODEL
#include <io.h>
#include <stdio.h>
#include <conio.h>
#include <direct.h>
#include <stdlib.h>       
#include <ctype.h>

#define IOR_MODEL   6   /*  30.000 registros */
#define IOR_MAX     (5000 * IOR_MODEL)
#define IOR_W       (sizeof(char) * 8)
#define IOR_POS(n)  ((n) / IOR_W)
#define IOR_BIT(n)  ((n) % IOR_W)
#define IOR_LEN     (IOR_MAX / IOR_W + 1)

typedef struct {
	char iordir[IOR_LEN];
	char *iori;
	int iorword
	   ,iorbit
	   ,iorsize
	   ;
	FILE *iorfp;
	char iorpass[36];
	char iorfn[257];
	} *IORPTR, IORSIZE;

int ior_testa(IORPTR x,long n);
long ior_first(IORPTR x);
long ior_next(IORPTR x,	long k);
void ior_liga(IORPTR x,long n);
void ior_desliga(IORPTR x,long n);
void ior_close(IORPTR x);
IORPTR ior_open(char *fn,char *i,int s);
IORPTR ior_init(char *fn,char *in,int s);
int ior_write(IORPTR x,long n);
int ior_read(IORPTR x,long n);
void ior_trace(char *s1, char *s2);

#endif
