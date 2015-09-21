#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char *argv[])
{
  if (argc<4)
  {
      printf("Usage: %s <a> <b> <c>\n", argv[0]);
      printf("where\n");
      printf("     2\n");
      printf("  a.x  + b.x + c = 0\n\n");
      return 1;
  }
  
  double a, b, c;
  a = atof(argv[1]);
  b = atof(argv[2]);
  c = atof(argv[3]);
  
  if (a==0.0)
  {
      if (b!=0.0)
      {
          printf("There is only one root: x = %f\n", -c/b);
          return 0;
      }
      else
      {
          if (c!=0.0)
          {
              printf("There are no any roots in equation %f = 0.0\n", c);
              return 2;
          }
          else
          {
              printf("This is trivial: 0 = 0\n");
              return 3;
          }
      }
  }
  
  double a2, D, x1, x2, re, im;
  a2 = a*2.0;
  D = b*b - 4.0*a*c;
  re = -b/a2;
  im = sqrt(fabs(D))/a2;
  if (D>=0.0)
  {
      x1 = re-im;
      x2 = re+im;
      if (x1==x2)
      {
          printf("There is double root: x = %f\n", x1);
      }
      else
      {
          printf("First  root: x1 = %f\n", x1);
          printf("Second root: x2 = %f\n", x2);
      }
  }
  else
  {
      im = fabs(im);
      printf("First  root: x1 = %f - i %f \n", re, im);
      printf("Second root: x2 = %f + i %f \n", re, im);
  }
  
  return 0;
}
