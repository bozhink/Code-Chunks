#include <stdio.h>
#include <stdlib.h>

long fact(long n);

main (int argc[], char *argv[]) {
  long a,b,i;
  a = atol(argv[1]);
  b = fact(a);
  printf("%d\n",b);
}

long fact(long n) {
  if (n<2){ return 1; } else { return n*fact(n-1); }
}

