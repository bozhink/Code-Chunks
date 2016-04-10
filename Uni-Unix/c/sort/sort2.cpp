#include <iostream>
using namespace std;


int main (int argc, char *argv[]) {
  int i, j, n;
  cin >> n;
  double a[n], t;
  
  for (i=0; i<n; i++) cin >> a[i];
  
  for (i=0; i<n-1; i++) {
    for (j=i; j<n; j++) {
      if (a[i]<a[j]){
        t=a[j]; a[j]=a[i]; a[i]=t;
      }
    }
  }
  
  for (i=0; i<n; i++) cout << a[i] << endl;
    
  return 0;
}

