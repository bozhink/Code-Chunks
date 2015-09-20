C chap1c.for
C ROOT FINDING
      FUNC(X)=X*X-5.                   ! FUNCTION WHOSE ROOT IS SOUGHT
      TOLX=1.E-06                      ! TOLERANCE FOR THE SEARCH
      X=1.                             ! INITIAL GUESS
      FOLD=FUNC(X)                     ! INITIAL FUNCTION
      DX=.5                            ! INITIAL STEP
      ITER=0                           ! INITIAL COUNT
   10 CONTINUE
      ITER=ITER+1                      ! INCREMENT ITERATION COUNT
      X=X+DX                           ! STEP X
      PRINT*,ITER,X,SQRT(5.)-X         ! OUTPUT CURRENT VALUES
      IF ((FOLD*FUNC(X)).LT.0) THEN
         X=X-DX                        ! IF SIGN CHANGE, BACK UP
         DX=DX/2                       ! AND HALVE THE STEP
      ENDIF
      IF (ABS(DX).GT.TOLX) GOTO 10
      STOP
      END

