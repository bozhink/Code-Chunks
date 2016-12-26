/*
 * File:   xint2d.c
 * Author: bozhin
 *
 * Created on December 5, 2012, 11:20 PM
 */
#ifndef NX
#define NX 31
#endif
#ifndef NY
#define NY 31
#endif

void xinteg(int nx, int ny, int y, double hx, double fdata[NX][NY], double*integral) {
    double c1=1.0/3.0;
    double c2=4.0/3.0;
    double c3=2.0/3.0;
    double sum=0.0;
    int x;
    sum = c1 * (fdata[0][y] + fdata[nx-1][y]) + c2 * fdata[nx-2][y];
    for (x=1; x<nx-3; x+=2) {
        sum += c2*fdata[x][y] + c3*fdata[x+1][y];
    }
    *integral = hx * sum;
}

void yinteg(int nx, int ny, double hx, double hy, double fdata[NX][NY], double*integral) {
    double c1=1.0/3.0;
    double c2=4.0/3.0;
    double c3=2.0/3.0;
    double sum=0.0;
    int y, y1;
    y=0;
    xinteg(nx, ny, y, hx, fdata, integral);
    sum = *integral;
    y=ny-1;
    xinteg(nx, ny, y, hx, fdata, integral);
    sum = c1*(sum + *integral);
    y=ny-2;
    xinteg(nx, ny, y, hx, fdata, integral);
    sum += *integral * c2;
    for (y=1; y<ny-3; y+=2) {
        y1 = y+1;
        xinteg(nx, ny, y, hx, fdata, integral);
        sum += *integral * c2;
        xinteg(nx, ny, y1, hx, fdata, integral);
        sum += *integral * c3;
    }
    *integral = hy*sum;
}
