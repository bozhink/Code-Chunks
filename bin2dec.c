#include "stdlib.h"
#include "stdio.h"

int main(int argc, char **argv)
{
	int bits;
	char*num;
	if (argc < 3)
	{
		printf("Usage: %s <int digits> <char *binary_number>\n",argv[0]);
		return 1;
	}
	bits = atoi(argv[1]);
	num = argv[2];
	int i;
	unsigned long long dec=0,b;
	
	for (i=0; i<bits; i++)
	{
		if (num[i]=='1') b=1;
		else b=0;
		
		dec = dec*2+b;
	}
	
	printf("%d\n",dec);
}

