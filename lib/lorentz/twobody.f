      PROGRAM TWOBODY
      INTEGER N
      REAL*8  T0, T1, DT
      INTEGER I, J
      T0 = 0.0
      T1 = 100.0
      DT = 0.001

      N = INT((T1-T0)/DT) + 1

      CALL MAIN(T0,T1,DT,N)
      STOP
      END


      SUBROUTINE MAIN(T0, T1, DT, N)
      IMPLICIT NONE
      INTRINSIC INT
      EXTERNAL  TBODIES
      REAL*8    T0, T1, DT
      INTEGER   M, N, IERR
      PARAMETER(M=12)
      REAL*8    X0(M)
      REAL*8    X(M,N)
      REAL*8    T(N)
      CHARACTER(LEN=12) FNAME
      INTEGER   I, J

      DATA X0(1),X0(2),X0(3),
     *     X0(4),X0(5),X0(6),
     *     X0(7),X0(8),X0(9),
     *     X0(10),X0(11),X0(12) 
     * /1.0, 0.0, 0.0,
     * -1.0, 0.0, 0.0, 
     *  0.0, 1.0, 0.0, 
     *  0.0,-1.0, 0.0/

      FNAME = 'twobody.txt'

      CALL RKSOLVE(TBODIES,X0,T0,T1,M,N,FNAME,IERR)
      PRINT*,IERR
      RETURN
      END

      SUBROUTINE TBODIES(X, T, DXDT)
      IMPLICIT NONE
      INTRINSIC DSQRT
      REAL*8    X,T,DXDT
      DIMENSION X(12), DXDT(12)
      REAL*8    M1, M2, K
      REAL*8    R, KR, XR, YR, ZR

      DATA M1, M2, K /1.0, 1.0, 1.0/

      DXDT(1)  = X(7)
      DXDT(2)  = X(8)
      DXDT(3)  = X(9)
      DXDT(4)  = X(10)
      DXDT(5)  = X(11)
      DXDT(6)  = X(12)

      XR = X(1)-X(4)
      YR = X(2)-X(5)
      ZR = X(3)-X(6)
      R = DSQRT( XR*XR + YR*YR + ZR*ZR )
      KR = K/(R*R*R)
      XR = KR*XR
      YR = KR*YR
      ZR = KR*ZR      

      DXDT(7)  = -XR/M1
      DXDT(8)  = -YR/M1
      DXDT(9)  = -ZR/M1
      DXDT(10) =  XR/M2
      DXDT(11) =  YR/M2
      DXDT(12) =  ZR/M2

      RETURN
      END
