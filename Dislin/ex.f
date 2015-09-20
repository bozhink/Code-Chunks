      PROGRAM EXA_12
      CHARACTER*60 CTIT1,CTIT2
      EXTERNAL ZFUN

      CTIT1='Surface Plot (SURFUN)'
      CTIT2='F(X,Y) = 2*SIN(X)*SIN(Y)' 

      CALL SETPAG('DA4P')
C      CALL METAFL('CONS')
      CALL METAFL('EPS')
      CALL DISINI
      CALL PAGERA
      CALL COMPLX

      CALL AXSPOS(200,2600)
      CALL AXSLEN(1800,1800)

      CALL NAME('X-axis','X')
      CALL NAME('Y-axis','Y')
      CALL NAME('Z-axis','Z')

      CALL TITLIN(CTIT1,2)
      CALL TITLIN(CTIT2,4)

      CALL VIEW3D(-5.,-5.,4.,'ABS')
C      CALL GRAF3D(0.,360.,0.,90.,0.,360.,0.,90.,-3.,3.,-3.,1.)
      CALL GRAF3D(-5.0,5.0, 0.,2.5, -5.0,5.0, 0.,2.5, -3.,3., -3.,1.)
      CALL HEIGHT(50)
      CALL TITLE

      CALL SURFUN(ZFUN,0.,5.,0.,5.)

      CALL DISFIN
      END     

      FUNCTION ZFUN(X,Y)
      FPI=3.14159/180.
C      ZFUN=2*SIN(X*FPI)*SIN(Y*FPI)
      ZFUN=1.0/COSH(X+Y)
      END
