#include <stdio.h>
#include <stdlib.h>


main (int argc[], char *argv[]) {
  int i, j, n, t;
  n = atoi(argv[1]);
  int a[n];
  
  for (i=0; i<n; i++) {
    a[i] = atoi(argv[i+2]);
  }
  
  for (i=0; i<n-1; i++) {
    for (j=i; j<n; j++) {
      if (a[i]<a[j]){
        t=a[j]; a[j]=a[i]; a[i]=t;
      }
    }
  }
  
  for (i=0; i<n; i++) {
    printf("%d\n",a[i]);
  }
}


