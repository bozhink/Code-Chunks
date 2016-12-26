      SUBROUTINE SWAP(A, K, L, M, N) 
      INTEGER K, L, M, N
      REAL TEMP, A(M,N)
      INTEGER I
      DO I = 1,N
        TEMP = A(K, I)
        A(K, I) = A(L, I)
        A(L, I) = TEMP
      END DO
      RETURN
      END
      
      SUBROUTINE GSOLVE(A, B, N, ERROR)
C     GAUSSIAN SOLVE
      INTEGER N, ERROR
      REAL A(N,N), B(N)
      CALL GELIM(A, B, N, ERROR)
      IF (ERROR .EQ. 0) CALL BACKSUB(A, B, N)
      RETURN
      END
      
      SUBROUTINE GELIM(A, B, N, ERROR)
C     GAUSSIAN ELIMINARION
      INTEGER N, ERROR
      REAL A(N,N), B(N)
      REAL TEMPARR(N)
      INTEGER KSAVE
      INTEGER I, J, K
      REAL TEMP, M
      
      IF (N .EQ. 0) THEN
        ERROR = -1
        RETURN
      END IF
C      IF (.NOT. (N .EQ. SIZE(A,2))) THEN
C        ERROR = -2
C        RETURN
C      END IF
C      IF (.NOT. (N .EQ. SIZE(B)) THEN
C        ERROR = -3
C        RETURN
C      END IF
      
      ERROR = 0
      DO I = 1, N-1
        KSAVE = MAXLOC(ABS(A(I:N,I)))
        K = KSAVE + I - 1
        IF (A(K,I) .EQ. 0.0) THEN
          ERROR = -4
          RETURN
        END IF
        IF (.NOT. (K .EQ. I)) THEN
          CALL SWAP(A, I, K, N, N)
          CALL SWAP(B, I, K, N, N)
        END IF
        DO J = I+1, N
          M = A(J, I)/A(I, I)
          A(J, :) = A(J, :) - M*A(I, :)
          B(J) = B(J) - M*B(I)
        END DO
      END DO
      RETURN
      END
      
      SUBROUTINE BACKSUB(A, B, N)
      INTEGER N
      REAL A(N,N), B(N)
      REAL S
      INTEGER I, J
      DO I = N, 1, -1
        S = B(I)
        DO J = I+1, N
          S = S - A(I, J)*B(J)
        END DO
      RETURN
      END