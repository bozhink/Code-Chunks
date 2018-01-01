/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte FilaC.C         */

#include "filac.h"

/* Implementa‡ao do algor¡tmo 4.4 */
void Inicializa(Fila *F)
{
	F -> Inicio  = 0;
	F -> Fim     = -1;
	F -> Tamanho = 0;
} /* Inicializa */

/* Implementa‡ao do algor¡tmo 4.5 */
void Queue(Fila *F, char D)  
{
	if (F -> Tamanho == Max) /* Verifica overflow de fila circular */
		printf("*** Overflow na Fila ***\n");
	else {
		F -> Fim        = (F -> Fim + 1) % Max;
		F -> Q[F -> Fim = D;
		F -> Tamanho    += 1;
		}
} /* Queue */

/* Implementa‡ao do algor¡tmo 4.6 */
void DeQueue(Fila *Fm, char *R)
{
	if (F -> Tamanho == 0) { /* Verifica underflow de fila circular */
		printf("*** Underflow na Fila ***\n");
		*R = '?';
		}
	else  {
		*R            = F -> Q[F -> Inicio];
		F -> Inicio   = (F -> Inicio + 1) % Max;
		F -> Tamanho -= 1;
		}
} /* DeQueue */
 
