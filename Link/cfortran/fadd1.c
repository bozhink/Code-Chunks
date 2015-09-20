#include <stdio.h>
#include <stdlib.h>
#define N 2
#pragma aux fadd "^"
void fadd(int*,int*,int*,int*);
#pragma aux matmul "^"
void matmul(int*,int*,int*,double[N][N],double[N][N],double[N][N]);

void main (void) {
    int x[N];
    int y[N];
    int z[N];
    int n=N;
    int i;
    double a[N][N], b[N][N], c[N][N];

    a[0][0]=0.0;
    a[0][1]=1.0;
    a[1][0]=1.0;
    a[1][1]=0.0;

    b[0][0]=0.0;
    b[0][1]=1.0;
    b[1][0]=1.0;
    b[1][1]=0.0;

    matmul(&n, &n, &n, a, b, c);
    printf("[ %3.1lf, %3.1lf ]\n[ %3.1lf, %3.1lf ]\n", c[0][0], c[0][1], c[1][0], c[1][1]);
    
    for (i=0; i<N; i++) {
        x[i]=i+2;
        y[i]=i;
    }
    fadd(&n,x,y,z);
    for (i=0;i<N;i++) {
        printf("%d + %d = %d\n",x[i],y[i],z[i]);
    }
}

