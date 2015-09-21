#include <stdio.h>
#include <stdlib.h>

struct Node {double b; double c; double x;};
typedef struct Node tNode;

tNode **delrow(tNode **z, int M, int N, int k);
tNode **malloc2d(int M, int N);

void main()
{
   int N=0;
   int M=0;

//    while (N<=0 || M<=0){
//       printf("Enter size N of matrix: "); scanf("%d",&N);
//       printf("Enter size M of matrix: "); scanf("%d",&M);
//    }

   M=2;
   N=2;

   tNode a[M][N];

   int i,j,k;

//    printf("Enter matrix values:\n");
//    for (i=0; i<M; i++)
//    {
//       printf("c:");
//       for (j=0; j<N; j++)
//       {
//          printf("\t[%d][%d]=",i,j);
//          scanf("%lf",&a[i][j].c);
//       }
//       printf("\n");
//       printf("b:");
//       for (j=0; j<N; j++)
//       {
//          printf("\t[%d][%d]=",i,j);
//          scanf("%lf",&a[i][j].b);
//          a[i][j].x=0.0;
//       }
//       printf("\n");
//    }

   a[0][0].c=1.0; a[0][1].c=2.0; a[1][0].c=3.0; a[1][1].c=4.0;
   a[0][0].b=5.0; a[0][1].b=6.0; a[1][0].b=7.0; a[1][1].b=8.0;
   a[0][0].x=0.0; a[0][1].x=0.0; a[1][0].x=0.0; a[1][1].x=0.0;

   for (i=0; i<M; i++) { printf("c:"); for (j=0; j<N; j++) printf("\t%lf",a[i][j].c); printf("\n"); }
   for (i=0; i<M; i++) { printf("b:"); for (j=0; j<N; j++) printf("\t%lf",a[i][j].b); printf("\n"); }

   tNode **b;
   tNode **c;
   k=1;
//    delrow(b, c, M, N, k);

//    for (i=0; i<M-1; i++)
//    {
//       printf("c:");
//       for (j=0; j<N-1; j++) printf("\t%lf",c[i][j].c);
//       printf("\n");
//    }
//    for (i=0; i<M-1; i++)
//    {
//       printf("b:");
//       for (j=0; j<N-1; j++) printf("\t%lf",c[i][j].b);
//       printf("\n");
//    }
}

tNode**malloc2d(int M, int N)
{
   int i;
   tNode**t = malloc(M*sizeof(tNode*));
   for (i=0; i<M; i++) t[i] = malloc(N*sizeof(tNode));
   return t;
}



tNode **delrow(tNode **z, int M, int N, int k)
{
   tNode **b;
   int i, j;
   for (i=0; i<k; i++) for(j=0; j<N; j++) b[i][j] = z[i][j];
   for (i=k+1; i<M; i++) for(j=0; j<N; j++) b[i][j] = z[i][j];
   return b;
}
