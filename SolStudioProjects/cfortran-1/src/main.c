/* 
 * File:   main.c
 * Author: bozhin
 *
 * Created on Понеделник, 2012, Юли 9, 0:06
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * 
 */
void spec1_(double*,double*,double*,int*);

int main(int argc, char** argv)
{
    double px;
    double py;
    double dspec[4];
    int info;
    px = 0.0;
    py = 3.14;
    scanf("%lf%lf",&px,&py);
    spec1_(&px, &py, dspec, &info);
    printf("%6.3lf\t%6.3lf\t%6.3lf\t%6.3lf\t%6.3lf\t%6.3lf\n",
            px,py,dspec[0],dspec[1],dspec[2],dspec[3]);
    return (EXIT_SUCCESS);
}

