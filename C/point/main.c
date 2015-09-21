#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define N 4

#include "point.h"

int main(int argc, char *argv[])
{
	double eps=1.0e-8;
	int i, isin;
	for(i=1; i<=N; i++)
	{
		printf("Enter X-coordinate of point #%d : ", i); scanf("%lf", &p[i].x);
		printf("Enter Y-coordinate of point #%d : ", i); scanf("%lf", &p[i].y);
	}
	printf("Enter X-coordinate of required point : "); scanf("%lf", &p[0].x);
	printf("Enter Y-coordinate of required point : "); scanf("%lf", &p[0].y);
	isin=IsIn(eps);
	if(isin==0) printf("Point (%lf, %lf) is not in\n", p[0].x, p[0].y);
	else printf("Point (%lf, %lf) is in\n", p[0].x, p[0].y);
	return 0;
}

