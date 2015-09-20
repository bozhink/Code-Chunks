#include <stdio.h>
#include <stdlib.h>

void correl_(int*n);

int main(int argc, char**argv)
{
    if (argc<2)
    {
        printf("Usage: %s <number-of-data-points>\n",argv[0]);
        return 1;
    }
    int n = atoi(argv[1]);
    correl_(&n);
}
