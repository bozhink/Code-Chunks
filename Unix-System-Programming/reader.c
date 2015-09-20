#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>

int main(void)
{
    int fdesc, nbytes=0;
    char buf[5];
    if ((fdesc=open("test",O_RDONLY)) == -1)
    {
        perror("open");
        exit(1);
    }
    while ((nbytes=read(fdesc,buf,5))>0)
    {
        if(write(1,buf,5)!=nbytes)
        {
            perror("write");
            break;
        }
    }
    if (nbytes==-1) perror("read");
    return(0);
}
