#include <stdio.h>    /* Standars input/output definitions */
#include <string.h>   /* String function definitions */
#include <unistd.h>  /* UNIX standerd function definitions */
#include <fcntl.h>    /* File control definitions */
#include <errno.h>    /* Error number definitions */
#include <termios.h>  /* POSIX terminal control definitions */

/*
 *
 * 'open_port()' - Open serial port 1.
 *
 * Returns the file descriptor on success or -1 on error.
 */

int open_port(void)
{
	int fd; /* File descriptor for the port */
	
	fd=open("/dev/ttyS0", O_RDWR | O_NOCTTY | O_NDELAY);
	if (fd==-1)
	{
		/*
		 * Could not p[en the prot
		 */
		 
		 perror("open_port: Unable to open /dev/ttyS0 - ");
	}
	else
		fcntl(fd, F_SETFL, 0);
	
	return (fd);
}

int main(void)
{
	int fd = open_port();
	if (fd<0) return -1;
	int n = write(fd, "ATZ\r", 4);
	if (n<0)
	{
		fputs("write() of 4 bytes failed!\n",stderr);
		close(fd);
		return -2;
	}
	printf("%d bytes writed\n",n);
	close(fd);
	return 0;
	
}

