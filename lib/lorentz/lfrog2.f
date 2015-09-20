      PROGRAM LFROG2
C IMPLEMENTS LEAPFROG METHOD
      IMPLICIT DOUBLE PRECISION (A-H, P-Z)
      INTRINSIC DSQRT
      DIMENSION R(6), V(6), A(6), RR(3)
      DATA R(1), R(2), R(3), R(4), R(5), R(6),
     1     V(1), V(2), V(3)
     2    /1.0, 0.0, 0.0, -1.0, 0.0, 0.0,
     3     0.0, 0.5, 0.0/
      PRINT*, 'ENTER VALUE FOR THE STEP:'
      READ*, DT
      PRINT*,'ENTER TEND'
      READ*, TEND
      
      PMASS1 = 1.0
      PMASS2 = 3.0
      PMASS12 = PMASS1/PMASS2
      
      DO I=1,3
        V(I+3) = -PMASS12*V(I)
      END DO
      
      CALL PLOT(DT,TEND,PMASS1,PMASS2,R,V)
      
      STOP
      END
      
      SUBROUTINE PLOT(DT,TEND,PMASS1,PMASS2,R,V)
      IMPLICIT DOUBLE PRECISION (A-H, P-Z)
      INTRINSIC DSQRT
      DIMENSION R(6), V(6), A(6), RR(3)
      EKIN = 0.5*SDOT(V,3)
      EPOT = -1.0/DSQRT(SDOT(R,3))
      EIN = EKIN + EPOT
      PRINT*, 'INITIAL ENERGY: ', EIN
      PRINT*, PMASS1*SSDOT(V,1,2,6), PMASS2*SSDOT(V,4,6,6)
      
      DO I=1,3
        RR(I) = R(I)-R(I+3)
      END DO
      
      R2 = SDOT(RR,3)
      DO I=1,3
        A(I) = -RR(I)/(PMASS1*R2*DSQRT(R2))
      END DO
      DO I=4,6
        A(I) = RR(I-3)/(PMASS2*R2*DSQRT(R2))
      END DO
      
      DTOUT = 0.01
      TOUT = DTOUT
      T = 0.0
      OPEN(UNIT=10,FILE='lfrog.txt',STATUS='REPLACE',IOSTAT=IERR)
      DO
        IF (T .GT. TEND) EXIT
        T = T + DT
        DO I=1,6
          V(I) = V(I) + 0.5*A(I)*DT
          R(I) = R(I) + V(I)*DT
        END DO
        DO I=1,3
          RR(I) = R(I)-R(I+3)
        END DO
        R2 = SDOT(RR,3)
        DO I=1,3
          A(I) = -RR(I)/(PMASS1*R2*DSQRT(R2))
        END DO
        DO I=4,6
          A(I) = RR(I-3)/(PMASS2*R2*DSQRT(R2))
        END DO
        DO I=1,6
          V(I) = V(I) + 0.5*A(I)*DT
        END DO
        IF (T .GE. TOUT) THEN
          WRITE(UNIT=10, FMT=100) (R(I),I=1,6), (V(I),I=1,6)
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
      PRINT*, PMASS1*SSDOT(V,1,2,6), PMASS2*SSDOT(V,4,6,6)
      
      RETURN
  100 FORMAT(12(F8.3,1X))
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
      
      FUNCTION SSDOT(X, K1, K2, DIMX)
      DOUBLE PRECISION SSDOT, X
      INTEGER K1,K2, I, DIMX
      DIMENSION X(DIMX)
      SDOT = 0.0
      DO I=K1,K2
        SDOT = SDOT + X(I)*X(I)
      END DO
      RETURN
      END
