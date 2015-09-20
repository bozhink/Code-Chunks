#include <stdio.h>
#include <stdlib.h>
void main(int argc, char *argv[]) {
    int i, j, N = atoi(argv[1]);
    int *a = malloc(N*sizeof(int));
    if (a==NULL) {
        perror("Not enough memory");
    }
    for (i=2; i<N; i++) a[i]=1;
    for (i=2; i<N; i++)
        if (a[i])
            for (j=i; i*j < N; j++) a[i*j] = 0;
    for (i=2; i<N; i++)
        if (a[i]) printf("%4d ",i);
    printf("\n");
}

