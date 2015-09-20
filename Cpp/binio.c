#include <stdio.h>
#include <stdlib.h>
#define N 100000000

void main(void) {
	int*a;
	int i;
	char c;
	a = malloc(N*sizeof(int));
	for (i=0; i<N; i++) a[i]=0;
	c=getchar();
	printf("%d\n", sizeof(int));
	free(a);
	c=getchar();

}

