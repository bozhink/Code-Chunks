#include <sys/stat.h>
//#include <sys/mkdev.h>
#include <stdio.h>
#include <stdlib.h>

struct stat buf;

int main (int argc, char **argv)
{
    if (argc!=2)
    {
        printf("Usage: %s <file_name>\n",argv[0]);
        exit(1);
    }
    if (stat(argv[1],&buf))
    {
        perror("stat:");
        exit(2);
    }
    printf("File is on device: %d%d\n", major(buf.st_dev), minor(buf.st_dev));
    printf("File owner: %d group: %d\n", buf.st_uid, buf.st_gid);
    printf("File permissions: %o\n", buf.st_mode & 0777);
    printf("File type: ");
    switch (buf.st_mode & S_IFMT)
    {
        case S_IFREG: printf("disk file\n"); break;
        case S_IFDIR: printf("directory\n"); break;
        case S_IFCHR: printf("byte device file\n"); break;
        case S_IFBLK: printf("block device file\n"); break;
        case S_IFLNK: printf("symbolic link\n"); break;
        case S_IFIFO: printf("FIFO-file\n"); break;
    }
    printf("Access rights of the owner: ");
    if (buf.st_mode & S_IRUSR) printf("read ");
    if (buf.st_mode & S_IWUSR) printf("write ");
    if (buf.st_mode & S_IXUSR) printf("execute ");
    printf("\nFile length: %d bytes\n", buf.st_size);
    printf("%o\n",buf.st_mode);
    return 0;
}

