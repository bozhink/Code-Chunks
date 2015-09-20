#include <iostream>
using namespace std;

unsigned short SwapBytes (unsigned short source);
unsigned long SwapBytes(unsigned long source);

int main(void)
{
	unsigned short value =1;
	unsigned char *ptr = (unsigned char *) &value;
	if (*ptr == 1)
		cout << "Little-Endian" << endl;
	else
		cout << "Big-Endian" << endl << *ptr << endl;
	
	value = SwapBytes(value);
	ptr = (unsigned char *) &value;
	if (*ptr == 1)
		cout << "Little-Endian" << endl;
	else
		cout << "Big-Endian" << endl << *ptr << endl;
	return 0;
}

unsigned short SwapBytes (unsigned short source)
{
	unsigned short destination;
	destination = ((source & 0xFF) << 8) | ((source & 0xFF00) >> 8);
	return source;
}

unsigned long SwapBytes(unsigned long source)
{
	unsigned long destination;
	destination =     ((source & 0x000000FFL) << 24)
			| ((source & 0x0000FF00L) << 8)
			| ((source & 0x00FF0000L) >> 8)
			| ((source & 0xFF000000L) >> 24);
	return destination;
}

