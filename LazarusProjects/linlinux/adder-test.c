#include <stdio.h>
#include <stdlib.h>

double adder(double, double);

void main(void) {
  double a=1.0;
  double b=3.0;
  double add = adder(a,b);

  printf("%g + %g = %g\n",a,b,add);
}

