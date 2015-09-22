#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define NITERATIONS 1000 /* Number of iterations */
#define L 20 /* Length of the chain */
#define N 3  /* Number of particles in the chain */

int chain[L];
int position[N]; /* This array contains the positions of the N particles */
int histogram[L]; /* Histogram of ocurrances of particles in each position */
double harea; /* Histogram area */
double dos[L]; /* Density of states of each position in the chain */

char chars[2];

double drand();
void update (double);
void init ();
void draw();
void DOS();

void main (void) {
    int i, j, iteration;
    double p = 0.35;
    
    init();
    
    
    /* Setting the N particles on the circle */
    /* Probably this array must be sorted! */
    position[0] = rand() % L;
    chain[position[0]] = 1;
    for (i=1; i<N; i++) {
    updatePosition:
        position[i] = rand() % L;
        for (j=0; j<i; j++) if (position[j]==position[i]) goto updatePosition;
        chain[position[i]] = 1;
    }
    /* Draw the cahin */
    draw ();
    
    
    for (iteration=0; iteration<NITERATIONS; iteration++) {
        /* Update the chain */
        update (p);
        /* Draw the chain */
        //draw();
    }
    
    /* Calculate the Density Of States */
    DOS();
    for (i=0; i<L; i++) {
        printf("%d\t%d\t%lf\n", i, histogram[i], dos[i]);
    }
}

double drand() {
    return (1.0*rand())/RAND_MAX;
}

void init () {
    int i;
    /* 
     * Initialization of chain-array 
     * Initialization of histogram array
     * Initialization of Density Of States (DOS) array
     */
    for (i=0; i<L; i++) {
        chain[i] = 0;
        histogram[i] = 0;
        dos[i] = 0.0;
    }
    harea = 0.0;
    /* Initialization of symbolic variables */
    chars[0] = '_';
    chars[1] = '²';
    /* Initialization of pseudo random number generator */
    srand(time(NULL));
}

void draw () {
    /* Draw the chain */
    int i;
    for (i=0; i<L; i++) printf("%c",chars[chain[i]]);
    printf("\n");
}

void update (double p) {
    int i, next;
    for (i=0; i<N; i++) {/* Scan all particles */
        next = (position[i] + 1 + L) % L; /* Periodic boundary condirions */
        if (!chain[next]) {  /* The next position to i-th particle is free */
            if (drand() < p) {   /* With probability p go to the next position */
                chain[next] = 1;
                chain[position[i]] = 0;
                position[i] = next;
            } else { /* With probability (1-p) stay on the same position */
                /* Do nothing */
            }
        } else { /* The next position is not empty */
            /* Do nothing */
        }
    }
    /* Update the histogram */
    for (i=0; i<L; i++) histogram[i] += chain[i];
}

void DOS () {
    /* Calculates the Density Of States */
    int i;
    harea = 0.0;
    for (i=0; i<L; i++) harea += 1.0*histogram[i];
    for (i=0; i<L; i++) dos[i] = histogram[i] / harea;
}
