      PARAMETER (N=2)
      DOUBLE PRECISION X(3,2*N*N),Y(3,2*N*N),DATA(4500),RES,ERR,H
      INTEGER IWORK(100),NU,ND,NEVALS,IFLAG
      EXTERNAL F
*      X(1,1)=0.
*      Y(1,1)=0.
*      X(2,1)=1.
*      Y(2,1)=0.
*      X(3,1)=1.
*      Y(3,1)=1.
*      X(1,2)=0.
*      Y(1,2)=0.
*      X(2,2)=1.
*      Y(2,2)=1.
*      X(3,2)=0.
*      Y(3,2)=1.
      H=1.D0/dble(n)

      CALL triang(h, n, x, y)

      NU=0
      ND=0
      IFLAG=1
      CALL TWODQ(F,2*N*N,X,Y,1.D-04,1,50,4000,RES,ERR,NU,ND,
     *  NEVALS,IFLAG,DATA,IWORK)
      PRINT*,RES,ERR,NEVALS,IFLAG
      END
      DOUBLE PRECISION FUNCTION F(X,Y)
      DOUBLE PRECISION X,Y
      F=COS(X+Y)
      RETURN
      END

