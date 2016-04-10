/* 
 * File:   main.c
 * Author: bozhin
 *
 * Created on January 11, 2013, 10:05 AM
 */

#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

/*
 * 
 */
int main(int argc, char** argv) {
#pragma omp parallel
    printf("Hello from thread %d, nthreads %d\n",
            omp_get_thread_num(), omp_get_num_threads());
    return (EXIT_SUCCESS);
}

