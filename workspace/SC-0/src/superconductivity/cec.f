! This program calculates Constant Energy Curves
      SUBROUTINE CEC(ENERGY,E,T)
      IMPLICIT DOUBLEPRECISION(A-H,O-Z),INTEGER(I-N)
      PARAMETER (N=500)
      DIMENSION XX(N),YY(N),E(3),T(3)
      COMMON /BHPARAMS/ ED,ES,EP,TPD,TSP,TPP
      ED=E(1)
      ES=E(2)
      EP=E(3)
      TPD=T(1)
      TSP=T(2)
      TPP=T(3)
      PI=4.D0*DATAN(1.D0)
      AA=A(ENERGY)
      BB=B(ENERGY)
      CC=C(ENERGY)

      CALL LINSPACE(N,0.45D0,5.84d0,XX)

      DO I=1,N
         YY(I)=PY(XX(I),AA,BB,CC)
      ENDDO
      PI2=2.D0*PI
      PI3=3.D0*PI
      DO I=1,N
         PPX=XX(I)
         PPY=YY(I)
         IF (PPX.LT.PI3.AND.PPY.LT.PI3) PRINT 100,PPX,PPY
         PPX=XX(I)
         PPY=PI2-YY(I)
         IF (PPX.LT.PI3.AND.PPY.LT.PI3) PRINT 100,PPX,PPY
         PPX=PI2+XX(I)
         PPY=YY(I)
         IF (PPX.LT.PI3.AND.PPY.LT.PI3) PRINT 100,PPX,PPY
         PPX=PI2+XX(I)
         PPY=PI2-YY(I)
         IF (PPX.LT.PI3.AND.PPY.LT.PI3) PRINT 100,PPX,PPY
         PPX=XX(I)
         PPY=PI2+YY(I)
         IF (PPX.LT.PI3.AND.PPY.LT.PI3) PRINT 100,PPX,PPY
         PPX=XX(I)
         PPY=2.D0*PI2-YY(I)
         IF (PPX.LT.PI3.AND.PPY.LT.PI3) PRINT 100,PPX,PPY
         PPX=PI2+XX(I)
         PPY=PI2+YY(I)
         IF (PPX.LT.PI3.AND.PPY.LT.PI3) PRINT 100,PPX,PPY
         PPX=PI2+XX(I)
         PPY=2.D0*PI2-YY(I)
         IF (PPX.LT.PI3.AND.PPY.LT.PI3) PRINT 100,PPX,PPY

         PPY=XX(I)
         PPX=YY(I)
         IF (PPX.LT.PI3.AND.PPY.LT.PI3) PRINT 100,PPX,PPY
         PPY=XX(I)
         PPX=PI2-YY(I)
         IF (PPX.LT.PI3.AND.PPY.LT.PI3) PRINT 100,PPX,PPY
         PPY=PI2+XX(I)
         PPX=YY(I)
         IF (PPX.LT.PI3.AND.PPY.LT.PI3) PRINT 100,PPX,PPY
         PPY=PI2+XX(I)
         PPX=PI2-YY(I)
         IF (PPX.LT.PI3.AND.PPY.LT.PI3) PRINT 100,PPX,PPY
         PPY=XX(I)
         PPX=PI2+YY(I)
         IF (PPX.LT.PI3.AND.PPY.LT.PI3) PRINT 100,PPX,PPY
         PPY=XX(I)
         PPX=2.D0*PI2-YY(I)
         IF (PPX.LT.PI3.AND.PPY.LT.PI3) PRINT 100,PPX,PPY
         PPY=PI2+XX(I)
         PPX=PI2+YY(I)
         IF (PPX.LT.PI3.AND.PPY.LT.PI3) PRINT 100,PPX,PPY
         PPY=PI2+XX(I)
         PPX=2.D0*PI2-YY(I)
         IF (PPX.LT.PI3.AND.PPY.LT.PI3) PRINT 100,PPX,PPY
      ENDDO

*      PRINT*,ED,ES,EP
*      PRINT*,TPD,TSP,TPP
      STOP
   10 FORMAT("X=",E10.3," Y=",E10.3)
  100 FORMAT(F10.6,1X,F10.6)
      END

      DOUBLEPRECISION FUNCTION A(EPS)
      IMPLICIT NONE
      DOUBLEPRECISION EPS,DED,DES,DEP
      DOUBLEPRECISION ED,ES,EP,TPD,TSP,TPP
      COMMON /BHPARAMS/ ED,ES,EP,TPD,TSP,TPP
      DED=EPS-ED
      DES=EPS-ES
      DEP=EPS-EP
      A=16.D0*(4.D0*TPD*TPD*TSP*TSP + 2.D0*TSP*TSP*TPP*DED
     *       - 2.D0*TPD*TPD*TPP*DES - TPP*TPP*DED*DES)
      RETURN
      END

      DOUBLEPRECISION FUNCTION B(EPS)
      IMPLICIT NONE
      DOUBLEPRECISION EPS,DED,DES,DEP
      DOUBLEPRECISION ED,ES,EP,TPD,TSP,TPP
      COMMON /BHPARAMS/ ED,ES,EP,TPD,TSP,TPP
      DED=EPS-ED
      DES=EPS-ES
      DEP=EPS-EP
      B=-4.D0*DEP*(TSP*TSP*DED + TPD*TPD*DES)
      RETURN
      END

      DOUBLEPRECISION FUNCTION C(EPS)
      IMPLICIT NONE
      DOUBLEPRECISION EPS,DED,DES,DEP
      DOUBLEPRECISION ED,ES,EP,TPD,TSP,TPP
      COMMON /BHPARAMS/ ED,ES,EP,TPD,TSP,TPP
      DED=EPS-ED
      DES=EPS-ES
      DEP=EPS-EP
      C=DED*DES*DEP*DEP
      RETURN
      END

      DOUBLEPRECISION FUNCTION Y(X,AA,BB,CC)
      IMPLICIT NONE
      DOUBLEPRECISION X,AA,BB,CC
      Y=-(BB*X+CC)/(AA*X+BB)
      IF (Y.LT.0.D0) THEN
         WRITE(UNIT=0,FMT=10)Y,X
         Y=1.D-6
      ENDIF
      RETURN
   10 FORMAT('Y: ERROR: Y<0 : Y=',E10.3,' X=',E10.3,/,
     * 'Y WILL BE PUT TO 1.D-6')
      END

      DOUBLEPRECISION FUNCTION PY(PX,AA,BB,CC)
      IMPLICIT NONE
      DOUBLEPRECISION PX,AA,BB,CC,XX,Y,YY
      EXTERNAL Y
      XX=DSIN(0.5D0*PX)
      XX=XX*XX
      YY=Y(XX,AA,BB,CC)
      IF (YY.LT.1.D-16) THEN
         PRINT*,"PY: YY=0"
         PY=0.D0
         RETURN
      ENDIF
      YY=DSQRT(DABS(((1.D0-YY)/YY)))
      IF (YY.LT.1.D0-16) THEN
         PRINT*,"PY: YY=1/0"
         PY=4.D0*DATAN(1.D0)
         RETURN
      ENDIF
      PY=2.D0*DATAN(1.D0/YY)
      RETURN
      END

      SUBROUTINE LINSPACE(N,XMIN,XMAX,X)
      IMPLICIT NONE
      INTEGER N,I
      DOUBLEPRECISION XMIN,XMAX,X(N)
      DOUBLEPRECISION H
      H=(XMAX-XMIN)/DBLE(N)
      X(1)=XMIN
      DO I=2,N
         X(I)=X(I-1)+H
      ENDDO
      RETURN
      END
      
