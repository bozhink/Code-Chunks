      PROGRAM DLA
      PARAMETER (IDIMV=215)
      PARAMETER (IDIMV1=IDIMV-1,IDIMV2=IDIMV*IDIMV)
      PARAMETER (IHALF=IDIMV1/2)
      PARAMETER (N=20000)
      PARAMETER (ITMAX=10000000)
      DIMENSION IPOINTS(N,2)
      LOGICAL A(0:IDIMV1,0:IDIMV1)
      DATA A /IDIMV2*.FALSE./
      DATA A(IHALF,IHALF) /.TRUE./
      DATA IPOINTS(1,1),IPOINTS(1,2) /IHALF,IHALF/
      IDUM=576454
C     INITIALIZE RANDOM GENERATOR
C      CALL SYSTEM_CLOCK(ICLOCK)
C      CALL SRAND(ICLOCK)
C
C DEBUG: PRINT INITIAL MATRIX
C      DO K=0,IDIMV1
C      PRINT*,(A(K,J),J=0,IDIMV1)
C      ENDDO
C
      DO I=2,N
C        SET INITIAL POINT (IX,IY)
         IMARK=INT(4.0*RAN2(IDUM))
         IF (IMARK.EQ.0) THEN
            IX=INT(IDIMV*RAN2(IDUM))
            IY=0
         ELSEIF (IMARK.EQ.1) THEN
            IX=INT(IDIMV*RAN2(IDUM))
            IY=IDIMV1
         ELSEIF (IMARK.EQ.2) THEN
            IX=0
            IY=INT(IDIMV*RAN2(IDUM))
         ELSE
            IX=IDIMV1
            IY=INT(IDIMV*RAN2(IDUM))
         ENDIF
C
         ITER=1
         DO
C           TEST IF NEAR THERE IS FILLED POINT
            IXP1=MOD(IDIMV+IX+1,IDIMV)
            IXM1=MOD(IDIMV+IX-1,IDIMV)
            IYP1=MOD(IDIMV+IY+1,IDIMV)
            IYM1=MOD(IDIMV+IY-1,IDIMV)
            IF (A(IXP1,IY).OR.A(IXM1,IY).OR.
     *          A(IX,IYP1).OR.A(IX,IYM1)) THEN
               A(IX,IY)=.TRUE.
               IPOINTS(I,1)=IX
               IPOINTS(I,2)=IY
C               PRINT 1000, IX, IY
               GOTO 10
            ENDIF
C           DO NEXT STEP
    2       IX=MOD(IDIMV+IX+SIGN(1,INT(2.0*RAN2(IDUM))-1),IDIMV)
    3       IY=MOD(IDIMV+IY+SIGN(1,INT(2.0*RAN2(IDUM))-1),IDIMV)
C           CHECK IF MAXIMUM ITERATIONS HAS BEEN EXCEEDED
            ITER=ITER+1
            IF (ITER.GT.ITMAX) GOTO 100
         ENDDO
   10    CONTINUE
      ENDDO
C     PRINTS THE RESULT
      OPEN(UNIT=10,FILE='dla.txt')
      DO I=1,N
         WRITE (UNIT=10,FMT=1000) IPOINTS(I,1),IPOINTS(I,2)
      ENDDO
      CLOSE(UNIT=10)
      STOP
  100 PRINT 1010
      STOP 'PROGRAM ENDED'
 1000 FORMAT('FILLED',1X,I5,1X,I5)
 1010 FORMAT('ERROR: MAXIMUM NUMBER OF ITERATIONS EXCEEDED')
 2000 STOP 'ERROR OPENING OUTPUT FILE'
 2010 STOP 'ERROR CLOSING OUTPUT FILE'
 2020 STOP 'ERROR WRITING TO OUTPUT FILE'
      END

  
