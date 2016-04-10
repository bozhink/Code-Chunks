#include <stdio.h>
#include <stdlib.h>

main (int argc[], char *argv[]) {
  long a,b,i;
  a = atol(argv[1]);
  for (i=0, b=1; i<a; i++, b=b*i){}
  printf("%d\n",b);
}

