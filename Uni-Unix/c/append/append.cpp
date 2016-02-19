#include <iostream>
#include <fstream>
using namespace std;

int main(int argc, char *argv[])
{
	ofstream out;
	if (argc < 3)
	{
		cout << "Usage: " << argv[0] << " <filename> \"<string-to-append>\"" << endl;
		return 1;
	}
	out.open(argv[1], ios::out | ios::app);
	if (!out)
	{
		cout << "ERROR: Can not open file" << endl;
		return 1;
	}
	out << argv[2] << endl;
	out.close();
	return 0;
}

