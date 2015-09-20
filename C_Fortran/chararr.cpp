#include <cstdio>
#include <cstdlib>
#include <iostream>
using namespace std;
#define N 10

int f(int x)
{
	return ++x;
}


int main()
{
	char**c;
	c = new char*[N];
	for(int i=0; i<N; i++) c[i]=new char[N];

	for(int i=0; i<N; i++) for (int j=0; j<N; j++) c[i][j] = 0x00;
	c[0][0] = 0x03;
	if (c[0][0] & 0x02) cout << "..." << endl;
	c[1][1]++;
	if (c[1][1] & 0x01)cout << "." << endl;

	for (int i=0; i<N; i++) delete[] c[i];
	delete [] c;

	int x=1;
	cout << f(x) << endl;
	cout << x << endl;	

	return 0;
}

