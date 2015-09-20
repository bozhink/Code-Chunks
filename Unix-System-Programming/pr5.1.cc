/*
 * file pr5.1.cc
 * calling sequence ./pr5.1 filename
 */
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <iostream>
using namespace std;

FILE*file_pt;
// int fd;
// char temp_name[]="/usr/tmp/tmp_XXXXXX";

static void on_intr (int catch_sig) {
    char go_on;
    cout << "Interrupt (signal " << catch_sig << ") is caught. Go on? [y]\n";
    cin >> go_on;
    if (go_on == 'y') {
        signal (SIGINT, on_intr);
        return;
    }
    // close(fd); unlink(temp_name);
    exit (1);
}

int main (int argc, char**argv) {
    char niz[120];
    if ( (signal(SIGINT, on_intr)) == SIG_ERR ) {
        perror("signal");
        exit(2);
    }
    if ((file_pt=fopen(argv[1], "r")) == NULL) {
        perror("fopen");
        exit(3);
    }
    while ((fgets(niz, 120, file_pt)) != NULL) {
        fputs (niz, stdout);
        sleep(1);
    }
    //if ((fd=mkstemp(temp_name))==-1) {
    //    perror ("temp");
        exit(1);
    //}
    fclose (file_pt);
    return 0;
}
