/* 
 * File:   main.cpp
 * Author: bozhin
 *
 * Created on Неделя, 2012, Май 13, 16:07
 */

#include <cstdlib>
#include <cstdio>
#include <ctime>
#include <iostream>

using namespace std;
void test(int N, int NMAX, double *mean, double *std);

int main(int argc, char** argv) 
{
    srand( time(NULL) );
    int N, NMAX;
    int i;
    double mean, std;
    
    for (N = 8; N < 4096; N*=2)
    {
        NMAX = N*4096;
        test(N, NMAX, &mean, &std);
        cout << N << "\t" << mean << "\t" << std << endl;
    }
    

    return 0;
}

void test(int N, int NMAX, double *mean, double *std)
{
    int a[N], i; for (i=0; i<N; i++) a[i]=0;
    
    for (i=0; i<NMAX; i++) a[rand() % N]++;
    
    *mean = 0.0;
    *std  = 0.0;
    
    for (i=0; i<N; i++) *mean+=a[i];
    *mean = *mean/N;
    
    for(int i=0; i<N; i++) *std += (a[i]-*mean)*(a[i]-*mean);
    *std = *std/N;
}

