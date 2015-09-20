#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char**argv)
{
	int nlines;
	if (argc<2)
	{
		nlines = 0;
	}
	else
	{
		nlines = atoi(argv[1]);
	}

	FILE *fp;
	char *line = NULL;
	size_t len = 0;
	ssize_t read;
	fp = fopen("/dev/stdin","r");
	if (fp == NULL) exit(EXIT_FAILURE);
	
	int i;
	for (i=0; i<nlines; i++)
	{
		if ((read = getline(&line, &len, fp)) == -1)
		{
			free(line);
			exit(EXIT_SUCCESS);
		}
	}
	
	while ((read = getline(&line, &len, fp)) != -1)
	{
		/*printf("Retrieved line of length %zu : ", read);*/
		printf("%s", line);
	}
	
	free(line);
	exit(EXIT_SUCCESS);
}

