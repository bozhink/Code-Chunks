#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define L 200
#define N 50
#define NITER 200000

int chain[L];      /* Array, which contains the cain sites. */
int position[N];   /* Array, which contains particles' positions */
int histogram[L];
double dos[L];

const double p = 0.5;
const double p_tilde = 0.0; //0.995;


double drand();
int nextupdate(int current, int next, double p, double q, int *chain_old);

int main (int argc, char**argv) {
    int i, j, iter;
    int chain_old;

    /* Initialization */
    for (i=0; i<L; i++) {
        chain[i] = 0;
        histogram[i] = 0;
        dos[i] = 0.0;
    }
    for (i=0; i<N; i++) position[i] = 0;
    srand(time(NULL));
    
    /* Generation of initial positions */
    position[0] = L/2 + rand() % (L/2);
    chain[position[0]] = 1;
    for (i=1; i<N; i++) {
    updatePosition:
        position[i] = L/2 + rand() % (L/2);
        for (j=0; j<i; j++) if (position[j]==position[i]) goto updatePosition;
        chain[position[i]] = 1;
    }
    for (i=0, j=0; i<L; i++) {
        if (chain[i]==1) position[j++] = i;
    }
    
    /* Simulation */
    for (i=0; i<L; i++) {
        if (chain[i]) histogram[i]++;
    }
    chain_old = 0;
    for (iter=0; iter<NITER; iter++) {
        for (i=0; i<L; i++) {
            nextupdate(i, (i-1+L)%L, p, p_tilde, &chain_old);
        }
        for (i=0; i<L; i++) if (chain[i]) histogram[i]++;
    }
    /* Calculation of Density Of States (DOS) */
    for (i=0; i<L; i++) dos[i] = histogram[i] / (1.0*(NITER+1));

    /* Print results */
    for (i=0; i<L; i++) {
        printf("%d\t%d\t%lf\n", i+1, histogram[i], dos[i]);
    }

    return 0;
}

double drand() {
    return (1.0*rand()) / RAND_MAX;
}


int nextupdate(int current, int next, double p, double q, int *chain_old) {
    int end_flag = 0;
    double probability;
    
    if (chain[current] == 1) {
        if (*chain_old == 0) {
            probability = p;
        } else {
            probability = q;
        }
        if (chain[next] == 0 && drand() < probability) {
            chain[current] = 0;
            chain[next] = 1;
            end_flag = 1;
        }
        *chain_old = 1;
    } else {
        *chain_old = 0;
    }
    
    return end_flag;
}
