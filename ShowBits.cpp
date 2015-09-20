#include <cstdlib>
#include <iostream>
using namespace std;

class ShowBits
{
	int numbits;
public:
	ShowBits(int n)
	{
		numbits = n;
	}

	void show (unsigned long val)
	{
		unsigned long mask = 1;
		mask <<= numbits-1;
		int spacer = 0;
		for (; mask!=0; mask >>=1)
		{
			if ( (val & mask) != 0 ) cout << '1';
			else cout << '0';
			spacer++;
			if ( (spacer%8) == 0 )
			{
				cout << ' ';
				spacer = 0;
			}
		}
		cout << endl;
	}
};

int main(int argc, char **argv)
{
	int numbits;
	unsigned long number;
	if (argc < 3) 
	{
		cout << "Usage: " << argv[0] << " <lenght> <byte/uint/ulong>\n";
		cout << "                <lenght> = 8, 32, 64\n";
		return 1;
	}
	else
	{
		numbits = atoi(argv[1]);
		number  = atol(argv[2]);
	}
	ShowBits sb(numbits);
	sb.show(number);
}

