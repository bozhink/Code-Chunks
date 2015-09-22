#include <stdio.h>
#include <stdlib.h>

void main(void) {
    int N = 600;
    int i, r;
    double z = 0.976, zz = 1.0;
    double f = 0.0;
    srand(time(NULL));
    
    for (i = 0; i < N; i++) {
        r = 2 * (rand() % 2) - 1;
        zz *= z;
        f += r * zz;
        printf("%d %d %lf %lf\n", i, r, zz, f);
    }
}
