#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define MAXDIM 10

double det(double **a, int rank);

int main()
{
	int rank, i, j;
	double **a;
	double ddd;
	setrank:
	printf("Enter order of matrix : "); scanf("%d", &rank);
	if(rank > MAXDIM)
	{
		printf("No way! Try again.\n");
		goto setrank;
	}

	a = malloc( rank*sizeof(double*) );
	for (i=0; i<rank; i++) a[i] = malloc( rank*sizeof(double) );	
	
	for (i=0; i<rank; i++) for (j=0; j<rank; j++)
	{
		printf("> (%d, %d) = ", i, j); scanf("%lf", &a[i][j]);
	}
	for (i=0; i<rank; i++)
	{
		for (j=0; j<rank; j++) printf("%9.3lf\t", a[i][j]);
		printf("\n");
	}

	ddd = det(a,rank);
	printf("Determinant is d = %lf\n", ddd);
	for (i=0;i<rank;i++) free(a[i]);
	free(a);
	return 0;
}

double det(double **a, int rank)
{
	int i, j, j1, j2, s, n=rank-1;
	double d;
	double **b = NULL;

	if (rank < 1) return 0.0;
	else if (rank == 1) return a[0][0];
	else if (rank == 2) return a[0][0] * a[1][1] - a[1][0] * a[0][1];
	else
	{
	d = 0.0;
	for (j1=0; j1<rank; j1++)
	{
		b = malloc( n*sizeof(double *) );
		for (i=0; i<n; i ++) b[i] = malloc( n*sizeof(double) );
		for (i=1; i<rank; i++)
		{
			j2 = 0;
			for (j=0; j<rank; j++)
			{
				if (j == j1) continue;
				b[i-1][j2] = a[i][j];
				j2++;
			}
		}
		if( j1%2 == 0 ) s = 1; else s = -1;
		d += ( (double) s ) * a[0][j1] * det(b,n);
		for (i=0;i<n;i++) free(b[i]);
		free(b);
	}
	}
	return d;
}


