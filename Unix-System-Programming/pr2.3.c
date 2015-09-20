#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <errno.h>
#include <string.h>
#include <stdlib.h>

int main(void) {
	pid_t pid;
	pid = fork();
	if (pid < (pid_t)0) {
		fprintf(stderr, "Unable to create a child. %s\n", strerror(errno));
		return EXIT_FAILURE;
	}
	else if (pid > (pid_t)0) {
		fprintf(stderr,"The parent is running.\n");
		return EXIT_SUCCESS;
	}
	else {
		fprintf(stderr, "The child is running.\n");
		execl("/usr/bin/who","who",NULL);
		fprintf(stderr,"ececl: %s\n", strerror(errno));
		return EXIT_FAILURE;
	}
}

