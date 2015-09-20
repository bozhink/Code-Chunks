#include <stdio.h>
#include <stdlib.h>
#include "omp.h"
#define NTHREADS 4
static long numsteps = 10000000;
double step;
double sum[NTHREADS];
void dosum(int);

void main() {
    int id;
    double pi;
    for (id = 0; id < NTHREADS; id++)
        sum[id] = 0.0;
    step = 1.0 / (double) numsteps;
    
    omp_set_num_threads(NTHREADS);
#pragma omp parallel
{
    id = omp_get_thread_num();
    dosum(id);
}
    pi = 0.0;
    for (id = 0; id < NTHREADS; id++)
        pi += step * sum[id];
    
    printf("pi = %lf\n", pi);
}

void dosum(int id) {
    long left = id * numsteps / NTHREADS;
    long right = (id+1) * numsteps / NTHREADS;
    long i;
    double x;
    printf("Id = %d\n", id);
    for (i=left; i<right; i++) {
        x = ((double)i+0.5)*step;
        sum[id] += 4.0 / (1.0 + x*x);
    }
}

