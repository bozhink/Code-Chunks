#include <stdlib.h>

int main(int argc,char**argv)
{
	char *SerialPort;
	if (argc < 2) SerialPort="/dev/ttyS0";
	else SerialPort = argv[1];
	
	int fd = open_port_(SerialPort);
	/* Writing data to the port - use the write(2) system call */
	int n = write(fd, "ATZ\r",4);
	if (n<0) fputs("Write() of 4 bytes failed!\n","/dev/stderr");
	
	close(fd);
}

