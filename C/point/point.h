#include <math.h>

#ifndef N
#define N 4
#endif

struct point
{
	double x;
	double y;
} p[N+1];

double Distance(int, int);
double TriangleArea(int, int, int);
int IsIn(double);

