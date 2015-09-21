      IMPLICIT DOUBLE PRECISION(A-H,O-Z),INTEGER(I-N)
      PARAMETER (M=2,N=3)
      DIMENSION C(M,N), A(M,N)
      EXTERNAL FOOC
!$PRAGMA C(FOOC)
      DO I=1,M
      DO J=1,N
      A(I,J)=1.D0/DBLE(I+J-1)
      ENDDO
      ENDDO
      B=1.D0
      CALL FOOC(C,A,B,M,N)
      PRINT*
      PRINT*,A
      PRINT*
      PRINT*,C
      PRINT*
      STOP
      END

