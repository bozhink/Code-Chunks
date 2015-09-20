      PROGRAM LORENZ
      INTEGER M, N
      REAL*8  T0, T1, DT
      INTEGER I, J
      T0 = 0.0
      T1 = 20.0
      DT = 0.0001
      
      N = INT((T1-T0)/DT) + 1
      
      CALL MAIN(T0,T1,DT,N)
      STOP
      END


      SUBROUTINE MAIN(T0, T1, DT, N)
      IMPLICIT NONE
      INTRINSIC INT
      EXTERNAL  LOR
      REAL*8    T0, T1, DT
      INTEGER   M, N,IERR
      PARAMETER(M=2)
      REAL*8    X0(M)
      REAL*8    X(M,N)
      REAL*8    T(N)
      CHARACTER(LEN=12) FNAME
      INTEGER   I, J
      FNAME = '__LORENZ.TXT'
      X0(1) = 0.0
      X0(2) = 1.0

      CALL RKSOLVE(LOR,X0,T0,T1,M,N,FNAME,IERR)
      PRINT*,IERR
      RETURN
      END

      SUBROUTINE LOR(X, T, DXDT)
      IMPLICIT NONE
      REAL*8    X,T,DXDT
      DIMENSION X(2), DXDT(2)
      REAL*8    A,B

      A = 1.4
      B = 0.3

      DXDT(1) = 1+ X(2) - A*X(1)*X(1)
      DXDT(2) = B*X(1)
      RETURN
      END
