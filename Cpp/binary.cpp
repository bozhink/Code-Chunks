#include <iostream>
#include <fstream>
#include <cstdlib>
#include <cstdio>
using namespace std;

int main()
{
	fstream myfile;
	int N=10;
	int NN=10000000;
	char buf[N];
	int x=132424;
	
	myfile.open("example.bin", ios::out | ios::trunc | ios::binary);
	if (myfile.is_open())
	{
		for (int i=0; i<NN; i++)
		{
			sprintf(buf,"%d",i);
			myfile.write(buf,N);
			sprintf(buf,"%d",x);
			myfile.write(buf,N);
		}
	} else {
		cerr << "Unable to open file example.bin\n";
		return 1;
	}
	return 0;
}

