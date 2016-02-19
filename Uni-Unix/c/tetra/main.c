/*
 * main.c
 *
 *  Created on: May 2, 2010
 *      Author: uni
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define N 4

typedef struct Point
{
	double x;
	double y;
} p[N], z;


double Distance(double [], double []);
double TriangleArea(double [], double [], double []);
int IsIn(double [], double [N][2]);

int main(int argc, char *argv[])
{
	double v[N][2];
	double x[2];
	v[0][0]=0.0; v[0][1]=0.0;
	v[1][0]=1.0; v[1][1]=0.0;
	v[2][0]=1.0; v[2][1]=1.0;
	v[3][0]=0.0; v[3][1]=1.0;
	x[0] = 0.5; x[1] = 0.5;
	printf("%d\n", IsIn(x,v));
	return 0;
}

double Distance(x1,x2)
double x1[], x2[];
{
	double xx = x1[1]-x2[1];
	double yy = x1[2]-x2[2];
	return sqrt(xx*xx+yy*yy);
}

double TriangleArea(x1,x2,x3)
double x1[], x2[], x3[];
{
	double p, a, b, c;
	a = Distance(x1, x2);
	b = Distance(x2, x3);
	c = Distance(x3, x1);
	p = (a+b+c)/2.0;
	a -= p;
	b -= p;
	c -= p;
	return sqrt(-p*a*b*c);
}

int IsIn(x, v)
double x[], v[N][2];
{
	int i;
	double s = 0.0;
	double eps = 1.0e-10;
	for (i=0; i<N-1; ) s += TriangleArea(x, v[i], v[++i]);
	s += TriangleArea(x, v[N-1], v[0]);
	for (i=1; i<N-1; ) s -= TriangleArea(v[0], v[i], v[++i]);
	s = fabs(s);
	if (s<eps) return 1;
	else return 0;
}




