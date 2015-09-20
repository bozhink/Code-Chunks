#include <iostream>
#include <fstream>
#include <cstdlib>
#include <cstdio>
using namespace std;

int main()
{
	ofstream myfile;
	int N=8;
	int NN=10;
	char buf[N];
	int x=132424;
	
	myfile.open("example.txt", ios::out | ios::trunc);
	if (myfile.is_open())
	{
		for (int i=0; i<NN; i++)
		{
			myfile << i << " " << x << endl;
		}
	} else {
		cerr << "Unable to open file example.txt\n";
		return 1;
	}
	return 0;
}

