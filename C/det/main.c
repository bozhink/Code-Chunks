#include <stdio.h>
#include <stdlib.h>

#define N 3
#include "det.h"

int main(int argc, char *argv[])
{
  int i, j;
  float a[N*N];
  
  for (i=0; i<N; i++)
  {
      for (j=0; j<N; j++)
      {
		a[i+j] = atof(argv[i+j+1]);
//          printf("Enter element (%d, %d) : ", i+1, j+1);
//          scanf("%f", &a[i+j]);
      }
  }
  
  for (i=0; i<N; i++)
  {
      for (j=0; j<N; j++)
      {
          printf("%5.2f ", a[i+j]);
      }
      printf("\n");
  }
  
  printf("%f\n", det(N, a));
  
  return 0;
}
