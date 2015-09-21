#include "stdio.h"

int min(int, int);
int max(int, int);

void main(int argc, char**argv) {
    int x, y;
    if (argc < 3) {
        printf("Usage: %s <integer1> <integer2>\n", argv[0] );
        return;
    }
    x = atoi(argv[1]);
    y = atoi(argv[2]);
    printf("min(%d, %d) = %d\n", x, y, min(x, y));
    printf("max(%d, %d) = %d\n", x, y, max(x, y));
}

int min(int x, int y) {
    return y ^ ((x ^ y) & -(x < y));
}

int max(int x, int y) {
    return x ^ ((x ^ y) & -(x < y));
}
