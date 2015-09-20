#include <stdio.h>
#include <stdlib.h>

int fadd(int*,int*);

void main (void) {
    int x=1, y=2;
    printf("%d + %d = %d\n",x, y, fadd(&x,&y));
}
