#include "point.h"
#include <stdio.h>

double Distance(i1, i2)
int i1, i2;
{
	double x=p[i1].x - p[i2].x;
	double y=p[i1].y - p[i2].y;
	return sqrt(x*x+y*y);
}

double TriangleArea(i1, i2,i3)
int i1, i2, i3;
{
	double hp=0.5;
	double a=Distance(i1,i2);
	double b=Distance(i2,i3);
	double c=Distance(i3,i1);
	hp*=(a+b+c);
	return sqrt( hp*(hp-a)*(hp-b)*(hp-c) );
}

int IsIn(double eps)
{
	double s1=0.0, s2=0.0;
	int i;
	for(i=1; i<N; i++) s1 += TriangleArea(0, i, i+1);
	s1 += TriangleArea(0,N,1);
	for(i=2; i<N; i++) s2 += TriangleArea(1, i, i+1);
	printf("%f %f\n", s1,s2);
	if( fabs(s1-s2) < eps ) return 1;
	else return 0;
}

