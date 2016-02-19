/* 
 * File:   main.c
 * Author: bozhin
 *
 * Created on October 24, 2012, 3:24 PM
 *
 * Server program
 * compile with -lsocket -lnsl (for Solaris)
 * start with &
 */


#include <stdio.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <netinet/in.h>
#include <netdb.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>
#include <sys/param.h>
#include <string.h>
#include <errno.h>
#define NAMELEN 64 //Length of local computer's name
#define PORT 2121  //Comunication portof the server
#define MAX_CHILD 10 // Maximal number of child precesses
int sockfd, sockfd_slave; // socket descriptors
void p_error(char error[], int errnum, int how);



int main(void) {
    struct sockaddr_in addr, addr_cl;
    struct hostent *hp;
    int children_count=0;      // Counter for child processes
    int flags;                 // Socket flags
    char localhost[NAMELEN+1];
    
    fprintf(stderr,"\nServer. For possible errors see file err.log\n");

    /*
     * Begin demonisation
     */
    int i;
    for (i=0; i<NOFILE; ++i) //OR for(int i=0, int f=getdtablesize(); i<f; i++)
        (void) close(i); // Closing all opened files
    switch (fork()) {
        case -1:
            p_error("1st fork", errno, 0); //ERROR
        default:
            exit(0); //Terminating the first parent process
        case 0: //First child process (strting new session)
        {
            if (setsid()==-1) //The child becomes a leader of the new session
                p_error("setsid", errno, 0);
            //Asurering contra future attaching to a controlling terminal
            if (signal(SIGHUP, SIG_IGN)==SIG_ERR)
                p_error("SIGHUP", errno, 0);
            switch (fork()) //Second child process
            {
                case -1: p_error("2nd fork", errno, 0); //ERROR
                case 0: umask(0); break; //Second child process. It is not a session leader
                default: exit(0);
            }
        }
    }

    //if (chdir("/tmp")<0) p_error("chdir", errno, 0);
    if (signal(SIGCHLD, SIG_IGN)==SIG_ERR)
        p_error("SIGCHLD", errno, 0);
    // Assiciating file descriptors 0, 1, & 2 to /dev/null
    int fd0, fd1, fd2;
    fd0 = open("/dev/null", O_RDWR);
    fd1 = dup(0);
    fd2 = dup(0);
    /*
     * End demonisation
     */
    /*
     * Creation of stream socket in internet-domain with default protocol.
     * Use
     *    getprotobyname("tcp")
     * or
     *    IPPROTO_TCP
     * for more protocols.
     */
    if ( (sockfd=socket(PF_INET, SOCK_STREAM, 0)) == -1 )
        p_error("socket", errno, 0);
    // Geting name of local computer and information about it
    if ( (gethostname(localhost, NAMELEN)==-1) || (hp=gethostbyname(localhost))==0 )
        p_error("getting host name", errno, 1);
    memset(&addr, 0, sizeof(addr));
    memset(&addr_cl, 0, sizeof(addr_cl));

    //Formation of address of the local machine
    addr.sin_family = (sa_family_t) hp->h_addrtype; //AF_INET
    addr.sin_port = htons((in_port_t) PORT);
    addr.sin_addr.s_addr = *(in_addr_t *)hp->h_addr; //Internet address

    // Assosiation of an addtress to the socket
    if (bind(sockfd, (struct sockaddr *) &addr, sizeof(addr)) == -1 )
        p_error("bind", errno, 1);

    //Preparing socket for receiving queues
    if (listen(sockfd,5) == -1) // recieve up to 5 queues
        p_error("listen", errno, 1);

    // If the socket must be non-blocking (accept returns immediately), use
    /*
     * if ( (flags=fcntl(sockfd, F_GETFL))==-1 ||
     *   fcntl(sockfd, F_SETFL, flags | O_NONBLOCK) ==-1)
     *     p_error("fcntl", errno, 1);
     *
     * OR
     * int flag=1; //non-blocking socket; =0;//blocking socket
     * ioctl(sockfd, FIONBIO, &flag);
     */

    /*
     * Recieving and executing client queues
     */
    for (;;)
    {
        while (children_count >= MAX_CHILD); // Checking number of childs
        //Create new socket after establishing of connection with a client socket
        socklen_t addrlen = sizeof(addr_cl); // Length of addr_cl
        if ( (sockfd_slave=accept(sockfd,(struct sockaddr*) &addr_cl, &addrlen)) < 0 )
        {
            p_error("accept", errno, 2);
            continue;
        }
        //Create child-process for executing the queue
        switch (fork())
        {
            case -1:
                p_error("fork client", errno, 3);
                continue;
            case 0:
            {
                char addrcl[4], filename[256], buf[BUFSIZ];
                int cnt, fd;
                close (sockfd);
                //Get client IP-address
                *addrcl = ntohl(addr_cl.sin_addr.s_addr);
                //Read file name
                if ( (cnt=read(sockfd_slave, filename, 255)) == -1 )
                    p_error("read a filename:", errno, 4);
                //Close the socket for reading
                if ( shutdown(sockfd_slave, SHUT_RD) == -1 )
                    p_error("shutdown:", errno, 2);
                //Open the file with recieved name for reading
                if ( (fd=open(filename, O_RDONLY)) == -1 )
                    p_error("open:", errno, 5);
                //Read file and send it to the client
                while ( (cnt=read(fd, buf, sizeof(buf))) != 0 )
                {
                    if (cnt==-1)
                        p_error("read a file:", errno, 5);
                    if (write(sockfd_slave, buf, cnt)!=cnt)
                        p_error("write:", errno, 5);
                }
                // Close the new write socket and destroy it
                if (shutdown(sockfd_slave, SHUT_WR)==-1)
                    p_error("shutdown:",errno,2);
                if (close(sockfd_slave)==-1)
                    p_error("close:",errno,2);
                //Child terminates
                exit(0);
            }
        }
        //Parent closes the new descriptor
        children_count++; //Increments number of created childs
        if (close(sockfd_slave)==-1)
            p_error("close:", errno, 2);
    }
}

/*
 * The following function writes error messages to the file err.log
 * and optionally terminates server program
 */
void p_error(char error[], int errnum, int how) {
    FILE *fp;
    if ((fp=fopen("err.log","a"))==0) {
        fclose(fp);
        exit(1);
    }
    fprintf (fp, "%s error #%d\n",error,errnum);
    fclose(fp);
    if (how==0)
        exit(2);
    if (how==1) {
        close(sockfd);
        exit(3);
    }
    if (how==2)
        return;
    if (how==3) {
        shutdown(sockfd_slave, 0);
        close(sockfd_slave);
        return;
    }
    if (how==4) {
        shutdown(sockfd_slave, 0);
        close(sockfd_slave);
        exit(4);
    }
    if (how==5) {
        shutdown(sockfd_slave, 1);
        close(sockfd_slave);
        exit(5);
    }
}
