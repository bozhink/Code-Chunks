#include <stdlib.h>
#include <stdio.h>
/*#define RAND_MAX 1229991*/

void srand(unsigned seed);
int sign(int,int);
int rand(void);

#define N 20000
#define ITMAX 1000000
#define IDIMV 215
#define IDIMV1 (IDIMV-1)
#define IHALF  (IDIMV1/2)
#define IDUM 576454

int main(void)
{
    srand(IDUM);
    char a[IDIMV][IDIMV];
    int ipoints[N][2];
    int i,j,imark,ix,iy,iter;
    int ixp1,ixm1,iyp1,iym1;
    
    for (i=0;i<IDIMV;i++)
    {
        for (j=0;j<IDIMV;j++)
        {
            a[i][j]='f';
        }
    }
    a[IHALF][IHALF]='t';
    ipoints[0][1]=ipoints[0][2]=IHALF;
    
    for (i=1;i<N;i++)
    {
        imark=(int)(4.0*rand()/(RAND_MAX+1.0));
        if (imark==0) {
            ix = (int)(IDIMV*rand()/(RAND_MAX+1.0));
            iy = 0;
        } else if (imark==1) {
            ix = (int)(IDIMV*rand()/(RAND_MAX+1.0));
            iy = IDIMV1;
        } else if (imark==2) {
            ix = 0;
            iy = (int)(IDIMV*rand()/(RAND_MAX+1.0));
        } else if (imark==3) {
            ix = IDIMV1;
            iy = (int)(IDIMV*rand()/(RAND_MAX+1.0));
        }
        
        iter=1;
        while (iter++<ITMAX) {
            ixp1 = (IDIMV+ix+1)%IDIMV;
            ixm1 = (IDIMV+ix-1)%IDIMV;
            iyp1 = (IDIMV+iy+1)%IDIMV;
            iym1 = (IDIMV+iy-1)%IDIMV;
            if (a[ixp1][iy]=='t' || a[ixm1][iy]=='t' || a[ix][iyp1]=='t' || a[ix][iym1]=='t')
            {
                a[ix][iy] = 't';
                ipoints[i][1]=ix;
                ipoints[i][2]=iy;
                break;
            }
            ix = (IDIMV+ix+sign(1, (int)(2.0*rand()/(RAND_MAX+1.0)) - 1)) % IDIMV;
            iy = (IDIMV+iy+sign(1, (int)(2.0*rand()/(RAND_MAX+1.0)) - 1)) % IDIMV;            
        }
        if (iter>=ITMAX) {
            printf("Exceeded maximum number of iterations\n");
            return 2;
        }
    }
    
    for (i=0;i<N;i++){
        printf("FILLED\t%d\t%d\n",ipoints[i][1],ipoints[i][2]);
    }
    
    return 0;
}

int sign(int i, int j)
{
    if (j<0) return -i;
    else     return  i;
}
