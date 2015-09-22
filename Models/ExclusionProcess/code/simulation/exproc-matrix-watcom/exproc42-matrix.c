/*
 * file: exproc42-matrix.c
 * author: Bozhin Karaivanov
 * date: 17.11.2013
 * last modified: 23.11.2013
 *
 * Exclusion process (TASEP) on a chain with 4 sites and 2 particles.
 * This program calculates the ptobability matrix of transitions.
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#define L 4 /* Number of positions on the chain */
#define N 2 /* Number of particles */
#define NSTATES 6 /* Number of all posible states on the chain */
#define NITER 10000 /* Number of iterations */

int C[NSTATES][L]; /* Matrix of states */
int chain[L], chain_old[L]; /* Chain arrays */
int hist[L], chist[L]; /* Histohram arrays */
int current[L], ccurrent[L], icurrent[L]; /* Current arrays */
int prob[NSTATES], cprob[NSTATES], ciprob[NSTATES]; /* Probability arrays */
double out_configurations[NSTATES]; /* Output configurations from the update procedure */
double pmatrix[NSTATES][NSTATES]; /* Probability matrix of transitions */
double exact34[NSTATES][NSTATES]; /* Exact solution */
double deviation[NSTATES][NSTATES]; /* Deviation from exact values */
double max_deviation; /* The maximal deviation */

double p, q; /* Transition probabilities */

void init();
void update (int, int, double, double, double);
void fconfig();
void get_exact34(); /* Calculate the exact solution for initial bound 3-4 */

int main (int argc, char**argv) {
    int i, j, n, iter, curr, next, sum;
    double prand, riter;
    if (argc < 3) {
        fprintf (stderr, "Usage: %s <p> <p_tilde>\n", argv[0]);
        fprintf (stderr, "where\n");
        fprintf (stderr, "\t      p = probability of first transition\n");
        fprintf (stderr, "\tp_tilde = probability of next-particle transition\n");
        return 1;
    }
    init();
    p = atof (argv[1]);
    q = atof (argv[2]);
    
    printf ("Totally asymmetric exclusion process\n");
    printf ("with backward-sequental update rule\n");
    printf ("on a ring with L=%d positions and N=%d particles.\n", L, N);
    printf ("Transition probabilities: p=%lf, p_tilde=%lf.\n", p, q);
    
    //for (j=L-1; j>=0; j--) { /* For every chain node being initial node */
    for (j=3; j>=3; j--) { /* For every chain node being initial node */

        printf ("\nInitial bound: (%d,%d)\n", (L+j-1)%L+1, (L+j)%L+1);

        for (n=0; n<NSTATES; n++) { /* For every state being initial state */

            for (i=0; i<L; i++) { hist[i] = 0; current[i] = 0; } /* Reset variables */
            for (i=0; i<NSTATES; i++) ciprob[i] = 0;

            for (iter=0; iter<NITER; iter++) { /* Get statistics */
                /* Reinitialization */
                for (i=0; i<L; i++) {
                    icurrent[i] = 0;
                    chain_old[i] = 0;
                    chain[i] = C[n][i];
                }
                for (i=0; i<NSTATES; i++) {
                    prob[i] = 0;
                }
                /* Update chain */
                for (i=L-1; i>=0; i--) {
                    prand = (1.0*rand()) / RAND_MAX;
                    curr = (i+j+L)%L;
                    next = (i+1+j+L)%L;
                    update(curr, next, p, q, prand);
                }
                for (i=0; i<L; i++) {
                    if (chain[i]) hist[i]++;
                    if (icurrent[i]) current[i]++;
                }
                fconfig();
                for (i=0; i<NSTATES; i++) {
                    if (prob[i]) ciprob[i]++;
                }
            }

            printf("\n--------------+"); for(i=0; i<L; i++) printf("-------+");
            printf("\nPosition      |"); for(i=0; i<L; i++) printf(" %5d |", i+1);
            printf("\nConfiguration |"); for(i=0; i<L; i++) printf(" %5d |", C[n][i]);
            printf("\n--------------+"); for(i=0; i<L; i++) printf("-------+");
            printf("\nCurrent J     |"); for(i=0; i<L; i++) printf(" %5d |", current[i]);
            printf("\nOccurrences   |"); for(i=0; i<L; i++) printf(" %5d |", hist[i]);
            printf("\n--------------+"); for(i=0; i<L; i++) printf("-------+");
            sum=0; for (i=0; i<L; i++) sum+=hist[i];
            printf("\nCheck sum of occurrences: %5d", sum);
            printf("\nNumber of iterations:     %5d", NITER);
            printf("\n");
            
            /* Calculation of current probability matrix row */
            riter = (double) NITER;
            for (i=0; i<NSTATES; i++) {
                pmatrix[n][i] = ciprob[i] / riter;
            }
            
            /* Calculation of cumulative quantities */
            for (i=0; i<L; i++) {
                chist[i] += hist[i];
                ccurrent[i] += current[i];
            }
            for (i=0; i<NSTATES; i++) {
                cprob[i] += ciprob[i];
            }
        }
        
        /*
         * Here we have the whole probability matrix for every state n
         * for fixed value of the initial bound.
         */
         /* Print current probability matrix */
         printf("\nProbability matrix:\n\n");
         for (n=0; n<NSTATES; n++) {
             printf("[");
             for (i=0; i<NSTATES; i++) {
                 printf(" %5.3lf", pmatrix[n][i]);
             }
             printf("]\n");
         }
         /* Get the exact values and print them */
         get_exact34();
         printf("\nExact matrix:\n\n");
         for (n=0; n<NSTATES; n++) {
             printf("[");
             for (i=0; i<NSTATES; i++) {
                 printf(" %5.3lf", exact34[n][i]);
             }
             printf("]\n");
         }
         /* Calculate deviation to exact values */
         max_deviation = 0.0;
         for (n=0; n<NSTATES; n++) for (i=0; i<NSTATES; i++) {
             deviation[n][i] = fabs(exact34[n][i]-pmatrix[n][i]);
             if (exact34[n][i]!=0.0) {
                 deviation[n][i] *= 100.0/exact34[n][i];
             }
             else {
                 if (deviation[n][i]!=0.0) deviation[n][i] = -1.0;
             }
             if (max_deviation < deviation[n][i]) max_deviation = deviation[n][i];
         }
         printf("\nDeviation matrix:\n\n");
         for (n=0; n<NSTATES; n++) {
             printf("[");
             for (i=0; i<NSTATES; i++) {
                 printf(" %5.3lf", deviation[n][i]);
             }
             printf("]\n");
         }
         printf("\nThe maximal deviation is %5.3lf%\n", max_deviation);
    }
    
    riter = (double) (L * NITER * NSTATES);
    sum = 0;
    for (i=0; i<NSTATES; i++) {
        sum+=cprob[i];
        out_configurations[i] = cprob[i] / riter;
    }
    
    printf("\nSummary:");
    printf("\n----+"); for(i=0; i<L; i++) printf("-------+");
    printf("\nJ   |"); for(i=0; i<L; i++) printf(" %5.3lf |", ccurrent[i]/riter);
    printf("\nDOS |"); for(i=0; i<L; i++) printf(" %5.3lf |", chist[i]/riter);
    printf("\n----+"); for(i=0; i<L; i++) printf("-------+");
    printf("\nOut configurations: "); for(i=0; i<NSTATES; i++) printf("%5.3lf ", out_configurations[i]);
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

void update (int i, int j, double p, double q, double prand) {
    if (chain_old[j]) p = q;
    if ((chain[i]!=0) && (chain[j]==0) && (prand<p)) {
        /* Transition */
        chain[j] = 1;
        chain[i] = 0;
        chain_old[i] = 1;
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

void get_exact34() {
    int i, j;
    for (i=0; i<NSTATES; i++) {
        for (j=0; j<NSTATES; j++) {
            exact34[i][j] = 0.0;
        }
    }
    exact34[0][0] = 1.0-p;
    exact34[0][1] = p*q;
    exact34[0][4] = p*(1.0-q);
    
    exact34[1][0] = p*p*(1.0-q);
    exact34[1][1] = 1.0-p;
    exact34[1][2] = p*q*(1.0-p);
    exact34[1][4] = p*p*q;
    exact34[1][5] = p*(1.0-p)*(1-q);
    
    exact34[2][2] = exact34[0][0];
    exact34[2][4] = p;
    
    exact34[3][0] = exact34[0][1];
    exact34[3][3] = exact34[0][0];
    exact34[3][5] = exact34[0][4];

    exact34[4][0] = exact34[1][4];
    exact34[4][1] = p*(1-p);
    exact34[4][3] = exact34[4][1];
    exact34[4][4] = exact34[0][0] * exact34[0][0];
    exact34[4][5] = exact34[1][0];
    
    exact34[5][0] = exact34[4][1];
    exact34[5][2] = exact34[4][1];
    exact34[5][4] = p*p;
    exact34[5][5] = exact34[4][4];
}

