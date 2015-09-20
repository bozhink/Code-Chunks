#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <termios.h>

/*
 * 'open_port()' - Open serial port 1.
 *
 * Returns the file descriptor on success or -1 on error.
 */
 
int open_port(void)
{
	int fd; /*File descriptor for the port*/
	char *SerialPort = "/dev/ttyS0";
	
	fd = open(SerialPort, O_RDWR | O_NOCTTY | O_NDELAY);
	
	if (fd == -1)
	{
		/* Could not open the port */
		perror("open_port: Unable to open /dev/ttyS0 - ");
	}
	else
	{
		fcntl(fd, F_SETFL, 0);
	}
	
	return (fd);
}

int open_port_(char *SerialPort)
{
	int fd; /*File descriptor for the port*/
	
	fd = open(SerialPort, O_RDWR | O_NOCTTY | O_NDELAY);
	
	if (fd == -1)
	{
		/* Could not open the port */
		perror("open_port: Unable to open /dev/ttyS0 - ");
	}
	else
	{
		fcntl(fd, F_SETFL, 0);
	}
	
	return (fd);
}

