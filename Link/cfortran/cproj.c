#include <stdio.h>
#include <stdlib.h>

#pragma message ("assuming 32-bit compile" );

int add(int,int);

void main(void) {
    int x=1, y=2;
    printf("%d + %d = %d\n",x, y, add(x,y));
}

int add(int a, int b) {
    return a+b;
}
