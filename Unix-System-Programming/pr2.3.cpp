#include <sys/types.h>
#include <unistd.h>
#include <iostream>
#include <stdlib.h>
#include <stdio.h>
#include <sys/wait.h>
using namespace std;

int main(void) {
	pid_t childpid;
	int status;
	switch (childpid = fork()) {
		case -1: perror("Fork failed"); exit(1);
		case  0: puts("Child. Inserted exit code!");
			 scanf("%d\n", &status); exit(status);
		default :
			cerr << "Parent. I am 'waiting' child status.\n";
			while (wait(&status)!=childpid);
			cerr << "Parent. Child ";
			if (WIFEXITED(status))
				cerr << childpid << " terminated: " << WEXITSTATUS(status) << endl;
			else if (WIFSIGNALED(status))
				cerr << childpid << " killed by: " << WTERMSIG(status) << endl;
			else if (WIFSTOPPED(status))
				cerr << childpid << " stopped by: " << WSTOPSIG(status) << endl;
			else {
				perror("wait failed");
				exit(2);
			}
			return (0);
	}
}

