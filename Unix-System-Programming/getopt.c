#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#define _GNU_SOURCE
#include <getopt.h>

int main (int argc, char *argv[], char *envp[])
{
	int i;
	int opt;
	char *opt_arg;
	extern int optind, opterr, optopt;
	
	while ( (opt = getopt(argc,argv,"ao:")) != -1 )
	{
		switch (opt)
		{
			case 'a': printf("There is -a option\n"); break;
			case 'o': printf("There is -o option\n"); break;
			case ':': fprintf(stderr,"option -%c requires an srgument\n",optopt);
			case '?':
			default: fprintf(stderr,"option -%c id invalid: ignored\n",optopt);
		}
	}
	return 0;
}

