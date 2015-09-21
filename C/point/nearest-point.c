#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "Point.h"
#include "rnd.h"


main(int argc, char*argv[])
{
	float d=atof(argv[2]);
	int i, j, cnt=0, N=atoi(argv[1]);
	point *a = malloc( N*(sizeof(*a)) );
	for(i=0; i<N; i++)
	{
		a[i].x = randFloat(); a[i].y = randFloat();
	}
	for(i=0; i<N; i++) for(j=i+1; j<N; j++) if( distance( a[i], a[j] ) < d) cnt++;
	printf("%d отсечки по-къси от %f\n", cnt, d);
}

