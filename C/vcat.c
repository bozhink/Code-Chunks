#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>


int main(int argc, char *argv[])
{
    if (argc < 2) 
    {
        printf("Usage: %s <fname1> <fname2>...\n",argv[0]);
        exit(1);
    }
    int i, j;
    int fnum = argc-1;
    int fp[fnum];
    for (i=0; i<fnum; i++)
    {
        if ((fp[i]=open(argv[i+1],O_RDONLY)) == -1)
        {
            perror("open");
            exit(2);
        }
    }
    
    int nbytes=0;
    char buf[1];
    for (i=0; i<fnum; i++)
    {
        nbytes=read(fp[i],buf,1);
        while (buf!='\n')
        {
            printf("%c",buf);
            nbytes=read(fp[i],buf,1);
        }
    }
    while ((nbytes=read(fdesc,buf,1))>0)
    {
        if(write(1,buf,1)!=nbytes)
        {
            perror("write");
            break;
        }
    }
    if (nbytes==-1) perror("read");
    
    return(0);
}
