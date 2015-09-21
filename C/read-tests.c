#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#define N 10
unsigned a[N][N];

void main(int argc, char**argv) {
    int fd; /* File Descriptor */
    char *fname; /* File name */
    int nbytes;
    int i, j;

    printf("%d\n", sizeof(a));

    if( argc < 2 ) {
        printf("Ussage: %s <file-name>\n", argv[0]);
        return;
    }

    fname = argv[1];
    fd = open(fname, O_RDONLY);
    if (fd == -1) perror("open");
    nbytes = read(fd, &a, sizeof(a));
    if (nbytes<=0) perror("read");

    printf("Readed bytes = %d\n", nbytes);

    printf("\n\n");

    for (i=0; i<N; i++) {
        printf("%d", a[i][0]%2);
        for (j=1; j<N; j++) {
            printf(" %d", a[i][j]%2);
        }
        printf("\n");
    }
    
    close(fd);
}

