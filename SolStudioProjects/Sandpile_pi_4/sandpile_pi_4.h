/* 
 * File:   sandpile_pi_4.h
 * Author: bozhin
 *
 * Created on Събота, 2013, Март 30, 18:38
 */

#ifndef SANDPILE_PI_4_H
#define	SANDPILE_PI_4_H

#include <stdio.h>
#include <stdlib.h>
static int reset;

class SandpilePi4 {
    unsigned **lattice; /* Lattice array */
    unsigned *row1, *row2;
    int *arow1, *arow2;
    int **area;
    int left, right, ileft, iright;
    int t;        /* Avalanche's length */
    int s;        /* Avalanche's size */
    int a;        /* Avalanche's area */
    int X;        /* Maximal transversal extent */
    int Z, ALPHA, MU, L, L1;
public:
    SandpilePi4(int, int); // SandpilePi4( Z, L)
    SandpilePi4(int, int, int); // SandpilePi4( ALPHA, MU, L)
    ~SandpilePi4();
    static const int THRESHOLD = 2;
    static const int THRESHOLD2 = THRESHOLD / 2;
    void init();
    void finalize();
    void randomizeAll();
    void randomize();
    void update();
    void update1();
    bool updaterow(int, int, int*, int*);
    bool updaterow1(int, int, int*, int*);
    inline int get_t() { return t; }
    inline int get_s() { return s; }
    inline int get_a() { return a; }
    inline int get_x() { return X; }
};


#endif	/* SANDPILE_PI_4_H */

