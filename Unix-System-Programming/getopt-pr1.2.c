#include "stdio.h"
#include "unistd.h"

extern char *optarg;
extern int optind, opterr, optopt;


int main(int argc, char**argv)
{
    int opt;
    char *opt_arg;
    while((opt=getopt(argc,argv,"a:o:"))!=-1)
    {
        switch(opt)
        {
            case 'a':
                printf("Option a\n");
                opt_arg = optarg;
                printf("Option argument %s\n", opt_arg);
                break;
            case 'o':
                printf("Option o\n");
                opt_arg = optarg;
                printf("Option argument %s\n", opt_arg);
                break;
            case '?':
            default:
                fprintf(stderr, "option-%c is invalid: ignored\n", optopt);
        }
    }
    return 0;
}

