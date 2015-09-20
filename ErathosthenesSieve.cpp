#include <iostream>
#include <cstdlib>
#include <cmath>
#include <cstring>  // needed by memset
using namespace std;

void EratosthenesSieve(int);

int main(int argc,char**argv)
{
	int N=1000;
	if (argc>1)
	{
		N=atoi(argv[1]);
	}
	EratosthenesSieve(N);
	return 0;
}

void EratosthenesSieve(int upperBound)
{
	int upperBoundSquareRoot = (int) sqrt((double) upperBound);
	bool*isComposite=new bool[upperBound+1];
	memset(isComposite, 0, sizeof(bool)*(upperBound+1));
	for (int m=2; m<=upperBoundSquareRoot; m++)
	{
		if (!isComposite[m])
		{
			cout << m << endl;
			for (int k=m*m; k<=upperBound; k+=m)
			{
				isComposite[k]=true;
			}
		}
	}
	for (int m=upperBoundSquareRoot; m<=upperBound; m++)
	{
		if (!isComposite[m])
		{
			cout << m << endl;
		}
	}
	delete [] isComposite;
}

