#include <signal.h>
#include <unistd.h>
#include <termios.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/ioctl.h>

struct winsize curr_size;

static void on_sigwinch(int); // Манипулатор за сигнала SIGWINCH

int main(void)
{
	if (isatty(STDIN_FILENO)==0) // Проверка дали стандартният вход е от терминал
	{
		perror("isatty");
		exit(1);
	}
	if (signal(SIGWINCH, on_sigwinch)==SIG_ERR) // Прихваща сигнала
	{
		perror("signal");
		exit(2);
	}
	if (ioctl(STDIN_FILENO,TIOCGWINSZ,&curr_size)==-1) // Чете размера на терминалния прозорец
	{
		perror("ioctl 1");
		exit(3);
	}
	printf("Current window size: rows=%d, columns=%d\n", curr_size.ws_row, curr_size.ws_col);
	return(0);
}

static void on_sigwinch(int sig)
{
	printf("Catches signal SIGWINCH\n");
	if (ioctl(0,TIOCGWINSZ,&curr_size)==-1)
	{
		perror("ioctl 3");
		exit(5);
	}
	printf("New window size: rows=%d, columns=%d\n", curr_size.ws_row, curr_size.ws_col);
}

