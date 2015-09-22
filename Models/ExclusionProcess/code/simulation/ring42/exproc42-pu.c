/*
 * file: exproc42.c
 * author: Bozhin Karaivanov, 29.06.2013
 *
 * Exclusion process (TASEP) on a chain with 4 sites and 2 particles
 *
 * Parallel Update Rule
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define L 4 /* Number of positions on the chain */
#define N 2 /* Number of particles */
#define NSTATES 6 /* Number of all posible states on the chain */
#define NITER 10000 /* Number of iterations */

/* Matrix of states */
int C[NSTATES][L];
/* Chain arrays */
int chain[L], chain_old[L];
/* Histohram arrays */
int hist[L], chist[L];
/* Current arrays */
int current[L], ccurrent[L], icurrent[L];
/* Probability arrays */
int prob[NSTATES], cprob[NSTATES];



void init();
void update (int, int, double);
void fconfig();

int main (int argc, char**argv) {
    int i, j, n, k, iter, curr, next, sum;
    double p, riter;
    if (argc < 2) {
        fprintf (stderr, "Usage: %s <p>\n", argv[0]);
        fprintf (stderr, "where\n");
        fprintf (stderr, "\tp = probability of first transition\n");
        return 1;
    }
    init();
    p = atof (argv[1]);
    
    printf ("Totally asymmetric exclusion process\n");
    printf ("with backward-sequental update rule\n");
    printf ("on a ring with L=%d positions and N=%d particles.\n", L, N);
    printf ("Transition probabilities: p=%lf.\n", p);
    
    for (j=L-1; j>=0; j--) {
        printf ("\nInitial bound: (%d,%d)\n", (L+j-1)%L+1, (L+j)%L+1);
        for (n=0; n<NSTATES; n++) {
            for (i=0; i<L; i++) {
                hist[i] = 0;
                current[i] = 0;
            }
            for (iter=0; iter<NITER; iter++) {
                /* Reinitialization */
                for (i=0; i<L; i++) {
                    icurrent[i] = 0;
                    chain_old[i] = C[n][i];
                    chain[i] = C[n][i];
                }
                for (i=0; i<NSTATES; i++) {
                    prob[i] = 0;
                }
                /* Update chain */
                for (i=L-1; i>=0; i--) {
                    curr = (i+j+L)%L;
                    next = (i+1+j+L)%L;
                    update(curr, next, p);
                }
                fconfig();
                for (i=0; i<L; i++) {
                    if (chain[i]) hist[i]++;
                    if (icurrent[i]) current[i]++;
                }
                for (i=0; i<NSTATES; i++) {
                    if (prob[i]) cprob[i]++;
                }
            }
            for (i=0; i<L; i++) {
                chist[i] += hist[i];
                ccurrent[i] += current[i];
            }
            
            sum=0; for (i=0; i<L; i++) sum+=hist[i];
            
            printf("\n--------------+"); for(i=0; i<L; i++) printf("-------+");
            printf("\nPosition      |"); for(i=0; i<L; i++) printf(" %5d |", i+1);
            printf("\nConfiguration |"); for(i=0; i<L; i++) printf(" %5d |", C[n][i]);
            printf("\n--------------+"); for(i=0; i<L; i++) printf("-------+");
            printf("\nCurrent J     |"); for(i=0; i<L; i++) printf(" %5d |", current[i]);
            printf("\nOccurrences   |"); for(i=0; i<L; i++) printf(" %5d |", hist[i]);
            printf("\n--------------+"); for(i=0; i<L; i++) printf("-------+");
            printf("\nCheck sum of occurrences: %5d", sum);
            printf("\nNumber of iterations:     %5d", NITER);
            printf("\n");
        }
    }
    
    riter = (double) (L * NITER * NSTATES);
    sum = 0; for (i=0; i<NSTATES; i++) sum+=cprob[i];
    
    printf("\nSummary:");
    printf("\n----+"); for(i=0; i<L; i++) printf("-------+");
    printf("\nJ   |"); for(i=0; i<L; i++) printf(" %5.3lf |", ccurrent[i]/riter);
    printf("\nDOS |"); for(i=0; i<L; i++) printf(" %5.3lf |", chist[i]/riter);
    printf("\n----+"); for(i=0; i<L; i++) printf("-------+");
    printf("\nOut configurations: "); for(i=0; i<NSTATES; i++) printf("%5.3lf ", cprob[i]/riter);
    printf("\nCheck sum: %5.3lf", sum/riter);
    printf("\n");
    return 0;
}

void init () {
    int i;
    C[0][0] = 1; C[0][1] = 1; C[0][2] = 0; C[0][3] = 0;
    C[1][0] = 0; C[1][1] = 1; C[1][2] = 1; C[1][3] = 0;
    C[2][0] = 0; C[2][1] = 0; C[2][2] = 1; C[2][3] = 1;
    C[3][0] = 1; C[3][1] = 0; C[3][2] = 0; C[3][3] = 1;
    C[4][0] = 1; C[4][1] = 0; C[4][2] = 1; C[4][3] = 0;
    C[5][0] = 0; C[5][1] = 1; C[5][2] = 0; C[5][3] = 1;
    srand(time(NULL));
    for (i=0; i<L; i++) {
        chist[i] = 0;
        ccurrent[i] = 0;
    }
    for (i=0; i<NSTATES; i++) cprob[i]=0;
}

void update (int i, int j, double p) {
    if ((chain_old[i]!=0) && (chain_old[j]==0) && ((1.0*rand()) / RAND_MAX < p)) {
        /* Transition */
        chain[j] = 1;
        chain[i] = 0;
        icurrent[j] = 1;
    } else {
        icurrent[j] = 0;
    }
}

void fconfig () {
    int i, j, chk, tmp;
    for (i=0; i<NSTATES; i++) {
        chk = 1;
        for (j=0; j<L; j++) {
            tmp = 0;
            if (chain[j]==C[i][j]) tmp = 1;
            chk *= tmp;
        }
        prob[i] = 0;
        if (chk) prob[i] = 1;
    }
}


