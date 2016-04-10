/*
 * view4.c:  program to take the bnd(i,j,k,v,f,ll) geometry-defining routine
 * for relax3d and make a solid, color 3-D rendering.  X graphics to screen.
 * 
 * The program is compiled with the fortran subroutine and linked as in:
 * 
 * cc -c view.c f77 -lV77 -c xxx.f cc view.o $1.o -o view view
 * 
 * where xxx.f is the fortran file containing the bnd() subroutine. 
 * 
 * John Staples, LBNL, Nov 1995
 *
 * Modified for TRIUMF by F.W. Jones, 19-MAR-96:
 *   - Made into a Fortran-callable subroutine with
 *     v, imax, jmax, kmax passed as parameters.
 *   - Global variables made local or encapsulated in a struct
 *   - Cube memory is now dynamically allocated
 *   - Reduced cube array from int to char
 *   - Replaced sleep with with wait-for-expose-event
 * Modified by F.W. Jones, 02-APR-96:
 *   - Window stays open between calls
 *   - Backing store enabled for window
 * NOTE: The following unexplained behaviour occurred with this code:
 *   - When the GPLOT display (dpy) is used, sporadic X protocol errors 
 *     occur.  A separate display has to be opened.
 *   - If backing store is enabled before the window is mapped,
 *     the first expose event does not get delivered and the program
 *     hangs (this does not happen with the GPLOT graphics window).
 * Modified by F.W. Jones, 20-JUN-96: ported to VMS
 */


#include <stdio.h>
#include <math.h>
#ifdef sun
#include <values.h>
#define FLT_MAX MAXFLOAT
#define FLT_MIN MINFLOAT
#else
#include <float.h>
#endif
#include <string.h>
#include <stdlib.h>
#include <stddef.h>
#ifndef VMS
#include <malloc.h>
#endif
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/Xatom.h>

#ifdef VMS
#define view_ view
#endif

#define width 1000
#define height 750

#define comment	"Relax3d Mesh Display"
#define k1	100	/* k1, k2, k3 control the 3D perspective  */
#define k2	 54	/* x_screen = k1 * x + k2 * z  */
#define k3	 45	/* y_screen = k1 * y + k3 * z  */
#define MAXCOLORS 13	/* max distinct colors for electrode potentials  */

#define xloc(X,Y,Z) ((k1 * (X) + k2 * (Z)))
#define yloc(X,Y,Z) ((k1 * (Y) + k3 * (Z)))
#define qqxloc(X) ((width *((X) - rlxv.qqxmin)/(rlxv.qqxmax - rlxv.qqxmin)))
#define qqyloc(Y) ((height*(rlxv.qqymax - (Y))/(rlxv.qqymax - rlxv.qqymin)))

#define zloc(I,J,K) (z[(I) + (J)*(imax+2) + (K)*(imax+2)*(jmax+2)])

Display *dspy;

/*Display *dpy;
**Screen *screen;
*/
/* Global data */
struct {
   Window win; 
   GC gc;
   int qqxmin, qqymin, qqxmax, qqymax;
   float VV[MAXCOLORS];
   int  iVV[MAXCOLORS];
} rlxv;

/* Forward declaration */
void partwirecube(), solidcube(), wirecube(), vsort(), swap();



void view_(vr, imaxr, jmaxr, kmaxr, i1r, i2r, j1r, j2r, k1r, k2r,
           v1r, v2r, inclr)
   float *vr, *v1r, *v2r;
   int *imaxr, *jmaxr, *kmaxr, *i1r, *i2r, *j1r, *j2r, *k1r, *k2r, *inclr;
{
   static Screen *screen;
   static char *display_name = NULL;
   static int screen_num;
   static XColor colorcell;
   static Colormap default_cmap;
   static XGCValues values;

   static unsigned long color[17];
   static int red[] =   {0,100, 80, 80,100,100, 80,100, 60, 60,100,100, 60,
                         80,100, 95, 80};
   static int green[] = {0, 80,100, 80,100, 80,100, 60,100, 60,100, 60,100,
                         80, 98, 95, 80};
   static int blue[]  = {0, 80, 80,100, 80,100,100, 60, 60,100, 60,100,100,
                         80, 94, 95, 80};
   static XPoint xp[5];

   int imin, jmin, kmin;
   int imax, jmax, kmax;
   int imaxv, jmaxv, kmaxv;
   int iin, jin, kin;
   int i, j, k, ll, ii, jj, kk;
   float v, v1, v2, f, p, q, tmp;
   int incl;
   int nV, n, m;
   int z00, z01, z02, z10, z11, z12, z20, z21, z22;
   float hx, hy, hz;
   int nsymm, nmalloc;
   XSetWindowAttributes wa;
   unsigned long wa_mask;
   XEvent TheEvent;
   long event_mask;
   char option[2];
   static char message[100];
   static int init = 0;

   char *z;      /* The cube array */

   if (init != 0) goto initialized;

   if ((dspy = XOpenDisplay(display_name)) == NULL) {
      (void) fprintf(stderr, "Cannot connect to X server %s\n",
                     XDisplayName(display_name));
      return;
   }

   screen = XDefaultScreenOfDisplay(dspy);
   rlxv.win = XCreateSimpleWindow(dspy, XRootWindowOfScreen(screen),
                                  0, 0, width, height, 0, (unsigned long)0,
                                  XWhitePixelOfScreen(screen));

   wa_mask = CWBackingStore;
   wa.backing_store = Always;

/* The following doesn't work -- causes program to hang */
/* rlxv.win = XCreateWindow(dspy, XRootWindowOfScreen(screen),
**                          0, 0, width, height, 0,
**                          XDefaultDepthOfScreen(screen), InputOutput,
**                          XDefaultVisualOfScreen(screen),
**                          wa_mask, &wa);
*/
   rlxv.gc = XCreateGC(dspy, rlxv.win, (unsigned long) 0, &values);
   XSetForeground(dspy, rlxv.gc, XBlackPixelOfScreen(screen));
/* XSetLineAttributes(display, rlxv.gc, 1, LineSolid, CapButt, JoinMiter);
*/
   colorcell.flags = DoRed | DoGreen | DoBlue;
   default_cmap = XDefaultColormapOfScreen(screen);

   for (i = 0 ; i < 17 ; i++) {
      colorcell.red   = 655 * red[i];
      colorcell.green = 655 * green[i];
      colorcell.blue  = 655 * blue[i];
      XAllocColor(dspy, default_cmap, &colorcell);
      color[i] = colorcell.pixel;
   }

/* Wait for expose event on window */
   event_mask = ExposureMask|StructureNotifyMask;
   XSelectInput(dspy, rlxv.win, event_mask);
   XMapWindow(dspy, rlxv.win);
   while (1) {
      XNextEvent(dspy, &TheEvent);
      if (TheEvent.type == Expose && TheEvent.xexpose.count == 0) break;
   }

   XClearWindow(dspy, rlxv.win);
   XChangeProperty(dspy, rlxv.win, XA_WM_NAME, XA_STRING, 8,
                   PropModeReplace, comment, strlen(comment));
/* Enable backing store for the window */
   XChangeWindowAttributes(dspy, rlxv.win, wa_mask, &wa);
   XFlush(dspy);

   init = 1;

initialized:
   iin = *imaxr;
   jin = *jmaxr;
   kin = *kmaxr;

   imin = jmin = kmin = 1;
   nV = 0;
   for (i = 0; i < MAXCOLORS; i++) {
      rlxv.VV[i] = 0.0;
      rlxv.iVV[i] = i;
   }

next:
   imax = abs(iin);
   jmax = abs(jin);
   kmax = abs(kin);

   nmalloc = (imax + 2)*(jmax + 2)*(kmax + 2);

   z = (char *)malloc(nmalloc);
   if (z == NULL) {
      printf("Mesh view: insufficient memory\n");
      return;
   }

   imaxv = imax;
   jmaxv = jmax;
   kmaxv = kmax;
   imin = *i1r;
   jmin = *j1r;
   kmin = *k1r;
   imax = *i2r;
   jmax = *j2r;
   kmax = *k2r;
   v1 = *v1r;
   v2 = *v2r;
   incl = *inclr;
   if (v1 == 0. && v2 == 0.) {
      v1 = -(FLT_MAX);
      v2 = -(FLT_MIN);
   }
   if (v2 < v1) {
      tmp = v1;
      v1 = v2;
      v2 = tmp;
   }

   printf("v1=%g, v2=%g\n", v1, v2);

   rlxv.qqxmin = xloc(imin - 5, jmin - 5, kmin - 5);
   rlxv.qqymin = yloc(imin - 2, jmin - 2, kmin - 2);
   rlxv.qqxmax = xloc(imax + 5, jmax + 5, kmax + 5);
   rlxv.qqymax = yloc(imax + 2, jmax + 2, kmax + 2);

   XSetForeground(dspy, rlxv.gc, color[0]);
   XFillRectangle(dspy, rlxv.win, rlxv.gc, 0, 0, width, height);

   XSetForeground(dspy, rlxv.gc, color[14]);
   XFillRectangle(dspy, rlxv.win, rlxv.gc, 6, 6, width-12, height-12);

   XSetForeground(dspy, rlxv.gc, color[15]);
   solidcube(imin, jmin, kmin, imax, jmax, kmax);

   XSetForeground(dspy, rlxv.gc, color[16]);
   wirecube(imin, jmin, kmin, imax, jmax, kmax);   /* wire cube background */

   p = (float) k2 / (float) k1;
   q = (float) k3 / (float) k1;

/* This loop apparently does not zero enough of the array z.
 * (The problem was originally masked by z being global)
 * Now all of z is zeroed.
 */
/*   printf("Zeroing cube array\n");
**   for (k = 0; k < kmax; k++) {
**      for (i = 0; i < imax + 2; i++) {
**         zloc(i,0,k) = 0;
**         zloc(i,jmax + 1,k) = 0;
**      }
**
**      for (j = 0; j < jmax + 2; j++) {
**         zloc(0,j,k) = 0;
**         zloc(imax + 1,j,k) = 0;
**      }
**   }
*/
   for (n = 0; n < nmalloc; n++) z[n] = 0;

   printf("Getting potentials\n");
   for (i = imin; i <= imax; i++) {   /* step through all mesh points */
      ii = (iin < 0) ? imax + 1 - i : i;   /* if inverted axes */

      for (j = jmin; j <= jmax; j++) {
         jj = (jin < 0) ? jmax + 1 - j : j;

         for (k = kmin; k <= kmax; k++) {
            kk = (kin < 0) ? kmax + 1 - k : k;
            v = vr[(ii-1) + (jj-1)*imaxv + (kk-1)*imaxv*jmaxv];
               zloc(i, j, k) = (v >= v1 && v <= v2);
         }
      }
   }

   printf("Removing hidden cubes\n");
   for (k = kmax - 1; k >= kmin - 1; k--) {
      for (i = imin; i <= imax; i++) {
         for (j = jmin; j <= jmax; j++) {

            if (zloc(i,j,k)) {

               z00 = zloc(i - 1,j - 1,k);
               z10 = zloc(i    ,j - 1,k);
               z20 = zloc(i + 1,j - 1,k);

               z01 = zloc(i - 1,j    ,k);
               z11 = zloc(i    ,j    ,k);
               z21 = zloc(i + 1,j    ,k);

               z02 = zloc(i - 1,j + 1,k);
               z12 = zloc(i    ,j + 1,k);
               z22 = zloc(i + 1,j + 1,k);

               if (z12 + z22 + z11 + z21 >= 4) {

                  for (n = k + 1; n <= kmax; n++) {
                     ii = i - (int) (p * (n - k));
                     jj = j - (int) (q * (n - k));
                                    
                     if ((ii > 0) && (jj > 0)) zloc(ii,jj,n) = 0;
                  }
               }
            }
         }
      }
   }
   
   printf("Displaying mesh\n");
   XClearWindow(dspy, rlxv.win);
   for (i = imin; i <= imax; i++) {   /* step through all mesh points */
      ii = (iin < 0) ? imax + 1 - i : i;   /* if inverted axes */

      for (j = jmin; j <= jmax; j++) {
         jj = (jin < 0) ? jmax + 1 - j : j;

         for (k = kmax; k >= kmin; k--) {
            kk = (kin < 0) ? kmax + 1 - k : k;

            if (zloc(i,j,k)) {

               v = vr[(ii-1) + (jj-1)*imaxv + (kk-1)*imaxv*jmaxv];

/*               if (v < 0.0) {
*/
               if (v >= v1 || v <= v2) {
                  for (n = 1; n < MAXCOLORS; n++) {   /* find color for V */
                     if (rlxv.VV[n] == v) {
                        m = n;
                        goto loop;
                     }
                  }

                  if (nV < MAXCOLORS - 1) {
                     nV++;
                     rlxv.VV[nV] = v;
                     m = nV;
                  } else
                     m = MAXCOLORS;

            loop: XSetForeground(dspy, rlxv.gc, color[m]);
                  solidcube(i, j, k, 1, 1, 1);   /* colored solid cube */
                  XSetForeground(dspy, rlxv.gc, color[0]);
                  partwirecube(i, j, k, 1, 1, 1);

               }
            }
         }
      }
   }

/* Final black wireframe boundaries */
   XSetForeground(dspy, rlxv.gc, color[9]);
   partwirecube(imin, jmin, kmin, imax, jmax, kmax);

   rlxv.qqxmin = 0;
   rlxv.qqxmax = 1000;
   rlxv.qqymin = 0;
   rlxv.qqymax = 1000;

   XSetForeground(dspy, rlxv.gc, color[0]);
   sprintf(message, "Mesh: %d x %d x %d", imax, jmax, kmax);
   XDrawString(dspy, rlxv.win, rlxv.gc, qqxloc(20), qqyloc(955), 
               message, strlen(message));

   vsort(1, nV);      /* sort and print voltage indices */
   for (i = 1; i <= nV; i++) {
      xp[0].x = (short) qqxloc(20);
      xp[0].y = (short) qqyloc(950 - 30*i);
      xp[1].x = (short) qqxloc(35);
      xp[1].y = (short) qqyloc(950 - 30*i);
      xp[2].x = (short) qqxloc(35);
      xp[2].y = (short) qqyloc(970 - 30*i);
      xp[3].x = (short) qqxloc(20);
      xp[3].y = (short) qqyloc(970 - 30*i);
      xp[4].x = (short) qqxloc(20);
      xp[4].y = (short) qqyloc(950 - 30*i);
      XSetForeground(dspy, rlxv.gc, color[rlxv.iVV[i]]);
      XFillPolygon(dspy, rlxv.win, rlxv.gc, xp, 5, Convex, CoordModeOrigin);
      XSetForeground(dspy, rlxv.gc, color[0]);
      XDrawLines(dspy, rlxv.win, rlxv.gc, xp, 5, CoordModeOrigin);
/*      sprintf(message, "%2.1f", -rlxv.VV[i]);
*/
      sprintf(message, "%2.1f", rlxv.VV[i]);
      XDrawString(dspy, rlxv.win, rlxv.gc, qqxloc(45), qqyloc(953-30*i),
                  message, strlen(message));
   }
   XFlush(dspy);
   free(z);
   return;
}


void
line3(i, j, k, p, q, r)
   int i, j, k, p, q, r;

{
   XDrawLine(dspy, rlxv.win, rlxv.gc, 
             qqxloc(xloc(i, j, k)), qqyloc(yloc(i, j, k)),
             qqxloc(xloc(p, q, r)), qqyloc(yloc(p, q, r)));
}


void
solidcube(i, j, k, a, b, c)      /* polygon outline of solid cube  */
   int i, j, k, a, b, c;
{
   static XPoint xp[7];

   xp[0].x = (short) qqxloc(xloc(i    , j    , k    ));
   xp[0].y = (short) qqyloc(yloc(i    , j    , k    ));
   xp[1].x = (short) qqxloc(xloc(i + a, j    , k    ));
   xp[1].y = (short) qqyloc(yloc(i + a, j    , k    ));
   xp[2].x = (short) qqxloc(xloc(i + a, j    , k + c));
   xp[2].y = (short) qqyloc(yloc(i + a, j    , k + c));
   xp[3].x = (short) qqxloc(xloc(i + a, j + b, k + c));
   xp[3].y = (short) qqyloc(yloc(i + a, j + b, k + c));
   xp[4].x = (short) qqxloc(xloc(i    , j + b, k + c));
   xp[4].y = (short) qqyloc(yloc(i    , j + b, k + c));
   xp[5].x = (short) qqxloc(xloc(i    , j + b, k    ));
   xp[5].y = (short) qqyloc(yloc(i    , j + b, k    ));
   xp[6].x = (short) qqxloc(xloc(i    , j    , k    ));
   xp[6].y = (short) qqyloc(yloc(i    , j    , k    )); 
   XFillPolygon(dspy, rlxv.win, rlxv.gc, xp, 7, Convex, CoordModeOrigin);
}


void
partwirecube(i, j, k, a, b, c)   /* solid cube  */
   int i, j, k, a, b, c;   /* origin = i,j,k, size = a,b,c  */

{
   line3(i    , j    , k    , i + a, j    , k    );
   line3(i + a, j    , k    , i + a, j + b, k    );
   line3(i + a, j + b, k    , i    , j + b, k    );
   line3(i    , j + b, k    , i    , j    , k    );

   line3(i + a, j    , k + c, i + a, j + b, k + c);
   line3(i + a, j + b, k + c, i    , j + b, k + c);

   line3(i + a, j    , k    , i + a, j    , k + c);
   line3(i + a, j + b, k    , i + a, j + b, k + c);
   line3(i    , j + b, k    , i    , j + b, k + c);
}

void
wirecube(i, j, k, a, b, c)   /* wireframe cube  */
   int i, j, k, a, b, c;   /* origin = i,j,k, size = a,b,c  */
{
   line3(i    , j    , k    , i + a, j    , k    );
   line3(i + a, j    , k    , i + a, j + b, k    );
   line3(i + a, j + b, k    , i    , j + b, k    );
   line3(i    , j + b, k    , i    , j    , k    );

   line3(i    , j    , k + c, i + a, j    , k + c);
   line3(i + a, j    , k + c, i + a, j + b, k + c);
   line3(i + a, j + b, k + c, i    , j + b, k + c);
   line3(i    , j + b, k + c, i    , j    , k + c);

   line3(i + a, j    , k    , i + a, j    , k + c);
   line3(i + a, j + b, k    , i + a, j + b, k + c);
   line3(i    , j + b, k    , i    , j + b, k + c);
   line3(i    , j    , k    , i    , j    , k + c);
}


void
swap(i, j)
   int i, j;
{
   float r;
   int t;

   r = rlxv.VV[i];
   rlxv.VV[i] = rlxv.VV[j];
   rlxv.VV[j] = r;

   t = rlxv.iVV[i];
   rlxv.iVV[i] = rlxv.iVV[j];
   rlxv.iVV[j] = t;
}


void
vsort(left, right)
   int left, right;
{
   int i, last;

   if (left >= right)
      return;
   swap(left, (left + right) / 2);
   last = left;
   for (i = left + 1; i <= right; i++)
      if (rlxv.VV[i] > rlxv.VV[left])
         swap(++last, i);
   swap(left, last);
   vsort(left, last - 1);
   vsort(last + 1, right);
}
