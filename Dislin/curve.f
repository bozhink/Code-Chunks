      PROGRAM EXA 1 CURVE
      PARAMETER (N=301)
      DIMENSION XRAY(N),Y1RAY(N),Y2RAY(N)

      PI=3.1415926
      FPI=PI/180.
      STEP=360./(N-1)

      DO I=1,N
         XRAY(I)=(I-1)*STEP
         X=XRAY(I)*FPI
         Y1RAY(I)=SIN(X)
         Y2RAY(I)=COS(X)
      ENDDO

C      CALL METAFL('CONS')
      CALL METAFL('EPS')
      CALL SCRMOD('REVERS')
      CALL DISINI
      CALL PAGERA
      CALL COMPLX

      CALL AXSPOS(450,1800)
      CALL AXSLEN(2200,1200)

      CALL NAME('X-axis','X')
      CALL NAME('Y-axis','Y')

      CALL LABDIG(-1,'X')
C      CALL TICKS(10,'XY')
      CALL TICKS(10,'X')
      CALL TICKS(5,'Y')

      CALL TITLIN('Demonstration of CURVE',1)
      CALL TITLIN('SIN(X), COS(X)',3)

      IC=INTRGB(0.95,0.95,0.95)
      CALL AXSBGD(IC)

      CALL GRAF(0.,360.,0.,90.,-1.,1.,-1.,.5)
      CALL SETRGB(.7,.7,.7)
      CALL GRID(1,1)

      CALL COLOR('FORE')
      CALL HEIGHT(50)
      CALL TITLE

      CALL COLOR('RED')
      CALL CURVE(XRAY,Y1RAY,N)
      CALL COLOR('GREEN')
      CALL CURVE(XRAY,Y2RAY,N)

      CALL DISFIN
      END

