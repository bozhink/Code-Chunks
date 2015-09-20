      PROGRAM LFROG3
C IMPLEMENTS LEAPFROG METHOD
      IMPLICIT DOUBLE PRECISION (A-H, P-Z)
      INTRINSIC DSQRT
      INTEGER IERR
      dimension pmass(2)
      DIMENSION R(6), V(6), A(6), RR(3)
      DATA R(1), R(2), R(3), R(4), R(5), R(6),
     1     V(1), V(2), V(3)
     2    /1.0, 0.0, 0.0, -1.0, 0.0, 0.0,
     3     0.0, 0.5, 0.0/
      PRINT*, 'ENTER VALUE FOR THE STEP:'
      READ*, DT
      PRINT*,'ENTER TEND'
      READ*, TEND
      
      PMASS(1) = 1.0
      PMASS(2) = 1.0
      PMASS12 = PMASS1/PMASS2
      
      DO I=1,3
        V(I+3) = -PMASS12*V(I)
      END DO
      TSTART=0.0
      ALPHA=1.0
      CALL PLOT(DT, TSTART, TEND, ALPHA, 2, PMASS, 
     *           R, V, 'two_body.dat', IERR)
      
      STOP
      END
      
      SUBROUTINE PLOT(DT, TSTART, TEND, ALPHA,
     +                NUM, PMASS, R, V, FNAME, IERR)
C DT     - STRIDE.
C TSTART - INITIAL TIME.
C TEND   - FINAL MOMENT.
C ALPHA  - COEFFICIENT OF POTENTIAL FIELD
C NUM    - NUMBER OF BODIES.
C PMASS  - ARRAY OF MASSES OF PARTICLES. DIMENSION OF 'NUM'.
C R      - VECTOR OF INITIAL POSITIONS; INTERNAL VARIABLE - 
C          CURRENT POSIOTIONS. DIMENSION OF '3*NUM'.
C V      - VECTOR OF INITIAL VELOCITIES; INTERNAL VARIABLE - 
C          CURRENT VELOCITIES. DIMENSION OF '3*NUM'.
C FNAME  - OUTPUT FILE.
C IERR   - ERROR FLAG.
      IMPLICIT DOUBLE PRECISION (A-H, P-Z)
      INTEGER NUM, TNUM, I, J, K, IERR
      CHARACTER*12 FNAME
      CHARACTER*17 INFORMAT
      DIMENSION PMASS(NUM)
      DIMENSION R(3*NUM), V(3*NUM), A(3*NUM)
      
      WRITE(UNIT=INFORMAT,FMT=90) 6*NUM
      IERR = 0;     TNUM = 3*NUM
      DTOUT = 0.01; TOUT = DTOUT
      T = TSTART
      CALL SET(NUM,TNUM,PMASS,R,V,A)
      OPEN(UNIT=10,FILE=FNAME,STATUS='REPLACE',IOSTAT=IERR,ERR=50)
      DO
        IF (T .GT. TEND) EXIT
        T = T + DT
        
        DO I=1, TNUM
          V(I) = V(I) + 0.5*A(I)*DT
          R(I) = R(I) + V(I)*DT
        END DO
        
        CALL SET(NUM,TNUM,PMASS,R,V,A)
        
        DO I=1, TNUM
          V(I) = V(I) + 0.5*A(I)*DT
        END DO
        
        IF (T .GE. TOUT) THEN
        WRITE(UNIT=10, FMT=INFORMAT) (R(I),I=1,TNUM), (V(I),I=1,TNUM)
          TOUT = TOUT + DTOUT
        ENDIF
      END DO
   50 CLOSE(UNIT=10,IOSTAT=IERR)
      RETURN
   90 FORMAT('(',I5,'(F10.3,1X))')
  100 FORMAT(12(F8.3,1X))
      END
      
      
      SUBROUTINE SET(NUM,TNUM,PMASS,R,V,A)
      IMPLICIT DOUBLE PRECISION (A-H, P-Z)
      INTRINSIC DSQRT
      INTEGER NUM, TNUM, I, J, K
      DIMENSION PMASS(NUM)
      DIMENSION R(TNUM), V(TNUM), A(TNUM)
      DIMENSION RIJ(NUM,NUM,3), RR(NUM,NUM)
      DIMENSION AC(NUM,3)
      DO I=1,NUM
        DO J=1,NUM
          DO K=1,3
            RIJ(I,J,K) = R(3*I+K-3) - R(3*J+K-3)
          END DO
        END DO
      END DO
C CALCULATION OF MODULES. RETURNS THEM IN 'RR'
      CALL SDOT3D(RIJ, RR, NUM, NUM, 3)
C SETTING ACCELERATION      
      DO I=1,NUM
        DO K=1,3
          AC(I,K) = 0.0
          DO 10 J=1,NUM
            IF(J .EQ. I) GOTO 10
            AC(I,K) = AC(I,K) + RIJ(I,J,K)/(RR(I,J)*DSQRT(RR(I,J)))
   10     CONTINUE
          AC(I,K) = -ALPHA*AC(I,K)/PMASS(I)
        END DO
      END DO
C SETTING 'A'
      CALL M2V(A,AC,NUM,3)
      RETURN
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
      
      SUBROUTINE SDOT3D(X, SDOT, DIMI, DIMJ, DIMK)
      DOUBLE PRECISION SDOT, X
      INTEGER DIMI, DIMJ, DIMK, I, J, K
      DIMENSION X(DIMI, DIMJ, DIMK), SDOT(DIMI, DIMJ)
      DO I=1,DIMI
        DO J=1,DIMJ
          SDOT(I,J) = 0.0
          DO K=1,DIMK
            SDOT(I,J) = SDOT(I,J) + X(I,J,K)*X(I,J,K)
          END DO
        END DO
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
      
      SUBROUTINE V2M(V,M,DIM1,DIM2)
C 'VECTOR-TO-MATRIX' SUBROUTINE
      INTEGER DIM1,DIM2,I,J
      DOUBLE PRECISION M,V
      DIMENSION M(DIM1,DIM2), V(DIM1*DIM2)
      DO I=1,DIM1,DIM2
        DO J=1,DIM2
          M(I,J) = V(I+J-1)
        END DO
      END DO
      RETURN
      END
      
      SUBROUTINE M2V(V,M,DIM1,DIM2)
C 'MATRIX-TO-VECTOR' SUBROUTINE
      INTEGER DIM1,DIM2,I,J
      DOUBLE PRECISION M,V
      DIMENSION M(DIM1,DIM2), V(DIM1*DIM2)
      DO I=1,DIM1,DIM2
        DO J=1,DIM2
           V(I+J-1) = M(I,J)
        END DO
      END DO
      RETURN
      END
