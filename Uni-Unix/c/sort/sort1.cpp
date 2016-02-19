#include <iostream>
#include <cstdlib>
using namespace std;

void Help();

int main (int argc, char *argv[]) {
  if (argc<2) { Help(); return 1; }
  int i, j, n, t;
  n = atoi(argv[1]);
  if (argc<n+2) { Help(); return 1; }
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
    cout << a[i] << endl;
  }
  
  return 0;
}

void Help() {
  cout << "Usage: " << "sort" << " <number-of-values> <values>..." << endl;
}


