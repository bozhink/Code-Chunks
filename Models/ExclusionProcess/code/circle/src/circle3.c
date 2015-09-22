#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define L 30
#define N 20
#define NITER 30

int chain[L];      /* Array, which contains the cain sites. */
int position[N];  /* Array, which contains particles' positions */
int head;
int tail;

const double p = 0.5;
const double p_tilde = 1.0;


double drand();
int nextupdate(int current, int next, double p, double q, int *chain_old);
int pos(int);

void main (void) {
    int i, j, iter;
    int next, chain_old, end_flag;
    double probability;
    char code[2];
    
    
    /* Initialization */
    code[0] = '-';
    code[1] = 'X';
    for (i=0; i<L; i++) chain[i] = 0;
    for (i=0; i<N; i++) position[i] = 0;
    srand(time(NULL));
    
    /* Generation of initial positions */
    position[0] = rand() % L;
    chain[position[0]] = 1;
    for (i=1; i<N; i++) {
    updatePosition:
        position[i] = rand() % L;
        for (j=0; j<i; j++) if (position[j]==position[i]) goto updatePosition;
        chain[position[i]] = 1;
    }
    printf("=========================================================\n");
    for (i=0; i<N; i++) printf("position[%d] = %d\n", i, position[i]);
    /* Instead of sort of array position */
    for (i=0, j=0; i<L; i++) {
        if (chain[i]==1) position[j++] = i;
    }
    printf("=========================================================\n");
    for (i=0; i<N; i++) printf("position[%d] = %d\n", i, position[i]);
    printf("=========================================================\n");
    
    /* Simulation */
    for (j=0; j<L; j++) printf("%c", code[chain[j]]);
    printf("\n");
    
    chain_old = 0;
    head = 0;
    tail = head + L;
    for (iter=0; iter<NITER; iter++) {
        //end_flag = nextupdate(0, L-1, p, p_tilde, &chain_old);

        if (!chain[pos(tail-1)]) tail--;
        for (i=head; i<tail; i++) {
            nextupdate(pos(i), pos(i-1), p, p_tilde, &chain_old);
        }
        head = tail;
        tail = head + L;
        
        //if (end_flag == 0) {
        //    nextupdate(L-1, L-2, p, p_tilde, &chain_old);
        //}

        for (j=0; j<L; j++) printf("%c", code[chain[j]]);
        printf("\n");
    }
}

double drand() {
    return (1.0*rand()) / RAND_MAX;
}

int pos(i) {
    return (i+L)%L;
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
