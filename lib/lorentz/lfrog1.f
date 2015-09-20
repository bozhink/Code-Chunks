      PROGRAM LFROG1
C IMPLEMENTS LEAPFROG METHOD
      IMPLICIT DOUBLE PRECISION (A-H, P-Z)
      INTRINSIC DSQRT
      DIMENSION R(3), V(3), A(3)
      DATA R(1), R(2), R(3),
     1     V(1), V(2), V(3)
     2    /1.0, 0.0, 0.0,
     3     0.0, 0.5, 0.0/
      PRINT*, 'ENTER VALUE FOR THE STEP:'
      READ*, DT
      PRINT*,'ENTER TEND'
      READ*, TEND
       
      EKIN = 0.5*SDOT(V,3)
      EPOT = -1.0/DSQRT(SDOT(R,3))
      EIN = EKIN + EPOT
      PRINT*, 'INITIAL ENERGY: ', EIN
      
      R2 = SDOT(R,3)
      DO I=1,3
        A(I) = -R(I)/(R2*DSQRT(R2))
      END DO
      DTOUT = 0.01
      TOUT = DTOUT
      T = 0.0
      OPEN(UNIT=10,FILE='lfrog.txt',STATUS='REPLACE',IOSTAT=IERR)
      DO
        IF (T .GT. TEND) EXIT
        T = T + DT
        DO I=1,3
          V(I) = V(I) + 0.5*A(I)*DT
          R(I) = R(I) + V(I)*DT
        END DO
        R2 = SDOT(R,3)
        DO I=1,3
          A(I) = -R(I)/(R2*DSQRT(R2))
          V(I) = V(I) + 0.5*A(I)*DT
        END DO
        IF (T .GE. TOUT) THEN
          WRITE(UNIT=10, FMT=100) R(1),R(2),R(3),V(1),V(2),V(3)
          TOUT = TOUT + DTOUT
        ENDIF
      END DO
      CLOSE(UNIT=10,IOSTAT=IERR)
      
      EKIN = 0.5*SDOT(V,3)
      EPOT = -1.0/DSQRT(SDOT(R,3))
      EOUT = EKIN+EPOT
      PRINT*,'FINAL ENERGY: ', EOUT
      PRINT*,'ABS. ERROR:   ', EOUT-EIN
      PRINT*,'REL. ERROR:   ', (EOUT-EIN)/EIN
      
      STOP
  100 FORMAT(6(F8.3,1X))
      END
 
      FUNCTION SDOT(X, DIMX)
      DOUBLE PRECISION SDOT, X
      INTEGER DIMX, I
      DIMENSION X(DIMX)
      SDOT = 0.0
      DO I=1,DIMX
        SDOT = SDOT + X(I)*X(I)
      END DO
      RETURN
      END
