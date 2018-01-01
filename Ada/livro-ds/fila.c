/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte Fila.C          */

#include "fila.h"


/* Implementa��o do algor�tmo 4.1 */
void Inicializa(Fila *F)
{
	F -> Inicio = 1;
	F -> Fim    = 0;
} /* Inicializa */

/* Implementa��o do algor�tmo 4.2 */
void Queue(Fila *F, char D) 
{
	if (F -> Fim ==  (Max - 1)) /* Verifica overflow de Fila */
		printf("*** Overflow na Fila ***\n");
	else {
		F -> Fim        += 1;
		F -> Q[F -> Fim - 1] = D;
		}
} /* Queue */

/* Implementa��o do algor�tmo 4.3 */
void DeQueue(Fila *F, char *R)
{
	if (F -> Inicio > F -> Fim) { /* Verifica underflow de Fila */
		printf("*** Underflow na Fila ***\n");
		*R = '?';    
		}
	else  
		*R = F -> Q[F -> Inicio++ - 1];
} /* DeQueue */
 
