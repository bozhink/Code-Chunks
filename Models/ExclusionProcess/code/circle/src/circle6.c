/*
 * 10.01.2013
 * file: circle6.c
 * Calculation of DOS and current and their statistical parameters
 * DOS = number of times of passage of a given particle through position i
 * current = number of times for passage through a bound i-j
 */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>      
#define NITERMIN 1000
#define NITERMAX 100 * NITERMIN
#define NITERSTRIDE 1000

int L; /* Number of chain positions */
int N; /* Number of particles in the chain */

int *chain;         /* Array, which contains the cain sites. */
int *position;      /* Array, which contains particles' positions */
int *ihistogram, **idos, **iJ;
double *histogram;
double **dos;       /* Density of states */
double **J;         /* Current between positions i and i-1 */
double *Js;         /* Summary current */
int NNiter;         /* Effective number of iteration * N */
double dNiterEff;   /* Effective number of iterations */

double mDOS; /* mean density of states */
double sDOS; /* standard deviation of DOS */
double vDOS; /* variance of DOS */
double mJ;   /* mean of the summary current */
double sJ;   /* standard deviation of the summary current */
double vJ;   /* variance of the summary current */


double p = 0.5;
double p_tilde = 0.0;


double drand();
void init();
void finalize();
void genpos();
int nextupdate(int current, int next, double p, double q, int *chain_old);
void statistics(int, double*, double*, double*, double*);

int main (int argc, char**argv) {
    int i, j, iter;
    int NITER;
    int chain_old;
    FILE*fp;
    srand(time(NULL));
    
    if (argc<2) {
        fprintf(stderr, "Usage: %s <L> <N> <p> <p_tilde> <output file>\n", argv[0]);
        exit(1);
    }
    
    L = atoi(argv[1]);
    N = atoi(argv[2]);
    p = atof(argv[3]);
    p_tilde = atof(argv[4]);
    fp = fopen(argv[5], "w");
    if (!fp) {
        fprintf(stderr, "%s: ERROR: Cannot open output file!\n");
        exit(2);
    }

    for (NITER=NITERMIN; NITER<=NITERMAX; NITER+=NITERSTRIDE) {
        init();
        genpos();
    
        /*
         * Simulation
         */
        for (i=0; i<N; i++) {
            idos[i][position[i]]++;
            ihistogram[i]++;
        }
        chain_old = 0;
        for (iter=0; iter<NITER; iter++) {
            for (i=0; i<L; i++) {
                nextupdate(i, (i-1+L)%L, p, p_tilde, &chain_old);
            }
        }

        NNiter = 0;
        for (i=0; i<L; i++) {
            NNiter += ihistogram[i];
        }
        /* Effective number of iterations */
        dNiterEff = (1.0 * NNiter) / N;

        /* Normalization and calculation of the summary current */
        for (i=0; i<L; i++) {
            histogram[i] = ihistogram[i] / dNiterEff;
            Js[i] = 0.0;
            for (j=0; j<N; j++) {
                dos[j][i] = idos[j][i] / dNiterEff;
                J[j][i]   = iJ[j][i]   / dNiterEff;
                Js[i] += J[j][i];
            }
        }
    
        /* Statistical parameters */
        statistics(L, histogram, &mDOS, &sDOS, &vDOS);
        statistics(L,  Js,   &mJ,   &sJ,   &vJ);
     
        /* Print results */
        fprintf(fp, "%10.2lf  %8.6lf  %8.6lf  %8.6lf  %8.6lf\n", dNiterEff, mDOS, sDOS, mJ, sJ);
        
        finalize();
    }
    fclose(fp);
    return 0;
}

/*
 * Double precision pseudo random generator
 */
double drand() {
    return (1.0*rand()) / RAND_MAX;
}

/*
 * Initialization
 */
void init() {
    int i, j;
    chain = (int*) malloc(L * sizeof(int));
    position = (int*) malloc(N * sizeof(int));
    
    ihistogram = (int*) malloc(L * sizeof(int));
    histogram  = (double*) malloc(L * sizeof(double));
    Js  = (double*) malloc(L * sizeof(double));
    
    idos = (int**) malloc (N * sizeof(int*));
    iJ   = (int**) malloc (N * sizeof(int*));
    dos  = (double**) malloc (N * sizeof(double*));
    J    = (double**) malloc (N * sizeof(double*));
    for (i=0; i<N; i++) {
        idos[i] = (int*) malloc(L * sizeof(int));
        iJ[i]   = (int*) malloc(L * sizeof(int));
        dos[i]  = (double*) malloc(L * sizeof(double));
        J[i]    = (double*) malloc(L * sizeof(double));
    }
    
    for (i=0; i<L; i++) {
        chain[i] = 0;
        ihistogram[i] = 0;
        histogram[i]  = 0.0;
        for (j=0; j<N; j++) {
            idos[j][i] = 0;
            dos[j][i]  = 0.0;
            iJ[j][i]   = 0;
            J[j][i]    = 0.0;
        }
    }
    
    for (i=0; i<N; i++) position[i] = 0;
}

void finalize() {
    int i;
    free(chain);
    free(position);
    
    free(ihistogram);
    free(histogram);
    free(Js);
    
    for (i=0; i<N; i++) {
        free(idos[i]);
        free(iJ[i]);
        free(dos[i]);
        free(J[i]);
    }
    free(idos);
    free(iJ);
    free(dos);
    free(J);
}

/*
 * Generation of initial positions
 */
void genpos() {
    int i, j;
    position[0] = rand() % L;
    chain[position[0]] = 1;
    for (i=1; i<N; i++) {
    updatePosition:
        position[i] = rand() % L;
        for (j=0; j<i; j++) {
            if (position[j]==position[i]) {
                goto updatePosition;
            }
        }
        chain[position[i]] = 1;
    }
    /* Sort position array */
    for (i=0, j=0; i<L; i++) {
        if (chain[i]==1) {
            position[j++] = i;
        }
    }
}

/*
 * Calculation of the next iteration
 */
int nextupdate(int current, int next, double p, double q, int *chain_old) {
    int end_flag = 0, i;
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
            for (i=0; i<N; i++) {
                if (position[i] == current) {
                    position[i] = next;
                    idos[i][position[i]]++;
                    iJ[i][current]++;
                }
            }
            ihistogram[next]++;
            end_flag = 1;
        } else {
            for (i=0; i<N; i++) {
                if (position[i] == current) {
                    idos[i][position[i]]++;
                }
            }
            ihistogram[current]++;
        }
        *chain_old = 1;
    } else {
        *chain_old = 0;
    }
    
    return end_flag;
}

/*
 * Calculation of statistical parameters
 */
void statistics(int n, double*X, double*mean, double*stdev, double*variance) {
    int i;
    double mean2=0.0;
    *mean = 0.0;
    for (i=0; i<n; i++) {
        *mean += X[i];
        mean2 += X[i]*X[i];
    }
    *mean /= n;
    mean2 /= n;
    *variance = mean2 - (*mean)*(*mean);
    if (*variance<0.0) {
        *stdev = -1.0;
    } else {
        *stdev = sqrt(*variance);
    }
}
