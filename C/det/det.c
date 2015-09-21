#include "det.h"

float det(int rank, float a[])
{
    int n=rank-1;
    float b[n*n];
    int i, j, k, kr, kn;
    float s=0.0, sig=1.0;
    
    if (rank==2)
    {
        return a[0]*a[3]-a[1]*a[2];
    }
    
    for (i=0; i<rank; i++)
    {
        //a[i][...]
        for (k=1; k<rank; k++)
        {
            kr = k*rank;
            kn = (k-1)*n;
            for (j = 0;   j < i;    j++) b[kn+j]   = a[kr+j];
            for (j = i+1; j < rank; j++) b[kn+j-1] = a[kr+j];
        }
        if ( i%2 != 0 ) sig = -1.0;
        s = s + sig*det(n, b)*a[i];        
    }
    
    return s;
}
