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
	
	unsigned s0, s1, sn;
	unsigned t = 65536;
	if ( read(fd, &s0, sizeof(s0))<=0 || read(fd, &s1, sizeof(s1))<=0 )
	{
		perror("Cannot read random data");
	}
	printf("%u %u\n", s0,s1);
	
	for (int i=0; i<N; i++)
	{
		sn = (s1 & s0) % t;
		s0 = s1;
		s1 = sn;
		printf("%u\n",sn);
	}
	
	close(fd);
}

