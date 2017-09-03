#include <stdio.h>
#include <errno.h>
#include <sys/types.h>
#include <dirent.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

int filter(const struct dirent *dirfd) {
	return (dirfd->d_name[0] != '.');
}

int main () {
	struct dirent **namelist;
	int n_entries, j;
	char dirname[PATH_MAX];
	
	if (getcwd(dirname, 256) == NULL) {
		perror("getcwd");
		exit(1);
	}
	
	if ((n_entries = scandir(dirname, &namelist, filter, alphasort)) < 0) {
		fprintf(stderr, "scandir failed: %s\n", strerror(errno));
		exit(2);
	}
	
	for (j = 0; j < n_entries; j++) {
		fprintf(stderr, "%s\n", namelist[j]->d_name);
		free(namelist[j]);
	}
	
	return 0;
}
	
