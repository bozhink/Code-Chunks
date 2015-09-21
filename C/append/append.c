#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    if (argc < 3 )
    {
        printf("Usage: ...\n");
        return 1;
    }
    
    int ierr;
    FILE *fp = fopen(argv[1],"a+");
    ierr = fprintf(fp, "%s\n", argv[2]);
    ierr = fclose(fp);
    return ierr;
}
