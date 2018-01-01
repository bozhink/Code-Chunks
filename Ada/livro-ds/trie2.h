// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte Trie2.h          

#ifndef TRIE
#define TRIE

#include <iostream.h>
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

class Trie
{
public:
	void Inicializa();
	void Insere(char K[], int Tag);
	int Consulta(char K[]);
	int Remove(char K[]);
	void Imprime(Elo R, char K[]);

	Elo Raiz;

};
#endif
