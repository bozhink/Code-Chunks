C
C File:   dotprod.f
C Author: bozhin
C
C Created on November 26, 2012, 2:31 PM
C
      FUNCTION DOTPROD(N, X, Y)
      IMPLICIT NONE
      INTEGER N, I
      DOUBLE PRECISION X(*), Y(*)
      DOUBLE PRECISION DOTPROD, DSUM
      DATA DSUM /0.D0/
      DO I = 1, N
          DSUM = DSUM + X(I)*Y(I)
      ENDDO
      DOTPROD = DSUM
      END
