#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <iostream>

// Usage urand [<N>] [<Min>] [<Max>]

int main(int argc, char**argv)
{
	int N = 10;
	unsigned Min = 0;
	unsigned Max = RAND_MAX;
	if (argc==2)
	{
		N = atoi(argv[1]);
	}
	else if (argc==3)
	{
		N = atoi(argv[1]);
		Min = (unsigned) atoi(argv[2]);
	}
	else if (argc > 3)
	{
		N = atoi(argv[1]);
		Min = (unsigned) atoi(argv[2]);
		Max = (unsigned) atoi(argv[3]);
	}
	
	int fd;
	if (!(fd = open("/dev/urandom",O_RDONLY)))
	{
		perror("Cannot open /dev/urandom");
	}
	
	unsigned s0;
	double s1;
	for (int i=0; i<N; i++)
	{
		if ( read(fd, &s0, sizeof(s0))<=0 )
		{
			perror("Cannot read random data");
		}
	
		s1 = Min + (Max-Min)*s0/(RAND_MAX+1.0);
		printf("%u\t%lf\n", s0, s1);
	}
	close(fd);
}

