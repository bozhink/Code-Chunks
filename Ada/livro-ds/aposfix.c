/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte APosfix.c       */

#include "APosfix.h"

/* Implementação do algoritmo 3.1 */
void Inicializa(Pilha *P)
{
	P -> Sp = -1;
} /* Inicializa */

/* Implementação do algoritmo 3.2 */
void Push(Pilha *p, Tipo D)
{
	if (p -> Sp ==  (Max - 1)) { /* Verifica overflow de pilha */
		printf("*** Overflow na pilha ***\n");
		exit(1);
		}
	else {
		p -> Sp += 1;
		p -> V[p -> Sp] = D;
		}
} /* Push */

/* Implementação do algoritmo 3.3 */
void Pop(Pilha *p, Tipo *R)
{
	if (p -> Sp < 0) {  /* Verifica underflow de pilha */
		printf("*** Underflow na pilha ***\n");
		exit(1);
		}
	else  
		*R = p -> V[p -> Sp--];
} /* Pop */
 
/* Implementação do algoritmo 3.4 */
void Avalia_Posfix(char E[], Tipo *R)
{
	int   I;	            /* Auxilia no loop   */
	Pilha P;   	            /* Declara uma pilha */
	Tipo  Op1;
	Tipo  Op2;

	Inicializa(&P);
	for(I = 0; I < strlen(E); ++I) 
		if (isdigit(E[I]))
				Push(&P,E[I] - '0');
		else {
			Pop(&P,&Op1);
			Pop(&P,&Op2);
			switch (E[I]) {
				case '+' : 
						Push(&P,Op1 + Op2);
						break;
				case '-' : 
						Push(&P,Op1 - Op2);
						break;
				case '*' : 
						Push(&P,Op1 * Op2);
						break;
				case '/' : 
						Push(&P,Op1 / Op2);
						break;
				}
			}
		Pop(&P,R);
} /* Avalia_Posfix */
