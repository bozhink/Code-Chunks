#include "stdio.h"
#include "stdlib.h"

void main(void) {
    int a;
    int b;
    int min, max;
    printf("Enter value for a: ");
    scanf("%d",&a);
    printf("Enter value for b: ");
    scanf("%d",&b);

    max = a - ((a-b)&((a-b)>>31));
    min = a + ((b-a)&((b-a)>>31));
    printf("Maximal value is %d\n", max);
    printf("Minimal value is %d\n", min);
}

