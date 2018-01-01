// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte ArvoreB2.h       

#ifndef ARVORE_B
#define ARVORE_B

#include <iostream.h>
#include <malloc.h>
#include <process.h>
#include <string.h> 
                            
#ifndef TRUE
#define TRUE 1
#endif

#ifndef FALSE
#define FALSE 0
#endif

#define T     2
#define Keys  (2 * T - 1)
#define Sons  (2 * T)

#define WLen  15

typedef struct Nodo_Ptr {
		short           N;
		char            Folha;
		struct Nodo_Ptr *C[Sons];
		char            Chave[Keys][WLen+1];
		int             Tag[Keys];
		char            Status[Keys];
		}  No, *Elo;

class Arvore_B
{
public:
	void Inicializa();
	void Insere(Elo *Ra, char K[], int Tag);
	int Consulta(Elo R, char K[]);
	int Remove(Elo R, char K[]);
	void Squash();
	void Conta(Elo R, int *Deletados, int *Ativos);
	void Imprime(Elo Ra);

	Elo Raiz;

private:

	void Init_C(Elo X);
	void Divide_Filho(Elo X, int I, Elo Y);
	void Insere_Nao_Cheio(Elo X, char K[], int Tag);
	int Consulta_Insere(Elo R, char K[], Elo *X);
	void Squash_2(Elo Ra, Elo *Nova);

};

#endif