#include <stdio.h>
#include <stdlib.h>

#define N 4
#define M 2

void main(void) {
    int i, j;
    int *arr = (int*)malloc(N * M * sizeof(int));

    for (i = 0; i < N; ++i) {
        for (j = 0; j < M; ++j) {
            arr[M*i + j] = i;
        }
    }

    for (i = 0; i < N; ++i) {
        for (j = 0; j < M; ++j) {
            printf("%d ", arr[M*i + j]);
        }
    }

    printf("\n");

    for (i = 0; i < N * M; ++i) {
        printf("%d ", arr[i]);
    }
}
