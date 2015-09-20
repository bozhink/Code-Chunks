#include <stdio.h>
#include <stdlib.h>

#pragma aux padd "padd"

int padd(int,int);

void main(void) {
    int x=1;
    int y=2;
    printf("%d + %d = %d\n",x,y,padd(x,y));
}
