#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define L 400
#define N 100
#define NITER 2000

int chain[L];      /* Array, which contains the cain sites. */
int position[N];  /* Array, which contains particles' positions */

const double p = 0.1;
const double p_tilde = 0.995;


double drand();
int nextupdate(int current, int next, double p, double q, int *chain_old);

int main (int argc, char**argv) {
    int i, j, iter;
    int chain_old;
    char code[2];
    FILE*fp;
    
    if (argc < 2) {
        fprintf(stderr, "Ussage: %s <output file name>\n", argv[0]);
        exit(1);
    }
    
    
    /* Initialization */
    code[0] = '-';
    code[1] = 'X';
    for (i=0; i<L; i++) chain[i] = 0;
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
    
    fp = fopen(argv[1], "w");
    if (!fp) {
        fprintf(stderr, "%s - ERROR: Cannot open output file!\n", argv[0]);
        exit(2);
    }
    
    /* Simulation */
    //for (j=L-1; j>=0; j--) fprintf(fp, "%c", code[chain[j]]);
    for (j=L-1; j>0; j--) fprintf(fp, "%d ", chain[j]);
    fprintf(fp, "%d\n", chain[0]);
    
    chain_old = 0;
    for (iter=0; iter<NITER; iter++) {
        for (i=0; i<L; i++) {
            nextupdate(i, (i-1+L)%L, p, p_tilde, &chain_old);
        }
        //for (j=L-1; j>=0; j--) fprintf(fp, "%c", code[chain[j]]);
        for (j=L-1; j>0; j--) fprintf(fp, "%d ", chain[j]);
        fprintf(fp, "%d\n", chain[0]);
    }
    
    fclose(fp);
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
