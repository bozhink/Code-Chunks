/*
 *        fermi.c
 *
 *        simulate the Fermi-Pasta-Ulam problem (FPU)
 *
 *        1D chain of masses (m=1) connected by linear springs (k=1) with
 *        a small (alpha) nonlinearity (quadratic in the force)
 *
 *        by N Giordano -- July, 2006
 *
 *        edited B Karaivanov -- February, 2012
 */

#include <math.h>
#include <stdlib.h>
#include <stdio.h>

#define MAX       100
#define PI        3.1415926535897932
#define YES       1
#define NO        0

void init();
void run();
void CalculateNewPositions();
void SaveProfile();
int ModeCross(int,int);
void GetA(int,double*,double*);

double ModeEnergy(int,int);
double TotalEnergy();
double ModePosition(int,int);
double ModeVelocity(int,int);

double x[MAX],xOld[MAX],xNew[MAX];
int nParticles,nParticles1;        /* number of particles in the chain           */
double alpha;                      /* size of nonlinearity - same for all masses */
double alphaPrime;                 /* normalized alpha                           */

double beta,betaPrime;

double dt;                         /* time step                                  */
double r2;                         /* used for iteration                         */
double tMax;                       /* length of simulation                       */
double tRecord;

double d2n;
double sqd2n;

double a,aOld;

int nModes;

void init()
{
        int i;
        int modeInit;
        double omega1;
        double amplitude,lambda;

        nParticles = 32;        /* there are 32 particles that can move -
                                    with the end particles connected to rigid
                                    boundary points                             */
        nParticles1 = nParticles + 1;
        d2n = 2.0 / nParticles1;
        sqd2n = sqrt(d2n);

        modeInit = 1;          /* mode that contains all of the initial energy */
                                /* mode #1 is the lowest mode                   */
        amplitude = 1.0;        /* initial amplitude                            */
        amplitude = 10.0;

        /* string starts from rest                                             */
        lambda = 2.0 / (modeInit);

        for (i = 1; i <= nParticles; i++)
        {
                x[i] = xOld[i] = amplitude * sqd2n * sin(PI * i * d2n / (lambda));
        }
        x[0] = xOld[0] = 0.0;
        x[nParticles1] = xOld[nParticles1] = 0.0;


        omega1 = PI / (nParticles1);        /* frequency of the lowest mode        */
        dt = 0.001 * 2.0 * PI / omega1;
        dt = 1.0;
        dt = 0.3;
        dt = 0.02;
        dt = 0.05;
        r2 = dt * dt;
        tMax = 10000;
        tMax = 100000;
        nModes = 10; /*5;        /* number of modes to track        */
        tRecord = 20 * dt;

        /* different values of beta and alpha of interest        */
        beta = 1;        /* non-chaotic          */
        beta = 3;        /* seems chaotic        */
        beta = 0;
        beta = 0;
        beta = 3;        /* seems chaotic        */
        beta = 6;
        beta = 1;        /* non-chaotic          */
        beta = 0.3;

        betaPrime = beta * dt * dt;

        alpha = 1.0;
        alpha = 0.3;
        alpha = 0.6;
        alpha = 0.25;
        alpha = 0;
        alphaPrime = alpha * dt * dt;

        return;
}

void run()
{
        int i;
        FILE *fp[MAX], *fpMode[MAX];
        FILE *fpTotal  = fopen("total_e","w");
        FILE *fpX      = fopen("x_t","w");
        FILE *fpForce  = fopen("force_t","w");
        FILE *fpAlpha  = fopen("alpha_t","w");
        FILE *fpPhase  = fopen("phase_plot","w");
        FILE *fpPhase2 = fopen("phase_plot_2","w");
        char s[100];
        double t,tTest;
        double f,nonLinF;
        double X,Y;
        for(i = 1; i <= nModes; i++)
        {
                sprintf(s,"mode.%d",i);
                fp[i] = fopen(s,"w");
                sprintf(s,"x_mode.%d",i);
                fpMode[i] = fopen(s,"w");
        }

        SaveProfile();

        tTest = tRecord;
        t = 0;
        while(t < tMax)
        {
                CalculateNewPositions();

                t     += dt;
                tTest -= dt;
                if(tTest <= 0)
                {
                        tTest = tRecord;
                        fprintf(fpTotal,"%g\t%g\n",t,TotalEnergy());   fflush(fpTotal);
                        fprintf(fpX,"%g\t%g\n",t,x[nParticles/3]);     fflush(fpX);
                        for(i = 1; i <= nModes; i++)
                        {
                                fprintf(fp[i],"%g\t%g\n",t,ModeEnergy(i,1));         fflush(fp[i]);
                                fprintf(fpMode[i],"%g\t%g\n",t,ModePosition(i,0));   fflush(fpMode[i]);
                        }
                        X = x[i+1]-x[i];
                        Y = x[i]-x[i-1];
                        f = X - Y;                        fprintf(fpForce,"%g\t%g\n",t,f);
                        nonLinF = beta*(X*X*X - Y*Y*Y);   fprintf(fpAlpha,"%g\t%g\n",t,nonLinF);

                        fprintf(fpPhase,"%g\t%g\n",ModePosition(1,0),ModeVelocity(1,0));

                        if(ModeCross(3,0) == YES)
                        {
                                fprintf(fpPhase2,"%g\t%g\n",ModePosition(1,0),ModeVelocity(1,0));
                        }

                      //  printf("t = %g\t\t",t);
                      //  SaveProfile();

                }
        }

        return;
}

void CalculateNewPositions()
{
    int i;
    double X, Y;
    for(i = 1; i <= nParticles; i++)
    {
        X = x[i+1]-x[i];
        Y = x[i]-x[i-1];
        xNew[i] = r2 * (X - Y)
                + alphaPrime*(X*X-Y*Y)
                + betaPrime*(X*X*X-Y*Y*Y)
                + 2.0 * x[i] - xOld[i];
        }
        for(i = 1; i <= nParticles; i++)
        {
                xOld[i] = x[i];
                x[i] = xNew[i];
        }
        return;
}

double TotalEnergy() {
        int i;
        double v,dx;
        double sum;
        sum = 0.0;
        for(i = 1; i <= nParticles1; i++)
        {
                v = (x[i] - xOld[i]) / dt;
                dx = 0.5 * (x[i] + xOld[i] - x[i-1] - xOld[i-1]);
                sum += 0.5 * ( v * v + dx * dx );
        }
        return(sum);
}

double ModeEnergy(int k,int iflag)
{
        double T,V;
        if (iflag == 1) GetA(k, &a, &aOld);
        T = (a - aOld) * sqd2n / dt;
        V = (a + aOld) * sqd2n * sin(PI*k/(2 * nParticles1));
        return( 0.5 * ( T * T + V * V ) );
}

void SaveProfile()
{
        int i;
        FILE *fp = fopen("prof.junk","w");
        for(i = 0; i <= nParticles1; i++)   fprintf(fp,"%d\t%g\n",i,x[i]);
        fclose(fp);
        return;
}

double ModePosition(int k,int iflag)
{
        if (iflag==1) GetA(k, &a, &aOld);
        return( 0.5*(a + aOld)*sqd2n );
}

double ModeVelocity(int k,int iflag)
{
        if (iflag==1) GetA(k, &a, &aOld);
        return((a - aOld) * sqd2n / dt);
}

int ModeCross(int k,int iflag) 
{
        if (iflag==1) GetA(k, &a, &aOld);
        if(a * aOld > 0) return(NO);
        else             return(YES);
}

void GetA(int k,double*a,double*b)
{
    int i;
    double arg = k * PI / nParticles1;
    *a=0.0;
    *b=0.0;
    for(i = 1; i <= nParticles; i++)
    {
        *a += x[i] * sin(i * arg);
        *b += xOld[i] * sin(i * arg);
    }
    return;
}

void main(int argc,char*argv[])
{
        init();
        run();
}

