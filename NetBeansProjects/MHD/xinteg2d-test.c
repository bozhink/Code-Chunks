#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define NX 31
#define NY 31
double fdata[NX][NY];
double func(double,double);
static double xmin=-5.0;
static double xmax=5.0;
static double ymin=-5.0;
static double ymax=5.0;

//#pragma aux yinteg "^"
//#pragma aux xinteg "^"

void yinteg(int, int, double, double, double[NX][NY], double*);
void xinteg(int, int, int,    double, double[NX][NY], double*);



void main(void) {
    int i, j;
    int nx=NX, ny=NY;
    double x, y;
    double hx, hy;
    double integral;
    
    hx = (xmax-xmin)/(NX-1);
    hy = (ymax-ymin)/(NY-1);
    for (i=0; i<NX; i++) {
        x = (i-NX/2)*hx;
        for (j=0; j<NY; j++) {
            y = (j-NY/2)*hy;
            fdata[i][j] = func(x,y);
        }
    }
    /*
    for (i=0; i<NX; i++) {
        for (j=0; j<NY; j++) {
            printf("%7.3lf ",fdata[i][j]);
        }
        printf("\n");
    }
    */
    i = 1;
    xinteg(nx, ny, i, hx, fdata, &integral);
    printf("%lf\n", integral);
}

double func(double x, double y) {
    return exp(-x*x-y*y);
}
