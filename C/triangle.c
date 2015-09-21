#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double Area(double, double, double);

main (int argc[], char *argv[]) {
  double a, b, c, s;
  a=atof(argv[1]);
  b=atof(argv[2]);
  c=atof(argv[3]);
  s=Area(a,b,c);
  printf("%f\n",s);
}

double Area(double a, double b, double c) {
  double p;
  if ( (a+b)<c || (b+c)<a || (c+a)<b) {
    return 0.0;
  } else {
    p=(a+b+c)/2.0;
    return sqrt( p*(p-a)*(p-b)*(p-c) );
  }
}

