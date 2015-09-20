#include <iostream>
#include <fstream>
using namespace std;

int main ()
{
  ofstream fout("test");

  if (!fout) {
    cout << "Cannot open output file.\n";
    return 1;
  }

  int i = 100;
  fout << "Hello!\n";
  fout << i << ' ' << hex << i << endl;

  fout.close();

  ifstream fin("test");

  if (!fin) {
    cout << "Cannot open input file.\n";
    return 1;
  }

  char str[80];
  i = 0;

  fin >> str >> i;
  cout << str << ' ' << i << endl;

  fin.close();

  return 0;
}

