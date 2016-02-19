#include <stdio.h>
#include <stdlib.h>

main (int argc[], char *argv[]) {
  int a,b,i;
  a = atoi(argv[1]);
  for (i=0, b=0; i<a; i++, b=b+i){}
  printf("%d\n",b);
}

