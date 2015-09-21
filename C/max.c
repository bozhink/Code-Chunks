#include "stdio.h"
#include "stdlib.h"

void main(void) {
    int a;
    int b;
    printf("Enter value for a: ");
    scanf("%d",&a);
    printf("Enter value for b: ");
    scanf("%d",&b);
    a -= ((a-b)&((a-b)>>31));
    printf("Maximal value is %d\n",a);
}

