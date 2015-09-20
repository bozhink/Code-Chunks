#include <stdio.h>
#include <stdlib.h>

void main (int argc, char*argv[]) {
    int a, b, max, min;
        
    if (argc < 2) {
        printf("Usage: %s <number 1> <number 2>\n", argv[0]);
        return;
    }
    a = atoi(argv[1]);
    b = atoi(argv[2]);
    max = a - ((a-b)&((a-b)>>31));
    min = a + ((b-a)&((b-a)>>31));
    printf("Maximal value: %d\n", max);
    printf("Minimal value: %d\n", min);
}

