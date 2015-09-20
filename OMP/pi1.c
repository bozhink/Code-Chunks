#include <stdio.h>
#include <stdlib.h>

static long numsteps = 100000;
double step;

void main() {
    int i;
    double x, pi, sum=0.0;
    step = 1.0 / (double) numsteps;

    for (i=0; i<numsteps; i++) {
        x = (i+0.5)*step;
        sum += 4.0 / (1.0 + x*x);
    }
    
    pi = step * sum;
    
    printf("pi = %lf\n", pi);
}

