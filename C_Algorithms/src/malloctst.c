#include <stdio.h>
#include <stdlib.h>
#define N 100000000

void main(void) {
    int *a;
    char c;
    int i;
    a = malloc(N*sizeof(int));
    for (i=0; i<N; i++) a[i]=0;
    c = getchar();
    //free(a);
    for (i=N-1; i>=0; i--) free(a[i]);
    c = getchar();
}

