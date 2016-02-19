#include "Point.h"
#include <math.h>


float distance(a, b)
point a, b;
{
	float x = a.x - b.x;
	float y = a.y - b.y;
	return sqrt(x*x+y*y);
}

