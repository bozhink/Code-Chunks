#include <stdio.h>
#include <stdlib.h>
#ifdef __unix__
#include <unistd.h>
#include <fcntl.h>
#endif
#include <time.h>

#define N 1000
#define NITER 1000*N
#define NSAMPLES 1
void dosrand();
unsigned long histogram[N];

int main(int argc, char**argv) {
    int i, j;
    for (i=0; i<N; i++) histogram[i] = 0;
    for (i=0; i<NITER; i++) {
        dosrand();
        for (j=0; j<NSAMPLES; j++) {
            histogram[rand() % N]++;
        }
    }
    for (i=0; i<N; i++) {
        printf("%d\t%ld\n", i, histogram[i]);
    }
    return 0;
}


/*
 * This method initializes the build-in pseudo-random generator
 */
void dosrand() {
#ifdef __unix__
#pragma message("dosrand() will be compiled for *nix operating system")
    int fd;
    unsigned seed;
    fd = open("/dev/urandom", O_RDONLY);
    if (fd==-1 || read(fd, &seed, sizeof(seed))<=0) {
        fprintf(stderr, "Critical error: Cannot open \"/dev/urandom\"\n");
        exit(2);
    }
    close(fd);
    srand(seed);
#else
#pragma message("dosrand() will be compiled for default operationg system")
    srand(time(NULL));
#endif
}

