/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte pilha.c         */

#include "pilha.h"

/* Implementação do algorítmo 3.1 */
void Inicializa(Pilha *P)
{
	P -> Sp = -1;
} /* Inicializa */

/* Implementação do algorítmo 3.2 */
void Push(Pilha *p, char D)
{
	if (p -> Sp ==  (Max - 1)) /* Verifica overflow de pilha */
		printf("*** Overflow na pilha ***\n");
	else {
		p -> Sp += 1;
		p -> V[p -> Sp] = D;
		}
} /* Push */

/* Implementação do algorítmo 3.3 */
void Pop(Pilha *p, char *R)
{
	if (p -> Sp < 0)   /* Verifica underflow de pilha */
		printf("*** Underflow na pilha ***\n");
	else  
		*R = p -> V[p -> Sp--];
} /* Pop */
 
