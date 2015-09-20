      PROGRAM GEOD
      INTEGER M, N
      REAL*8  T0, T1, DT
      INTEGER I, J
      T0 = 0.0
      T1 = 200.0
      DT = 0.01

      N = INT((T1-T0)/DT) + 1

      CALL MAIN(T0,T1,DT,N)
      STOP
      END


      SUBROUTINE MAIN(T0, T1, DT, N)
      IMPLICIT NONE
      INTRINSIC INT
      EXTERNAL  SPHERE
      REAL*8    T0, T1, DT
      INTEGER   M, N, IERR
      PARAMETER(M=6)
      REAL*8    X0(M)
      REAL*8    X(M,N)
      REAL*8    T(N)
      CHARACTER(LEN=12) FNAME
      INTEGER   I, J
      FNAME = 'geodsphr.txt'

      X0(1) = 0.0
      X0(2) = 1.0
      X0(3) = 1.0
      X0(4) = 1.0
      X0(5) = 1.0
      X0(6) = 1.0

      CALL RKSOLVE(SPHERE,X0,T0,T1,M,N,FNAME,IERR)
      PRINT*,IERR
      RETURN
      END

      SUBROUTINE SPHERE(X, T, DXDT)
      IMPLICIT NONE
      INTRINSIC DSIN, DCOS, DTAN
      REAL*8    X,T,DXDT
      DIMENSION X(6), DXDT(6)
      REAL*8    RHO, THETA

      THETA  = 2.666666666666667
      RHO   = 1.0

      DXDT(1) = X(4)
      DXDT(2) = X(5)
      DXDT(3) = X(6)
      DXDT(4) = 0.5*X(5)*X(5) + 0.5*X(6)*X(6)*DSIN(THETA)
      DXDT(5) = 0.5*X(6)*X(6)*DCOS(THETA) - 0.5*X(4)*X(5)
      DXDT(6) = -X(6)*( X(5)/DTAN(THETA) + X(4)/RHO )
      RETURN
      END
