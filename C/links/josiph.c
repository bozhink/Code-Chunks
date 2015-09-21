#include <stdio.h>
#include <stdlib.h>
#include "./inc/josiph.h"
#include "./inc/link.h"

main(int argc, char *argv[])
{
	int i, N=atoi(argv[1]), M=atoi(argv[2]);
	link t = malloc(sizeof *t);
	link z = malloc(sizeof *z);
	link x=t;
	t->item = 1;
	t->next = t;
	for (i=2; i<N; i++)
	{
		x = ( x->next = malloc(sizeof *x) );
		x->item = i;
		x->next = t;
	}
	while (x != x->next)
	{
		for (i=1; i<M; i++) x = x->next;
		z = x->next; x->next = x->next->next; free(z); N--;
	}
	printf("%d\n",x->item);
	return 0;
}

