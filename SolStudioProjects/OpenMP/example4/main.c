/* 
 * File:   main.c
 * Author: bozhin
 *
 * Created on January 11, 2013, 10:44 AM
 */
#include <omp.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define N 6000
int a[N*N];

/*
 * 
 */
int main(int argc, char** argv) {
    int i;
    double sum=0.0;
    srand(time(NULL));
#pragma omp parallel for
    for (i=0; i<N*N; i++) {
        a[i] = rand() % 2;
    }

    printf("Calculation of the sum:\n");
#pragma omp parallel for
    for (i=0; i<N*N; i++) {
            sum += a[i];
    }
    printf("Sum = %g\n", sum);

    return (EXIT_SUCCESS);
}

