#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>
#include "dislin.h"

float xray[300], yray[300], y1ray[100], y2ray[100], zmat[50][50];

float zfun   (float x, float y, int iopt);
void header  (char *cdev);
int  option  (void);
void exa_1   (void);
void exa_2   (void);
void exa_3   (void);
void exa_4   (void);
void exa_5   (void);
void exa_6   (void);
void exa_7   (void);
void exa_8   (void);
void exa_9   (void);
void exa_10  (void);
void exa_11  (void);
void exa_12  (void);
void exa_13  (void);
void exa_14  (void);
void exa6_1  (void);
void exa10_1 (void);
void exa10_2 (void);
void exa10_3 (void);
void exa11_1 (void);
void exa12_1 (void);
void exa12_2 (void);
void exa13_1 (void);
void exa13_2 (void);
void exa13_3 (void);
void exa13_4 (void);
void exa14_1 (void);
void exa14_2 (void);

int main()
{ int iopt;
  char cdev[20];

L1: header(cdev);
L2: iopt = option(); 

  metafl(cdev);
  setpag("da4l");

  switch (iopt)
  { case  1: exa_1();
             break;
    case  2: exa_2();
             break;
    case  3: exa_3();
             break;
    case  4: exa_4();
             break;
    case  5: exa_5();
             break;
    case  6: exa_6();
             break;
    case  7: exa_7();
             break;
    case  8: exa_8();
             break;
    case  9: exa_9();
             break;
    case 10: exa_10();
             break;
    case 11: exa_11();
             break;
    case 12: exa12_1();
             break;
    case 13: exa12_2();
             break;
    case 14: exa_12();
             break;
    case 15: exa13_1();
             break;
    case 16: exa13_2();
             break;
    case 17: exa13_3();
             break;
    case 18: exa13_4();
             break;
    case 19: exa10_1();
             break;
    case 20: exa10_2();
             break;
    case 21: exa10_3();
             break;
    case 22: exa14_1();
             break;
    case 23: exa14_2();
             break;
    case 24: exa6_1();
             break;
    case 25: exa11_1();
             break;
    case 26: exa_13();
             break;
    case 27: exa_14();
             break;
    case 30: goto L1;
    case  0: exit(0);
  }

  printf("\n    Press RETURN to continue ...");
  while (getchar() != '\n')
       ;
  getchar();
  printf("\n");
  goto L2;
}

/* >>>>>>>>>> EXA_1  <<<<<<<<<< */
void exa_1(void)
{ int n = 100, i;
  double fpi = 3.1415926/180., step, x;

  step = 360. / (n-1);

  for (i = 0; i < n; i++)
  { xray[i] = i * step;
    x = xray[i] * fpi;
    y1ray[i] = sin(x);
    y2ray[i] = cos(x);
  }

  disini();
  pagera();
  complx();
  axspos(450,1800);
  axslen(2200,1200);

  name("X-axis","x");
  name("Y-axis","y");

  labdig(-1,"x");
  ticks(10,"xy");

  titlin("Demonstration of CURVE",1);
  titlin("SIN(X), COS(X)",3);

  graf(0.,360.,0.,90.,-1.,1.,-1.,0.5);
  title();

  color("red");
  curve(xray,y1ray,n);
  color("green");
  curve(xray,y2ray,n);

  color("fore");
  dash();
  xaxgit();

  disfin();
}

/* >>>>>>>>>> EXA_2  <<<<<<<<<< */
void exa_2()
{ int n = 300, m = 10, i;
  double f = 3.1415926/180., step, a;
  float x2[10], y2[10];
  
  step = 360. / (n-1);

  for (i = 0; i < n; i++)
  { a = i * step * f;
    yray[i] = (float) a;
    xray[i] = (float) sin(5 * a);
  }

  for (i = 0; i < m; i++)
  { x2[i] = i + 1;
    y2[i] = i + 1;
  }

  setpag ("da4p");
  disini ();
  pagera ();
  complx ();
  axspos (450,1800);

  titlin ("Polar Plots", 2);
  ticks  (3, "Y");
  axends ("NOENDS", "X");
  labdig (-1, "Y");
  axslen (1000, 1000);
  axsorg (1050, 900);

  grafp  (1.f ,0.f, 0.2f, 0.f, 30.f);
  curve  (xray, yray, n);
  htitle (50);
  title  ();
  endgrf ();

  labdig (-1, "X");
  axsorg (1050, 2250);
  labtyp ("VERT", "Y");
  grafp  (10.f, 0.f, 2.f, 0.f, 30.f);
  barwth (-5.f);
  polcrv ("FBARS");
  curve  (x2, y2, m);
             
  disfin();
}

/* >>>>>>>>>> EXA_3  <<<<<<<<<< */
void exa_3(void)
{ int nl, ny, i, nxp;
  static char ctit[] = "Symbols", cstr[3];

  setpag("da4p");
  disini();
  pagera();
  color("yellow");
  complx();
  paghdr("H. Michels  (",")",2,0); 

  height(60);

  nl = nlmess(ctit);
  messag(ctit,(2100-nl)/2,200);

  height(50);
  hsymbl(120);

  ny = 150;

  for (i = 0; i < 24; i++)
  { if ((i % 4) == 0) 
    { ny  += 400;
      nxp  = 550;
    }
    else
    { nxp += 350;
    }

    sprintf(cstr,"%d",i); 
    nl = nlmess(cstr)/2;
    messag(cstr,nxp-nl,ny+150);
    symbol(i,nxp,ny);
  }

  disfin();
}

/* >>>>>>>>>> EXA_4  <<<<<<<<<< */
void exa_4(void)
{ int nya, i;
  static char    ctit[] =  "Logarithmic Scaling", cstr[60],
                *clab[3] = {"LOG", "FLOAT", "ELOG"};

  setpag("da4p");
  disini();
  pagera();
  complx();

  axslen(1400,500);
  name("X-axis","x");
  name("Y-axis","y");
  axsscl("log","xy");

  titlin(ctit,2);

  for (i = 1; i <= 3; i++)
  { nya = 2650 - (i-1) * 800;
    labdig(-1,"xy");
    if (i == 2)
    { labdig(1,"y");
      name(" ","x");
    }

    axspos(500,nya);
    color("yellow");
    strcpy(cstr, "Labels: ");
    strcat(cstr,clab[i-1]);
    messag(cstr,600,nya-400);
    color("fore");
    labels(clab[i-1],"xy");
    graf(0.,3.,0.,1.,-1.,2.,-1.,1.);

    if (i == 3)
    { height(50);
      title();
    }

    endgrf();
  }
  disfin();
}

/* >>>>>>>>>> EXA_5  <<<<<<<<<< */
void exa_5(void)
{ int nya = 2700, i, nx, ny;
  static float
        x[] = {0.,1.,3.,4.5,6.,8.,9.,11.,12.,12.5,13.,15.,16.,17.,19.,20.},
        y[] = {2.,4.,4.5,3.,1.,7.,2.,3.,5.,2.,2.5,2.,4.,6.,5.5,4.};
  static char 
       *cpol[6] = {"SPLINE", "STEM", "BARS", "STAIRS", "STEP", "LINEAR"},
       *ctit    = "Interpolation Methods";

  setpag("da4p");
  disini();
  complx();
  pagera();
  incmrk(1);
  hsymbl(25);
  titlin(ctit,1);
  axslen(1500,350);
  setgrf("line","line","line","line");

  for (i=0; i<6; i++)
  { axspos(350,nya-i*350);
    polcrv(cpol[i]);
    marker(0);

    graf(0.,20.,0.,5.,0.,10.,0.,5.);
    nx=nxposn(1.);
    ny=nyposn(8.);
    color("yellow");
    messag(cpol[i],nx,ny);
    curve(x,y,16);
    color("fore");

    if (i == 5)
    { height(50);
      title();
    }
    endgrf();
  }

  disfin();
}

/* >>>>>>>>>> EXA_6  <<<<<<<<<< */
void exa_6(void)
{ int i, ny, nx;
  static float    x[2] = {3.,9.}, y[2];
  static char *ctyp[8] = {"SOLID",  "DOT",   "DASH", "CHNDSH",
                          "CHNDOT", "DASHM", "DOTL", "DASHL"};

  setpag("da4p");
  disini();
  pagera();
  center();
  chncrv("both");
  complx();

  name("X-axis","x");
  name("Y-axis","y");

  titlin("Demonstration of Curve",1);
  titlin("Line Styles",3);

  graf(0.,10.,0.,2.,0.,10.,0.,2.);
  title();

  for (i = 1; i <= 8; i++)
  { y[0] = 9.5-i;
    y[1] = 9.5-i;
    ny = nyposn(y[0]);
    nx = nxposn(1.0);
    messag(ctyp[i-1],nx,ny-20);
    curve(x,y,2);
  }

  disfin();
}

/* >>>>>>>>>> EXA_7  <<<<<<<<<< */
void exa_7(void)
{ int n = 100, i, nx, ny;
  double fpi = 3.1415926/180., step, x;
  char   cbuf[20];

  step = 360./(n-1);
  for (i=0; i<n; i++)
  { xray[i] = i * step;
    x=xray[i] * fpi;
    y1ray[i] = sin(x);
    y2ray[i] = cos(x);
  }

  disini();
  complx();
  pagera();

  axspos(450,1800);
  axslen(2200,1200);

  name("X-axis","x");
  name("Y-axis","y");
  labdig(-1,"x");
  ticks(10,"xy");

  titlin("Demonstration of Curve",1);
  titlin("Legend",3);

  graf(0.,360.,0.,90.,-1.,1.,-1.,0.5);
  title();
  xaxgit();

  chncrv("both");
  curve(xray,y1ray,n);
  curve(xray,y2ray,n);

  legini(cbuf,2,7);
  nx = nxposn(190.);
  ny = nyposn(0.75);
  legpos(nx,ny);
  leglin(cbuf,"sin (x)",1);
  leglin(cbuf,"cos (x)",2);
  legtit("Legend");
  legend(cbuf,3);

  disfin();
}

/* >>>>>>>>>> EXA_8  <<<<<<<<<< */
void exa_8(void)
{ int   ixp[4], iyp[4], nl, nx, nx0 = 335, ny0 = 350, ny, i, j, ii, k, iclr;
  static int  ix[4] = {0, 300, 300, 0},
              iy[4] = {0, 0, 400, 400};
  static char *ctit = "Shading Patterns (AREAF)", cstr[3];

  disini();
  pagera();
  complx();
  setvlt("small");

  height(50);
  nl = nlmess(ctit);
  nx = (2970-nl)/2;
  messag(ctit,nx,200);

  iclr = 0;
  for (i = 0; i < 3; i++)
  { ny = ny0+i*600;
    for (j = 0; j < 6; j++)
    { nx = nx0+j*400;
      ii = i*6+j;
      shdpat((long) ii);
      sprintf(cstr,"%d",ii);

      iclr = iclr % 16;
      iclr++;
      setclr(iclr);

      for (k=0; k<4; k++)
      { ixp[k] = ix[k] + nx;
        iyp[k] = iy[k] + ny;
      }
      areaf(ixp,iyp,4);

      nl  = nlmess(cstr);
      nx += (300-nl)/2;
      messag(cstr,nx,ny+460);
    }
  }

  disfin();
}

/* >>>>>>>>>> EXA_9  <<<<<<<<<< */
void exa_9(void)
{ int nl, nx, ny, i;
  static int ivec[20]   = {   0,1111,1311,1421,1531,1701,1911,3111,3311,3421,
                       3531,3703,4221,4302,4413,4522,4701,5312,5502,5703};
  static char *ctit = "Vectors", cnum[5];

  disini();
  color("cyan");
  pagera();
  complx();

  height(60);
  nl = nlmess(ctit);
  nx = (2970-nl)/2;
  messag(ctit,nx,200);

  height(50);
  nx=300;
  ny=400;

  for (i = 0; i < 20; i++)
  { if (i == 10) 
    { nx += 2970/2;
      ny  = 400;
    }

    sprintf(cnum,"%d",ivec[i]);
    nl = nlmess(cnum);
    messag(cnum,nx-nl,ny-25 );

    vector(nx+100,ny,nx+1000,ny,ivec[i]);
    ny += 160;
  }

  disfin();
}

/* >>>>>>>>>> EXA_10  <<<<<<<<<< */
void exa_10(void)
{ int i;
  static char *ctit = "Shading Patterns (PIEGRF)", cbuf[40], cstr[4];

  for (i = 0; i < 18; i++)
    xray[i] = 1.;

  setpag("da4p");
  disini();
  pagera();
  complx();

  axspos(250,2700);
  axslen(1600,2200);
  titlin(ctit,3);
  height(50);

  legini(cbuf,18,2);

  for (i = 0; i < 18; i++)
  { sprintf(cstr,"%d",i);
    leglin(cbuf,cstr,i+1);
  }

  chnpie("both");
  labels("none","pie");
  piegrf(cbuf,1,xray,18);
  title();

  disfin();
}

/* >>>>>>>>>> EXA_11 <<<<<<<<<< */
void exa_11(void)
{ int n = 50 ,i, j;
  double fpi=3.1415927/180., step, x, y;
  static char *ctit1 = "Surface Plot (SURMAT)",
              *ctit2 = "F(X,Y) = 2*SIN(X)*SIN(Y)";

  step = 360./(n-1);
  for (i = 0; i < n; i++)
  { x = i*step;
    for (j = 0; j < n; j++)
    { y = j*step;
      zmat[i][j] = 2*sin(x*fpi)*sin(y*fpi);
    }
  }

  setpag("da4p");
  disini();
  pagera();
  complx();
  axspos(200,2600);
  axslen(1800,1800);

  name("X-axis","x");
  name("Y-axis","y");
  name("Z-axis","z");

  titlin(ctit1,2);
  titlin(ctit2,4);

  view3d(-5.,-5.,4.,"abs");
  graf3d(0.,360.,0.,90.,0.,360.,0.,90.,-3.,3.,-3.,1.);
  height(50);
  title();

  color("green");
  surmat((float *) zmat,50,50,1,1);
  disfin();
}

/* >>>>>>>>>> EXA12_1 <<<<<<<<<< */
void exa12_1(void)
{ int n = 50 ,i, j;
  static int ixp[4] = {200,1999,1999,200},
             iyp[4] = {2600,2600,801,801};

  double fpi = 3.1415927/180., step, x, y;
  static char *ctit1 = "Surface Plot (SURMAT)",
              *ctit2 = "F(X,Y) = 2*SIN(X)*SIN(Y)";

  step = 360./(n-1);
  for (i = 0; i < n; i++)
  { x = i*step;
    for (j = 0; j < n; j++)
    { y = j*step;
      zmat[i][j] = 2*sin(x*fpi)*sin(y*fpi);
    }
  }

  setpag("da4p");
  disini();
  pagera();
  complx();

  axspos(200,2600);
  axslen(1800,1800);
  name("X-axis","x");
  name("Y-axis","y");
  name("Z-axis","z");
  titlin(ctit1,2);
  titlin(ctit2,4);

  graf3d(0.,360.,0.,90.,0.,360.,0.,90.,-3.,3.,-3.,1.);
  height(50);
  title();
  shlsur();
  color("green");
  surmat((float *) zmat,n,n,1,1);

  color("fore");
  grfini(-1.,-1.,-1.,1.,-1.,-1.,1.,1.,-1.);
  nograf();
  graf(0.,360.,0.,90.,0.,360.,0.,90.);
  dashl();
  grid(1,1);
  grffin();

  grfini(-1.,-1.,-1.,-1.,1.,-1.,-1.,1.,1.);
  graf(0.,360.,0.,90.,-3.,3.,-3.,1.);
  grid(1,1);
  grffin();

  grfini(-1.,1.,-1.,1.,1.,-1.,1.,1.,1.);
  shdpat(7L);
  solid();
  areaf(ixp,iyp,4);
  grffin();

  disfin();
}

/* >>>>>>>>>> EXA12_2 <<<<<<<<<< */
void exa12_2(void)
{ float p = 3.14159, step;
  
   setpag("da4p");
   disini();
   pagera();
   complx();
   axspos (200,2400);
   axslen(1800,1800);
   intax();

   titlin("Surface Plot of the Parametric Function",2);
   titlin("[COS(t)+(3+COS(u)), SIN(t)*(3+COS(u)), SIN(u)]",4);

   name("X-axis", "x");
   name("Y-axis", "y");
   name("Z-axis", "z");

   vkytit(-300);
   zscale(-1.,1.);
   graf3d (-4.,4.,-4.,1.,-4.,4.,-4.,1.,-3.,3.,-3.,1.);
   height(40);
   title();

   surmsh("on");
   step = 2 * 3.14159/30.;
   surfcp (zfun, 0.,2*p,step,0.,2*p,step);
   disfin();
}

float zfun(float x, float y, int iopt)
{ float v;
  if (iopt == 1)
    v = cos((double) x) * (3.+cos((double) y));
  else if (iopt == 2)
    v = sin((double) x) * (3.+cos((double) y));
  else
    v = sin ((double) y);

  return (float) v;
}

/* >>>>>>>>>> EXA_12 <<<<<<<<<< */
void exa_12(void)
{ int i, nxp, nyp;
  float  xp, yp;
  static float   xc[9] = {-22.,18.,37.5,0.,2.5,12.5,23.5,-3.75,14.25},
                 yc[9] = {64.,59.6,56.,51.5,48.5,42.,38.,40.3,50.1};
  static char *cstr[9] = {"REYKJAVIK", "STOCKHOLM", "MOSKAU", "LONDON",
                          "PARIS", "ROM", "ATHEN", "MADRID", "PRAG"};

  disini();
  pagera();
  complx();

  axspos(500,1850);
  axslen(2200,1400);

  labdig(-1,"xy");
  ticks(1,"xy");
  name("Longitude","x");
  name("Latitude","y");

  titlin("Map Plot",3);
  incmrk(-1);

  labels("map","xy");
  projct("lambert");
  frame(3);
  grafmp(-40.,60.,-40.,20.,35.,70.,40.,10.);

  color ("green");
  world();
  color ("fore");
  curvmp(xc,yc,9);

  for (i = 0; i < 9; i++)
  { pos2pt(xc[i],yc[i],&xp,&yp);
    nxp = (int) (xp + 30);
    nyp = (int) yp;
    messag(cstr[i],nxp,nyp);
  }

  gridmp(1,1);
  height(50);
  title();
  disfin();
}

/* >>>>>>>>>> EXA13_1 <<<<<<<<<< */
void exa13_1(void)
{ setpag("da4l");
  disini();
  pagera();
  complx();

  frame(3);
  axspos(400,1850);
  axslen(2400,1400);

  name("Longitude","x");
  name("Latitude","y");
  titlin("World Coastlines and Lakes",3);

  labels("map","xy");
  grafmp(-180.,180.,-180.,90.,-90.,90.,-90.,30.);

  gridmp(1,1);
  color("green");
  world();
  color("fore");

  height(50);
  title();
  disfin();
}

/* >>>>>>>>>> EXA13_2 <<<<<<<<<< */
void exa13_2(void)
{ int nya, i;
  static char ctit[60], *cproj[3] = {"Sanson","Winkel","Hammer"};

  setpag("da4p");
  disini();
  complx();
  pagera();

  height(40);
  axslen(1600,750);

  nya=3850;
  for (i=0; i<3; i++)
  { nya=nya-950;
    axspos(250,nya);

    projct(cproj[i]);
    noclip();
    grafmp(-180.,180.,-180.,30.,-90.,90.,-90.,15.);

    sprintf(ctit,"%s%s","Elliptical Projection of ",cproj[i]);
    titlin(ctit,4);
    title();
    color("green");
    world();
    color("fore");

    gridmp(1,1);
    endgrf();
  }

  disfin();
}

/* >>>>>>>>>> EXA13_3 <<<<<<<<<< */
void exa13_3(void)
{ int    nl, nx, i;
  static int   nxa[4]  = {200,1150,200,1150},
               nya[4]  = {1600,1600,2700,2700};
  static float xpol[4] = {0.,0.,0.,0.},
               ypol[4] = {0.,45.,90.,-45.};
  static char  *ctit   = "Azimuthal Lambert Projections";

  setpag("da4p");
  disini();
  complx();
  pagera();

  height(50);
  nl = nlmess(ctit);
  nx = (2250-nl)/2;
  messag(ctit,nx,300);

  axslen(900,900);
  projct("lambert");

  for(i = 0; i < 4; i++)
  { axspos(nxa[i],nya[i]);
    mappol(xpol[i],ypol[i]);
    grafmp(-180.,180.,-180.,30.,-90.,90.,-90.,30.);

    color("green");
    world();
    color("fore");
    gridmp(1,1);
    endgrf();
  }

  disfin();
}

/* >>>>>>>>>> EXA13_4 <<<<<<<<<< */
void exa13_4(void)
{ int n = 32, inray[32], icray[32], i;
  long ipray[32];

  for (i=0; i<32; i++)
  { inray[i] = i+1;
    ipray[i] = 0;
    icray[i] = 1;
  }

  setpag("da4p");
  disini();
  pagera();
  complx();
  setvlt("small");

  intax();
  ticks(1,"xy");
  frame(3);
  axslen(1600,2200);
  axspos(400,2700);

  name("Longitude","x");
  name("Latitude","y");
  titlin("Conformal Conic Projection",3);

  labels("map","xy");
  projct("conf");
  grafmp(-10.,30.,-10.,5.,35.,70.,35.,5.);

  gridmp(1,1);
  shdeur(inray,ipray,icray,n);

  height(50);
  title();
  disfin();
}

/* >>>>>>>>>> EXA14_1 <<<<<<<<<< */
void exa14_1(void)
{ int n = 50, i, j;
  double   fpi = 3.14159/180., step, x, y;
  float  zlev;

  step = 360./(n-1);

  for (i = 0; i < n; i++)
  { xray[i] = i*step;
    yray[i] = i*step;
  }

  for (i = 0; i < n; i++)
  { for (j = 0; j < n; j++)
    { x = xray[i]*fpi;
      y = yray[j]*fpi;    
      zmat[i][j] = 2*sin(x)*sin(y);
    }
  }

  setpag("da4p");
  disini();
  complx();
  pagera();

  titlin("Contour Plot",1);
  titlin("F(X,Y) = 2 * SIN(X) * SIN(Y)",3);

  name("X-axis","x");
  name("Y-axis","y");

  intax();
  axspos(450,2670);
  graf(0.,360.,0.,90.,0.,360.,0.,90.);

  height(30);
  for (i = 0; i < 9; i++)
  { zlev = -2.+i*0.5;
    setclr ((i+1) * 25);
    if (i == 4)
      labels("none","contur"); 
    else
      labels("float","contur");

    contur(xray,n,yray,n,(float *) zmat,zlev);
  }

  height(50);
  color("fore");
  title();

  disfin();
}

/* >>>>>>>>>> EXA14_2 <<<<<<<<<< */
void exa14_2(void)
{ int n = 50, i, j;
  double step, x, y;
  float zlev[12];

  step = 1.6/(n-1);
  for (i = 0; i < n; i++)
  { x = 0.0+i*step;
    xray[i] = x;
    for (j = 0; j < n; j++)
    { y = 0.0+j*step;
      yray[j] = y;
      zmat[i][j] = (x*x-1.)*(x*x-1.) + (y*y-1.)*(y*y-1.);
    }
  }

  setpag("da4p");
  disini();
  pagera();
  complx();

  mixalf();
  titlin("Shaded Contour Plot",1);
  titlin("F(X,Y) = (X[2$ - 1)[2$ + (Y[2$ - 1)[2$",3);
  name("X-axis","x");
  name("Y-axis","y");

  shdmod("poly", "contur");
  axspos(450,2670);
  graf(0.0,1.6,0.0,0.2,0.0,1.6,0.0,0.2);

  for (i = 1; i <= 12; i++)
    zlev[12-i] = 0.1+(i-1)*0.1;

  conshd(xray, n, yray, n, (float *) zmat,zlev,12);

  height(50);
  title();
  disfin();
}

/* >>>>>>>>>> EXA6_1  <<<<<<<<<< */
void exa6_1(void)
{ int ny = 1100, nl;
  static char *ctit = "Instruction Alphabet",
  *ct1 = 
   "{m2}C{m4}(x) = {m3p}v{m4}e{e}-t{r}t{e}x-1{r}dt{gdh0.4f-1}0{u1.4m3f3}l",
  *ct2 =
   "lim{gdhc}x{m3cd1.1}a{c}l{rm} (1 + {puh} 1 {rvgd0.5h} x {r}){u1.2h}x{r} = e",
  *ct0 = 
   "Character{h0.5} height{rz-30}  incli{z30}nation {zw0.5} ratio {wk} fixed width",
  *ct3 = "Underscoring{l}    {p}twice{j}    vectors {pa8v}";

  setpag("da4l");
  disini();
  pagera();
  complx();
  color("cyan");

  height(50);
  nl=nlmess(ctit);
  messag(ctit,(2970-nl)/2,250);

  height(36);
  messag("1.)",300,450);
  messag(ct0,500,450);

  height(50);
  smxalf("inst","{","}",1);
  messag(ct0,500,550);

  reset("smxa");
  height(36);
  messag("2.)",300,750);
  messag(ct3,500,750);

  height(50);
  smxalf("inst","{","}",1);
  messag(ct3,500,850);

  reset("smxalf");
  height(36);
  messag("3.)",300,ny);
  messag(ct1,500,ny);

  smxalf("inst","{","}",1);
  height(80);
  messag(ct1,900,ny+150);

  height(36);
  reset("smxa");
  messag("4.)",300,ny+450);
  messag(ct2,500,ny+450);

  height(80);
  smxalf("inst","{","}",1);
  messag(ct2,900,ny+600);
  disfin();
}

/* >>>>>>>>>> EXA10_1 <<<<<<<<<< */
void exa10_1(void)
{ int nya = 2700, i;
  static char   *ctit = "Bar Graphs (BARS)", cbuf[25];

  static float x[9]  = {1.,2.,3.,4.,5.,6.,7.,8.,9.},
               y[9]  = {0.,0.,0.,0.,0.,0.,0.,0.,0.},
               y1[9] = {1.,1.5,2.5,1.3,2.0,1.2,0.7,1.4,1.1},
               y2[9] = {2.,2.7,3.5,2.1,3.2,1.9,2.0,2.3,1.8},
               y3[9] = {4.,3.5,4.5,3.7,4.,2.9,3.0,3.2,2.6};

  setpag("da4p");
  disini();
  pagera();
  complx();
  ticks(1,"x");
  intax();;
  axslen(1600,700);
  titlin(ctit,3);

  legini(cbuf,3,8);
  leglin(cbuf,"FIRST",1);
  leglin(cbuf,"SECOND",2);
  leglin(cbuf,"THIRD",3);
  legtit(" ");
  shdpat(5L);
  for (i = 1; i <= 3; i++)
  { if (i >  1) labels("none","x");
    axspos(300,nya-(i-1)*800);

    graf(0.,10.,0.,1.,0.,5.,0.,1.);

    if (i == 1)
    { bargrp(3,0.15);
      color("red");
      bars(x,y,y1,9);
      color("green");
      bars(x,y,y2,9);
      color("blue");
      bars(x,y,y3,9);
      color("fore");
      reset("bargrp");
    }
    else if (i == 2)
    { height(30);
      labels("delta","bars");
      labpos("center","bars");
      color("red");
      bars(x,y,y1,9);
      color("green");
      bars(x,y1,y2,9);
      color("blue");
      bars(x,y2,y3,9);
      color("fore");
      reset("height"); 
    }
    else if (i == 3)
    { labels("second","bars");
      labpos("outside","bars");
      color("red");
      bars(x,y,y1,9);
      color("fore");
    }

    if (i != 3) legend(cbuf,7);

    if (i == 3)
    { height(50);
      title();
    }

    endgrf();
  }

  disfin();
}

/* >>>>>>>>>> EXA10_2 <<<<<<<<<< */
void exa10_2(void)
{ int nya = 2800, i;
  static char    *ctit = "Pie Charts (PIEGRF)", cbuf[41];
  static float xray[5] = {1.,2.5,2.,2.7,1.8};

  setpag("da4p");
  disini();
  pagera();
  complx();
  axslen(1600,1000);
  titlin(ctit,2);
  chnpie("both");

  legini(cbuf,5,8);
  leglin(cbuf,"FIRST",1);
  leglin(cbuf,"SECOND",2);
  leglin(cbuf,"THIRD",3);
  leglin(cbuf,"FOURTH",4);
  leglin(cbuf,"FIFTH",5);

  patcyc(1,7L);
  patcyc(2,4L);
  patcyc(3,13L);
  patcyc(4,3L);
  patcyc(5,5L);

  for (i = 0; i < 2; i++)
  { axspos(250,nya-i*1200);
    if (i == 1)
    { labels("data","pie");
      labpos("external","pie");
    }

    piegrf(cbuf,1,xray,5);

    if (i == 1)
    { height(50);
      title();
    }
    endgrf();
  }
  disfin();
}

/* >>>>>>>>>> EXA10_3 <<<<<<<<<< */
void exa10_3()
{ char cbuf[80];
  float x[5]  = {2.,4.,6.,8.,10.},
        y1[5] = {0.,0.,0.,0.,0.},
        y2[5] = {3.2,1.5,2.0,1.0,3.0};

  int ic1ray[5]  = {50,150,100,200,175},
      ic2ray[5]  = {50,150,100,200,175};

  setpag("da4p");
  disini();
  pagera();
  complx();

  titlin("3-D Bar Graph / 3-D Pie Chart", 2);
  htitle(40);

  shdpat(16);
  axslen(1500,1000);
  axspos(300,1400);

  barwth(0.5);
  bartyp("3dvert");
  labels("second","bars");
  labpos("outside","bars");
  labclr(255,"bars");
  graf(0.,12.,0.,2.,0.,5.,0.,1.);
  title();
  color("red");
  bars(x,y1,y2,5);
  endgrf();

  shdpat(16);
  labels("data","pie");
  labclr(255,"pie");
  chnpie("none");
  pieclr(ic1ray,ic2ray,5);
  pietyp("3d");
  axspos(300,2700);
  piegrf(cbuf,0,y2,5);       
  disfin();
}

/* >>>>>>>>>> EXA11_1 <<<<<<<<<< */
void exa11_1(void)
{ int n = 50, i, j;
  double   fpi = 3.1415927/180., step, x, y;
  char   *cdev;

  step = 360./(n-1);
  for (i = 0; i < n; i++)
  { x = i*step;
    for (j = 0; j < n; j++)
    { y = j*step;
      zmat[i][j] = 2*sin(x*fpi)*sin(y*fpi);
    }
  }

  disini();
  pagera();
  cdev = getmfl();
  complx();

  titlin("3-D Colour Plot of the Function",2);
  titlin("F(X,Y) = 2 * SIN(X) * SIN(Y)",4);

  name("X-axis","x");
  name("Y-axis","y");
  name("Z-axis","z");

  intax();
  autres(n,n);
  axspos(300,1850);
  ax3len(2200,1400,1400);

  graf3(0.,360.,0.,90.,0.,360.,0.,90.,-2.,2.,-2.,1.);
  crvmat((float *) zmat,n,n,1,1);

  height(50);
  if (strcmp(cdev,"POST") == 0)
        psfont("palatino-bolditalic");
  title();
  mpaepl(3);
  disfin();
}

/* >>>>>>>>>> EXA_13 <<<<<<<<<< */
void exa_13(void)
{ int n = 7, i;
  static char *clr[7]  = {"fore","red","gree","oran","yello","cyan","blue"},
              *cont[7] = {"anta","afri","eura","nort","sout","aust","lake"};

  disini();
  complx();
  setvlt("small");
  pagera();

  projct("hammer");
  noclip();
  grafmp(-180.,180.,-180.,30.,-90.,90.,-90.,30.);

  shdpat(16L);
  for (i = 0; i < n; i++)
  { color(clr[i]);
    shdmap(cont[i]);
  }

  color("fore");
  gridmp(1,1);

  disfin();
}

/* >>>>>>>>>> EXA_14 <<<<<<<<<< */
void exa_14(void)
{ int ncol = 0, ny, i, j, nx, nb = 100, nh = 80, nl;
  float xcol;
  char   cvlt[5];

  printf(" Give colour table (RAIN, SPEC, GREY): ");
  scanf("%s",cvlt);

  disini();
  pagera();
  setvlt(cvlt);

  height(30);
  for (i = 1; i <= 13; i++)
  { ny = i*150;
    nx = -50;
    for (j = 1; j <= 20; j++)
    { nx += 145;
      if (ncol <= 255)
      { point(nx,ny,nb,nh,ncol);
        xcol=ncol;
        nl=nlnumb(xcol,-1);
        color("fore");
        number(xcol,-1,nx-nl/2,ny+50);
        ncol++;
      }
    }
  }
  disfin();
}

/* >>>>>>>>>> HEADER <<<<<<<<<< */
void header(char *cdev)
{ int n = 25, i;

  static char *c0 = 
    "**********************************************************";

  static char *c1[25] = {
    "                      DISLIN-Examples                     ",
    "                                                          ",
    "C Demo Program of the Data Plotting Library DISLIN.       ",
    "Author: H. Michels,  MPI fuer Sonnensystemforschung,      ",
    "             D-37191 Katlenburg-Lindau, Germany           ",
    "                                                          ",
    "Device:      defines the metafile.                        ",
    "   = CONS    Tektronix emulation or X Window terminal.    ",
    "   = XWIN    X Window terminal (small window).            ",
    "   = GL      OpenGL Window.                               ",
    "   = GKSL    a GKSLIN metafile will be created.           ",
    "   = CGM     a CGM metafile will be created.              ",
    "   = PS      a PostScript file will be created.           ",
    "   = EPS     an EPS file will be created.                 ",
    "   = PDF     a PDF file will be created.                  ",
    "   = HPGL    a HPGL file will be created.                 ",
    "   = SVG     a SVG file will be created.                  ",
    "   = WMF     a Windows metafile will be created.          ",
    "   = JAVA    a Java applet will be created.               ",
    "   = GIF     a GIF file will be created.                  ",
    "   = TIFF    a TIFF file will be created.                 ",
    "   = PNG     a PNG file will be created.                  ",
    "   = PPM     a PPM file will be created.                  ",
    "   = BMP     a BMP file will be created.                  ",
    "   = IMAG    an Image file will be created.               " };

  printf("\n    /****%s****/\n",c0);
  for (i=0; i<n; i++)
  { printf("    /**  %s  **/\n",c1[i]);
  } 
  printf("    /****%s****/\n",c0);

  printf("\n    _Device: ");
  scanf("%s",cdev);
  printf("\n");
}

/* >>>>>>>>>> OPTION <<<<<<<<<< */
int option(void)
{ int n = 17, i, iopt;

  static char *c0 = 
    "**********************************************************";

  static char *c1[17] = {
    "                      DISLIN-Examples                     ",
    "                                                          ",
    " 0: Program end                  15: World Coastlines     ",
    " 1: Demo of CURVE                16: Elliptical Proj.     ",
    " 2: Polar Plots                  17: Azimuthal Proj.      ",
    " 3: Symbols                      18: Conical  Proj.       ",
    " 4: Logarithmic Axes             19: Bar Graphs           ",
    " 5: Interpolation Methods        20: Pie Charts           ",
    " 6: Line Styles                  21: 3-D Bar/Pie Graphs   ",
    " 7: Legend                       22: Contours             ",
    " 8: Shading Patterns (AREAF)     23: Shaded Contours      ",
    " 9: Vectors                      24: Instruction Alphabet ",
    "10: Shading Patterns (PIEGRF)    25: 3-D Colour Plot      ",
    "11: Surface Plot                 26: Shaded World         ",
    "12: Surface Plot                 27: Colour Tables        ",
    "13: Parametric Function Plot                              ",
    "14: Map Plot                     30: Menue end            " };

  printf("\n    /****%s****/\n",c0);
  for (i = 0; i < n; i++)
  { printf("    /**  %s  **/\n",c1[i]);
  }
  printf("    /****%s****/\n",c0);

  printf("\n    _Option: ");
  scanf("%d",&iopt);
  return iopt;
}
