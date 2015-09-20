#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define N_SAMPLES 1000000000

void main(void) {
	srand(time(NULL));
	int tic, toc;
	int a, b;
	long i;
	tic=time(NULL);
	for (i=0; i<N_SAMPLES; i++) {
		a=rand();
		b=a;
	}
	toc=time(NULL);
	printf("Initialization time = %ds\n",toc-tic);

	tic=time(NULL);
	for (i=0; i<N_SAMPLES; i++) {
		a=rand();
		b=2*(a/2);
	}
	toc=time(NULL);
	printf("Algebraic time = %ds\n", toc-tic);
	printf("b = %d\n", b);

	tic=time(NULL);
	for (i=0; i<N_SAMPLES; i++) {
		a=rand();
		b=(a>>1)<<1;
	}
	toc=time(NULL);
	printf("Shift time = %ds\n",toc-tic);
	printf("b = %d\n", b);
}

