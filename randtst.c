#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void main(void) {
    int i;
    srand(time(NULL));
    
    for (i=0; i<10; i++) {
        printf("%d\n", rand());
    }
}

