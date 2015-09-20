/*
 * file hiparallel.c
 * compilation:
 * gcc -fopenmp hiparallel.c -o hello
 */

#include <stdio.h>

int main(void) {
	#pragma omp parallel
	printf("Hello, world.\n");
	return 0;
}
