      SUBROUTINE TRIGAUSS(N, A, D, C, B, ERROR)
      IMPLICIT NONE
C
C THIS SUBROUTINE PERFORM GAUSSIAN ELIMINATION
C WITH NO PIVOTING ON A TRIDIAGONAL, DIAGONALLY
C DOMINANT, SET OF LINEAR EQUATIONS
C
C DUMMY ARGUMENTS
      INTEGER N
      DOUBLEPRECISION A(*), C(*)
      DOUBLEPRECISION D(*), B(*)
      INTEGER ERROR
C
C LOCAL VARIABLES
      DOUBLEPRECISION    M
      INTEGER I
C
C VALIDITY CHECK
      IF (N .EQ. 0) THEN
C        THERE IS NO PROBLEM TO SOLVE
         ERROR = -1
         RETURN
      ENDIF
C
C CALCULATE NEW COEFFICIENTS OF UPPER DIAGONAL SYSTEM
      DO I = 1, N-1
         M = A(I+1)/D(I)
         D(I+1) = D(I+1) - M*C(I)
         B(I+1) = B(I+1) - M*B(I)
      ENDDO
      ERROR = 0
      END
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
      SUBROUTINE TRISOLVE(N, A, D, C, B, ERROR)
      IMPLICIT NONE
C
C THIS SUBROUTINE SOLVES A DIAGONALLY DOMINANT
C TRIDIAGONAL SYSTEM BY GAUSSIAN ELIMINATION
C AND BACK SUBSTITUTION
C
C DUMMY ARGUMENTS
C ARRAY A HOLDS THE SUBDIAGONAL COEFFICIENTS
C ARRAY D HOLDS THE DIAGONAL COEFFICIENTS
C ARRAY C HOLDS THE ABOVE-DIAGONAL COEFFICIENTS
C ARRAY B HOLDS THE RIGHT-HAND-SIDE COEFFICIENTS
C ARRAY B WILL CONTAIN THE SOLUTION ON EXIT
C
      INTEGER N
      DOUBLEPRECISION A(*), C(*)
      DOUBLEPRECISION D(*), B(*)
      INTEGER ERROR
           
      CALL TRIGAUSS(N, A, D, C, B, ERROR)
      IF (ERROR .EQ. 0) THEN
          CALL BACKSUBS(N, D, C, B)
      ENDIF
      END
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
      SUBROUTINE BACKSUBS(N, D, C, B)
      IMPLICIT NONE
C
C THIS SUBROUTINE PERFOMS BACK SUBSTITUTION TO
C A TRIDIAGONAL SET OF LINEAR EQUATIONS THAT
C HAS BEEN REDUCED TO UPPER TRIAGONAL FORM
C
C DUMMY ARGUMENTS
      INTEGER N
      DOUBLEPRECISION D(*), C(*)
      DOUBLEPRECISION B(*)
C
C LOCAL VARIABLES
      INTEGER I
      B(N) = B(N)/D(N)
      DO I = N-1, 1, -1
         B(I) = (B(I)-C(I)*B(I+1)) / D(I)
      ENDDO
      END