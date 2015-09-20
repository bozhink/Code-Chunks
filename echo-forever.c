#include <stdio.h>

int main(int argc, char**argv)
{
	if (argc<2)
	{
		return -1;
	}
	int i;
	while (1)
	{
		for (i=1; i<argc-1; i++)
		{
			printf("%s ",argv[i]);
		}
			printf("%s\n",argv[argc-1]);
	}
	return 0;
}

