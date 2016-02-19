#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define M 5
#define N 2

void fooc(double *);

int main(int argc, char *argv[])
{
	double *c[M*N];
	int i;
	fooc(c);
	for (i=0; i<M*N; i++) printf("...> %f\n", (*c)[i]);
	return 0;
}

void fooc(c)
double *c;
{
   c = (double*) malloc(M*N*sizeof(double));
   int i;
   for ( i =0 ; i < M*N ; i++) 
     (*c)[i] = sin(i); 
}

