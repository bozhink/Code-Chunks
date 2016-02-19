/* 
 * File:   main.cpp
 * Author: bozhin
 *
 * Created on Събота, 2013, Март 30, 18:30
 */

#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#ifdef __unix__
#include <signal.h>
#include <unistd.h>
#include <fcntl.h>
#endif
#ifndef SANDPILE_PI_4_H
#include "sandpile_pi_4.h"
#endif /* SANDPILE_PI_4_H */
#include "omp.h"
#define NTHREADS 2
#define PERIOD 34359738352
#define Z 3
#define MU 2
#define ALPHA 2
#define L 6001

FILE*fp[NTHREADS];      /* Output file handler */

void dosrand();
#ifdef __unix__
static void on_intr (int catch_signal);
#endif
void s_thread(int, int);

/*
 * 
 */
int main(int argc, char** argv) {
    int id;
    dosrand();
    
    if (argc < 2+NTHREADS) {
        fprintf(stderr, "Usage: %s <N>", argv[0]);
        for (int i = 0; i < NTHREADS; i++) {
            fprintf(stderr, " <FN%d>",i+1);
        }
        fprintf(stderr, "\nWhere:\n");
        fprintf(stderr, "\t N  =  number of iterations\n");
        fprintf(stderr, "\tFN  =  output file name\n");
        exit(1);
    } else {
        bool opened = true;
        for (int i = 0; i < NTHREADS; i++) {
            fp[i] = fopen(argv[i+2], "a");
            if (!fp[i]) opened = false;
        }
        if (!opened) {
            fprintf(stderr, "%s: ERROR: Cannot open output files!\n", argv[0]);
            exit(2);
        }
    }
#ifdef __unix__
    if ((signal(SIGINT, on_intr) == SIG_ERR) ) {
        perror("signal");
        exit(5);
    }
#endif
    int N = atoi(argv[1]);  fprintf(stderr, "Number of iterations = %d\n", N);
    reset=0;
    
    omp_set_num_threads(NTHREADS);
#pragma omp parallel
{
        id = omp_get_thread_num();
        s_thread(id, N);
}
    /*
     * Closing all opened files
     */
    for (int i = 0; i < NTHREADS; i++) {
        fclose(fp[i]);
    }
    return 0;
}

/*
 * Initialization of the build-in pseudo-random generator
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

#ifdef __unix__
static void on_intr (int catch_signal) {
    fprintf(stderr, "pi4-simulation is interrupted\n");
    for (int i = 0; i < NTHREADS; i++) {
        if (fp[i]) fclose(fp[i]);
    }
    exit(1);
}
#endif

/*
 * Threads using OpenMP
 * int id = thread id
 * int N  = number of iterations
 */
void s_thread(int id, int N) {
    //SandpilePi4 sp(Z, L);
    SandpilePi4 sp(ALPHA, MU, L);
    for (int i = 0; i < N; i++) {
    again:
        if (!(reset % PERIOD)) {
            dosrand();
            reset = 0;
        }
        sp.update1();
        //sp.update();
        if (sp.get_t() >= L) goto again;
        fprintf(fp[id], "%d %d %d %d\n", sp.get_t(), sp.get_s(), sp.get_a(), sp.get_x());
    }
}

