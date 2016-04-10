/* 
 * File:   main.c
 * Author: bozhin
 *
 * Created on October 24, 2012, 5:17 PM
 *
 * Cmpile with: -lsocket -lnsl (Solaris)
 * Usage: ./a.out <remote host> <remote file> <local file>
 */

#include <stdio.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <netdb.h>
#include <string.h>
#define SERVER_PORT 2121

void fatal (char*err, int how);

int fd, sockfd;
int rd_len, wrt_len;

int main(int argc, char** argv)
{
    char buf[BUFSIZ];
    struct sockaddr_in addr_serv;
    struct hostent *hp;
    if (argc!=4)
    {
        fprintf(stderr, "Usage: %s <host> <remote file> <local file>\n", argv[0]);
        exit(1);
    }

    if ( (sockfd=socket(PF_INET, SOCK_STREAM, 0))==-1 )
        fatal ("socket", 0);

    //Gets address ofremote host
    if ( (hp=gethostbyname(argv[1])) == 0 )
        fatal("client-unknown host", 1);

    //Formating address structure of server
    memset(&addr_serv, '\0', sizeof(addr_serv));
    addr_serv.sin_family=(sa_family_t) hp->h_addrtype;
    addr_serv.sin_port=htons( (in_port_t)SERVER_PORT );
    addr_serv.sin_addr.s_addr=*(in_addr_t*)hp->h_addr; // OR hr->h_addr_list[0]

    //Port is immediately available for next use
    /*
     * int option=1;
     * if (setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, (char*)&option, sizeof(int))<0)
     *    fatal("setsockopt",1);
     */

    //Connectiong to host
    if (connect(sockfd, (struct sockaddr*)&addr_serv, sizeof(addr_serv))<0)
        fatal("connect", 1);

    //Lenght of remote file name
    rd_len=strlen(argv[2])+1;

    //Send name
    if (send(sockfd, argv[2], rd_len, 0)!=rd_len)
        fatal("send", 2);
    fprintf(stderr, "Client: connection for %s succeeds.\n", argv[2]);

    //Close write connection
    shutdown(sockfd, SHUT_WR);

    //Open local file
    if ( (fd=open(argv[3],O_WRONLY | O_CREAT | O_TRUNC | S_IRWXU | S_IRGRP | S_IXGRP)) < 0 )
        fatal("open", 3);

    //Reading remote file and writing local file
    int bytes=0; //Number of trnsmitted bytes
    while ( (rd_len=recv(sockfd, buf, sizeof(buf), 0)) != 0 )
    {
        if (rd_len==-1)
        {
            unlink(argv[3]);
            fatal("client-recv", 3);
        }
        if (((wrt_len=write(fd, buf, rd_len))==-1) || (wrt_len!=rd_len))
        {
            unlink(argv[3]);
            fatal("clent-write",3);
        }
        bytes=bytes+wrt_len;
    }

    fprintf(stderr, "client: data (%d bytes) transfer completed.\n", bytes);
    close(sockfd);
    close(fd);
    return (EXIT_SUCCESS);
}

void fatal (char *err, int how)
{
    perror(err);
    if (how==1)
        close(sockfd);
    if (how==2)
    {
        shutdown(sockfd, 1);
        close(sockfd);
    }
    if (how==3)
    {
        shutdown(sockfd, 0);
        close(sockfd);
    }
    exit(1);
}
