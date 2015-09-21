#include <stdio.h>
#include <stdlib.h>

#define N 10
#define M 12

int *a, *b;

int main (int argc, char**argv) {
    int i;
    a = (int*) malloc(N*sizeof(int));
    b = (int*) malloc(M*sizeof(int));
    
    for (i=0; i<N; i++) a[i] = i;
    for (i=0; i<M; i++) b[i] = i*i;

    for (i=0; i<N; i++) printf("a[%d]=%d, ", i, a[i]); printf("\n\n");
    for (i=0; i<M; i++) printf("b[%d]=%d, ", i, b[i]); printf("\n\n");
    
    free(a);
    a=b;
    b = (int*) malloc(N*sizeof(int));
    for (i=0; i<N; i++) b[i] = 2*i+1;
    a[0]=11;
    for (i=0; i<M; i++) printf("a[%d]=%d, ", i, a[i]); printf("\n\n");
    for (i=0; i<M; i++) printf("b[%d]=%d, ", i, b[i]); printf("\n\n");
    
    free(b);
    return 0;
}

