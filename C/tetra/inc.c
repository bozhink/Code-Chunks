#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define M 5
#define N 2

void fooc(double [], double [], double*, int*, int*);

int main(int argc, char *argv[])
{
	int m=M, n=N;
	double a[M*N], c[M*N];
	double b=3.1415;
	int i;
	for (i=0; i<M*N; i++) a[i] = 0.1*i;
	fooc(c,a,&b,&m,&n);
	for (i=0; i<M*N; i++) printf("...> %f\n", c[i]);
	return 0;
}

void fooc(c,a,b,m,n)
double a[],*b,c[];
int *m,*n;
{
   int i;
   for ( i =0 ; i < (*m)*(*n) ; i++) 
     c[i] = sin(a[i]) + *b; 
}

