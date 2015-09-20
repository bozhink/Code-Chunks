// reading a complete binary file
#include <iostream>
#include <fstream>
#include <cstdlib>
using namespace std;

ifstream::pos_type size;
char * memblock;

int main () {
  int N=10;
  char buf[N];
  fstream file ("example.bin", ios::in|ios::binary|ios::ate);
  if (file.is_open())
  {
    file.seekg(0, ios::beg);
    int i, j=0;
    int x;
    while(!file.eof())
    {
       file.read(buf, N);
       i = atoi(buf);
       file.read(buf, N);
       x = atoi(buf);
       j++;
    }
    cout << j << endl;
  }
  else cout << "Unable to open file";
  return 0;
}

