#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char**argv)
{
	char comment='#';
	if (argc>=2)
	{
		comment=argv[1][0];
	}

	FILE *fp;
	char *line = NULL;
	size_t len = 0;
	ssize_t read;
	fp = fopen("/dev/stdin","r");
	if (fp == NULL) exit(EXIT_FAILURE);
	
	while ((read = getline(&line, &len, fp)) != -1)
	{
		/*printf("Retrieved line of length %zu : ", read);*/
		if (line[0]!=comment) printf("%s", line);
	}
	
	free(line);
	exit(EXIT_SUCCESS);
}

