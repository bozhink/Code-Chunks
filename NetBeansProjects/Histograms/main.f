C
C File:   main.f
C Author: bozhin
C
C Created on November 19, 2012, 2:26 PM
C
      PROGRAM XXX
      IMPLICIT NONE
C DATA RELATED ARGUMENTS
C UPPER LIMIT OF INPUT DATA POINTS
      INTEGER NMAX
      PARAMETER (NMAX=200 000)
C UPPER LIMIT OF HISTOGRAM BINS
      INTEGER NHMAX
      PARAMETER (NHMAX=31)
C ARRAYS, CONTAINING HISTOGRAM DATA
      INTEGER ISDATA(NMAX), ITDATA(NMAX)
      INTEGER ITHIST(NHMAX), ISHIST(NHMAX)
      DOUBLE PRECISION PT(NHMAX), PS(NHMAX)
      DOUBLE PRECISION TT(NHMAX), SS(NHMAX)
C SCALAR DATA-RELATED VARIABLES
      INTEGER IS, IT, ISMIN, ISMAX, ITMIN, ITMAX
C     WIDTH OF BINS FOR S- AND T-HISTOGRAMS
      INTEGER IHS, IHT
      DOUBLE PRECISION S, T, AREA
C LATTICE SIZE
      INTEGER L
C NUMBER OF DATA POINTS
      INTEGER N
C NUMBER OF HISTOGRAM'S BINS + 1
      INTEGER NHIST
C FILE-RALTED ARGUMENTS
      CHARACTER*255 ARG, FNAME
      CHARACTER*12 TFILE, SFILE
C UIN = UNIT INPUT
C USH = UNIT S-HISTOGRAM FILE
C UTH = UNIT T-HISTOGRAM FILE
      INTEGER UIN, USH, UTH, IERR
      PARAMETER (UIN=10, USH=11, UTH=12)
C SOME SYSTEM CALLS
      INTEGER IARGC
C NUMBER OF INPUT PARAMETERS
      INTEGER NARG, ICURRENT
C Q-MOMENTS VARIABLES
C NUMBER OF Q-MOMENTS
      INTEGER NQ
      PARAMETER (NQ=30)
C MAXIMAL NUMBER OF VALUES OF L = MAXIMAL NUMBER OF INPUT FILES
      INTEGER NMAXL
      PARAMETER (NMAXL=30)
C Q-MOMENTS OUTPUT FILES
      CHARACTER*9 FTQMOM, FSQMOM
      PARAMETER (FTQMOM = 't_moments')
      PARAMETER (FSQMOM = 's_moments')
      INTEGER UTQ, USQ
      PARAMETER (UTQ=15, USQ=16)
C MINIMAL Q-MOMENTS AND Q-MOMENT STRIDE
      DOUBLE PRECISION QMMIN, QH
      PARAMETER (QMMIN=0.D0, QH=0.1D0)
C DATA ARRAYS TO STORE Q-MOMENTS INFORMATION
      DOUBLE PRECISION Q(NQ), DLOGL(NMAXL)
      DOUBLE PRECISION QMS(NMAXL, NQ), QMT(NMAXL, NQ)
C SIGMA PARAMETERS PART
      DOUBLE PRECISION SIGMAT(NQ), SIGMABT(NQ)
      DOUBLE PRECISION SIGMAS(NQ), SIGMABS(NQ)
      CHARACTER*6 FSIGMA
      PARAMETER (FSIGMA = 'sigmaq')
      INTEGER USIGMA
      PARAMETER (USIGMA=17)
C SOME COMMON ARGUMENTS
      INTEGER I, K, ITT, ISS
      DOUBLE PRECISION ZS, ZT, ZSB, ZTB, TAUS, TAUT
      DOUBLE PRECISION QMOMENT, FHIST
C
C PROGRAM BODY
C
C FIRST CHECK COMMAND-LINE ARGUMENTS
      IF (IARGC().LT.2) THEN
          CALL GETARG(0, ARG)
          PRINT 1, ARG
    1 FORMAT('USAGE: ',A95,' <L>  <IN FILE>[, <L> <IN FILE> ...]',/,
     * 'WHERE:',/,4X,
     * '<L>       = LATTICE SIZE',/,4X,
     * '<IN FILE> = INPUT FILE, CONTAINIG DATA POINTS',/,4X,
     * 'OUTPUT DATA WILL BE STORED IN FILES s_hist AND t_hist',/,4X,
     * 'WICH WILL BE OVERWRITTEN')
          STOP
      ENDIF
C GETTING THE NUMBER OF ARGUMENTS
      NARG = 2*(IARGC()/2)
      IF (NARG/2.GT.NMAXL) THEN
          PRINT*,'ERROR: MAXIMAL NUMBER OF UNPUT FILES IS NMAXL=',NMAXL
          STOP 'NMAXL EXCEEDED'
      ENDIF
C IF EVERYTHING IS OK
C
C OPEN OUTPUT Q-MOMENTS FILES
      OPEN(UNIT=UTQ,FILE=FTQMOM,STATUS='REPLACE',IOSTAT=IERR,ERR=4030)
      OPEN(UNIT=USQ,FILE=FSQMOM,STATUS='REPLACE',IOSTAT=IERR,ERR=4040)
C
C SOME Q-MOMENTS INITIALIZATIONS
C CALCULATION OF VALUSE OF Q FOR Q-MOMENTS
      DO I = 1, NQ
          Q(I) = QMMIN + DFLOAT(I-1)*QH
      ENDDO
C INITIALIZATION OF ARRAYS
      DO K = 1, NMAXL
          DO I = 1, NQ
              QMS(K,I) = 0.D0
              QMT(K,I) = 0.D0
          ENDDO
          DLOGL(K) = 0.D0
      ENDDO
C********************************************************************C
C                                                                    C
C                     BEGIN MAIN LOOP                                C
C                                                                    C
C********************************************************************C
      DO ICURRENT = 1, NARG, 2
C
C INITIALIZATION OF MAIN DATA ARRAYS
      K = ICURRENT/2+1 ! THE NUMBER OF THE CURRENTFILE
      DO I = 1, NMAX
          ISDATA(I) = 0
          ITDATA(I) = 0
      ENDDO
C
C INITIALIZATION OF HISTOGRAM ARRAYS
      DO I=1,NHMAX
          ITHIST(I) = 0
          ISHIST(I) = 0
          PS(I) = 0.D0
          PT(I) = 0.D0
          SS(I) = 0.D0
          TT(I) = 0.D0
      ENDDO
C
C GET LATTICE SIZE
      CALL GETARG(ICURRENT, ARG)
      READ(UNIT=ARG,FMT=*) L
C CALCULATE TH LOGARITHM OF L
      DLOGL(K) = DLOG(DFLOAT(L))
C GET NAMES OF INPUT AND OUTPUT FILES
      CALL GETARG(ICURRENT+1, FNAME)
C INITIALIZATION OF DATA ARRAYS
      DO I = 1, NMAX
          ISDATA(I) = 0
          ITDATA(I) = 0
      ENDDO
C SET S- AND T-HISTOGRAM FILE NAMES
      WRITE(UNIT=TFILE,FMT=2) L
      WRITE(UNIT=SFILE,FMT=3) L
    2 FORMAT('t_hist-',I5.5)
    3 FORMAT('s_hist-',I5.5)
C********************************************************************
C
C                    >> DATA READING PART <<
C
C     TRY TO OPEN INPUT FILE
      OPEN(UNIT=UIN,FILE=FNAME,STATUS='OLD',IOSTAT=IERR,ERR=4000)
C     TRY TO READ INPUT FILE AND COUNT THE NUMBER OF DATA POINTS
      N=0
      ITMIN=10
      ISMIN=10
      ITMAX=0
      ISMAX=0
      DO
      IF (N.GT.NMAX) GOTO 10
      READ(UNIT=UIN,FMT=*,IOSTAT=IERR,ERR=3000,END=11)IT,IS
      IF (IT.LT.L-1) THEN
          N=N+1
          ISDATA(N) = IS
          ITDATA(N) = IT
          ITMIN = MIN(ITMIN, IT)
          ISMIN = MIN(ISMIN, IS)
          ITMAX = MAX(ITMAX, IT)
          ISMAX = MAX(ISMAX, IS)
      ENDIF
      ENDDO
   10 PRINT*,'DATA POINTS EXCEEDED MAXIMAL NUMBER NMAX=',NMAX
      PRINT*,'BECAUSE OF THAT, THE NUMBER OF DATA POINT ',
     *       'IS RESTRICTED TO',NMAX
   11 CONTINUE
C     TRY TO CLOSE INPUT FILE
      CLOSE(UNIT=UIN,IOSTAT=IERR,ERR=4001)
C     CALCULATION OF THE NUMBER OF BINS + 1
      NHIST = INT(2.0*LOG(FLOAT(N))) + 1
      IF (NHIST.GT.NHMAX) GOTO 2000
C     CALCULATION OF WIDTH OF BINS
      IHS = ISMAX / NHIST + 1
      IHT = ITMAX / NHIST + 1
C     CALCULATION OF HISTOGRAM AREA
      AREA = DFLOAT(N)
C********************************************************************
C
C                  >> PRINT INFO PART <<
C
C HERE GOES SOME OUTPUT OF CALCULATED INFORMATION
      PRINT '(70(''=''))'
      PRINT*,'STOCHASTIC DIRECTED SANDPILE MODEL'
      PRINT '(70(''=''))'
      PRINT*,'LATTICE SIZE L=',L
      PRINT*,'NUMBER OF DATA POINTS READED = ',N
      PRINT*,'NUMBER OF HISTOGRAM BINS+1   = ',NHIST
      PRINT 12, 'T', ITMIN, 'T', ITMAX
      PRINT 12, 'S', ISMIN, 'S', ISMAX
   12 FORMAT(1X,A1,'_MIN=',I3,4X,A1,'_MAX=',I8)
      PRINT*,'HISTOGRAM: BIN WIDTH:'
      PRINT 13,'T',IHT,'T',IHT*NHIST
      PRINT 13,'S',IHS,'S',IHS*NHIST
   13 FORMAT(1X,A1,'_H=',I5,2X,A1,'_H*NHIST=',I8)
C********************************************************************
C
C                        >> HISTOGRAM PART <<
C
C CALCULATION OF HISTOGRAMS
      DO I = 1, N
          ITT = ITDATA(I) / IHT + 1
          ISS = ISDATA(I) / IHS + 1
          IF (ITT.GT.NHMAX.OR.ISS.GT.NHMAX) GOTO 2010
          ITHIST(ITT) = ITHIST(ITT) + 1
          ISHIST(ISS) = ISHIST(ISS) + 1
      ENDDO
C CALCULATION OF PROBABILITIES P(S) AND P(T)
      DO I = 1, NHMAX
          TT(I) = DFLOAT((I-1)*IHT+1)
          SS(I) = DFLOAT((I-1)*IHS+1)
          PT(I) = DFLOAT(ITHIST(I)) / AREA
          PS(I) = DFLOAT(ISHIST(I)) / AREA
      ENDDO
C
C IF EVERYTHING IS OK, WE HAVE S- AND T-HISTOGRAMS AND
C THE PROBABILITY DISTRIBUTIONS P(T) AND P(S)
C
C               >> WRITE HISTOGRAMS TO FILE PART <<
C
C     TRY TO OPEN S- AND T-HISTOGRAM FILES
      OPEN(UNIT=USH,FILE=SFILE,STATUS='REPLACE',IOSTAT=IERR,ERR=4010)
      OPEN(UNIT=UTH,FILE=TFILE,STATUS='REPLACE',IOSTAT=IERR,ERR=4020)
C     TRY TO WRITE HISTOGRAM DATA TO CORRESPONDING FILES
      WRITE(UNIT=USH,FMT=1000,IOSTAT=IERR,ERR=3010)
      WRITE(UNIT=UTH,FMT=1010,IOSTAT=IERR,ERR=3020)
      DO I=1, NHIST
          WRITE(UNIT=USH,FMT=1020,IOSTAT=IERR,ERR=3010)
     *         (I-1)*IHS+1, PS(I), ISHIST(I)
          WRITE(UNIT=UTH,FMT=1020,IOSTAT=IERR,ERR=3020)
     *         (I-1)*IHT+1, PT(I), ITHIST(I)
      ENDDO
C     TRY TO CLOSE S- AND T-HIST DATA FILES
      CLOSE(UNIT=USH,IOSTAT=IERR,ERR=4011)
      CLOSE(UNIT=UTH,IOSTAT=IERR,ERR=4021)
C********************************************************************
C
C                     >> Q-MOMENTS PART <<
C
C CALCULATION OF T-Q-MOMENTS
      DO I = 1, NQ
          QMT(K, I) = QMOMENT(AREA, Q(I), NHIST, TT, PT)
      ENDDO
C     WRITE T-QMOMENTS TO FILE
      WRITE(UNIT=UTQ,FMT=*,IOSTAT=IERR,ERR=3030)L,
     *      DLOGL(K), (Q(I), QMT(K,I), I = 1, NQ)
C
C CALCULATION OF S-Q-MOMENTS
      DO I = 1, NQ
          QMS(K, I) = QMOMENT(AREA,Q(I),NHIST,SS,PS)
      ENDDO
C WRITE T-QMOMENTS TO FILE
      WRITE(UNIT=USQ,FMT=*,IOSTAT=IERR,ERR=3040)L,
     *      DLOGL(K), (Q(I), QMS(K,I), I = 1, NQ)
C
C
C     END OF MAIN LOOP
      ENDDO
C********************************************************************C
C                                                                    C
C                       END MAIN LOOP                                C
C                                                                    C
C********************************************************************C
C
C CLOSE Q-MOMENTS OUTPUT FILES
      CLOSE(UNIT=UTQ,IOSTAT=IERR,ERR=4031)
      CLOSE(UNIT=USQ,IOSTAT=IERR,ERR=4041)
C
C NOW:
C WE HAVE CALCULATED THE S- AND T-HISTOGRAMS, AND HAVE WRITTEN
C    THEM TO CORRESPONDING HISTOGRAM FILES
C WE HAVE CALCULATED THE PROBABILITY DISTRIBUTIONS
C WE HAVE CALCULATED Q-MOMENTS OF INPUT DATA FILES
C
C THE NUMBER OF INPUT DATA POINTS NOW IS K
C
C NEXT:
C WE WILL CALCULATE THE SIGMA PARAMETERS FOR S AND T
C AND HAVING THESE PARAMETERS AS FUNCTIONS OF Q
C WE WILL CALCULATE THE CRITICAL EXPONENTS
C
C********************************************************************
C
C             >> CALCULATION OF SIGMA PART <<
C
      PRINT*,'CALCULATION OF SIGMA_T'
      CALL SIGMAC(K, NMAXL, DLOGL, NQ, QMT, SIGMAT, SIGMABT)
      PRINT*,'CALCULATION OF SIGMA_T'
      CALL SIGMAC(K, NMAXL, DLOGL, NQ, QMS, SIGMAS, SIGMABS)
C     TRY TO OPEN SIGMA-Q FILE
      OPEN(UNIT=USIGMA,FILE=FSIGMA,STATUS='REPLACE',
     *            IOSTAT=IERR,ERR=4050)
C WRITE SIGMA-Q DATA TO FILE
      DO I = 1, NQ
      WRITE(UNIT=USIGMA,FMT=*,IOSTAT=IERR,ERR=3050)
     *  Q(I), SIGMAT(I), SIGMABT(I), SIGMAS(I), SIGMABS(I)
      ENDDO
C     TRY TO CLOSE SIGMA-Q FILE
      CLOSE(UNIT=USIGMA,IOSTAT=IERR,ERR=4051)
C
C CALCULATION OF CRITICAL EXPONENTS
      CALL LINLSQ(NQ, Q, SIGMAT, 1, NQ, ZT, ZTB)
      CALL LINLSQ(NQ, Q, SIGMAS, 1, NQ, ZS, ZSB)
      TAUT = 1.D0 - ZTB/ZT
      TAUS = 1.D0 - ZSB/ZS
      PRINT*,'Z_T=',ZT
      PRINT*,'ZTB=',ZTB
      PRINT*,'TAUT=',TAUT
      PRINT*,'Z_S=',ZS
      PRINT*,'ZSB=',ZSB
      PRINT*,'TAUS=',TAUS



      STOP
 1000 FORMAT('#',6x,'S',10X,'P(S)',8X,'NUMBER OF DATA POINTS')
 1010 FORMAT('#',6x,'T',10X,'P(T)',8X,'NUMBER OF DATA POINTS')
 1020 FORMAT(I8,1X,F18.14,1X,I8)
 2000 PRINT*,'ERROR: REQUIRED NUMBER OF BINS+1 IS GREATER THAN'
      PRINT*,'THE DEFINED ONE. YOU MUST INCREASE NHMAX'
      STOP
 2010 PRINT*,'ERROR IN INPUT DATA:'
      PRINT*,'S OR T PARAMETER IS OUT OF RANGE'
      STOP
 3000 PRINT*,'ERROR READING INPUT DATA. ERROR=',IERR
      GOTO 5001
 3010 PRINT*,'ERROR WTITING TO S-HIST FILE. ERROR=',IERR
      GOTO 5001
 3020 PRINT*,'ERROR WTITING TO T-HIST FILE. ERROR=',IERR
      GOTO 5001
 3030 PRINT*,'ERROR WTITING TO T-Q-MOMENTS FILE. ERROR=',IERR
      GOTO 5001
 3040 PRINT*,'ERROR WTITING TO S-Q-MOMENTS FILE. ERROR=',IERR
      GOTO 5001
 3050 PRINT*,'ERROR WRITING TO SIGMA-T FILE. ERROR=',IERR
      GOTO 5001
 4000 PRINT*,'CANNOT OPEN INPUT FILE. ERROR=',IERR
      GOTO 5000
 4001 PRINT*,'CANNOT CLOSE INPUT FILE. ERROR=',IERR
      GOTO 5000
 4010 PRINT*,'CANNOT OPEN S-HISTOGRAM FILE. ERROR=',IERR
      GOTO 5000
 4011 PRINT*,'CANNOT CLOSE S-HISTOGRAM FILE. ERROR=',IERR
      GOTO 5000
 4020 PRINT*,'CANNOT OPEN T-HISTOGRAM FILE. ERROR=',IERR
      GOTO 5000
 4021 PRINT*,'CANNOT CLOSE T-HISTOGRAM FILE. ERROR=',IERR
      GOTO 5000
 4030 PRINT*,'CANNOT OPEN T-Q-MOMENTS FILE. ERROR=',IERR
      GOTO 5000
 4031 PRINT*,'CANNOT CLOSE T-Q-MOMENTS FILE. ERROR=',IERR
      GOTO 5000
 4040 PRINT*,'CANNOT OPEN S-Q-MOMENTS FILE. ERROR=',IERR
      GOTO 5000
 4041 PRINT*,'CANNOT CLOSE S-Q-MOMENTS FILE. ERROR=',IERR
      GOTO 5000
 4050 PRINT*,'CANNOT OPEN SIGMA-Q FILE. ERROR=',IERR
      GOTO 5000
 4051 PRINT*,'CANNOT CLOSE SIGMA-Q FILE. ERROR=',IERR
      GOTO 5000
 5000 STOP 'FILE ERROR'
 5001 STOP 'DATA IO ERROR'
      END

      FUNCTION FHIST(Z, N, X, PX)
      IMPLICIT NONE
      INTEGER N, I, K
      DOUBLE PRECISION FHIST, Z, X(*), PX(*)
      K=0
      DO I = 1, N-1
          IF (X(I).LE.Z.AND.Z.LE.X(I+1)) THEN
              K=I
              GOTO 10
          ENDIF
      ENDDO
   10 CONTINUE
      IF (K.EQ.0 .OR. K.GT.N) THEN
          FHIST=0.D0
          RETURN
      ELSE
          !FHIST = (PX(K+1)-PX(K))/(X(K+1)-X(K)) * (Z-X(K)) + PX(K)
          FHIST=PX(K)
      ENDIF
      END

      FUNCTION QMOMENT(AREA, Q, N, X, PX)
      IMPLICIT NONE
      INTEGER N, I
      DOUBLE PRECISION QMOMENT, Q, XMIN, XMAX
      DOUBLE PRECISION X(*), PX(*), AREA
      DOUBLE PRECISION H, Z, S
      DOUBLE PRECISION FHIST
      H = 1.D0
      S = 0.D0
      DO I = 0, INT(X(N)-X(1))
          Z = X(1) + DFLOAT(I)*H
          S = S + FHIST(Z, N, X, PX)*(Z**Q/(X(N)-X(1)))
      ENDDO
      QMOMENT=DLOG(S)
      END

      SUBROUTINE SIGMAC(N, NL, DLOGL, NQ, QM, SIGMAA, SIGMAB)
      IMPLICIT NONE
C THIS SUBROUTINE CALCULATES SIGMA
      INTEGER N, NL, NQ
      DOUBLE PRECISION DLOGL(NL), QM(NL, NQ)
      DOUBLE PRECISION SIGMAA(NQ), SIGMAB(NQ)
      INTEGER I, Q
      DOUBLE PRECISION DN, SX, SY, SXX, SXY, DENOM
      IF (N.GT.NL) THEN
          PRINT*,'SIGMAC: ERROR: N MUST BE LESS OR EQUAL TO NL'
          STOP 'SIGMAC'
      ENDIF
      DN  = DFLOAT(N)
      SX  = 0.D0
      SXX = 0.D0
      DO I = 1, N
          SX  = SX  + DLOGL(I)
          SXX = SXX + DLOGL(I)*DLOGL(I)
      ENDDO
      DENOM = SX*SX - DN*SXX
      DO Q = 1, NQ
      SY = 0.D0
      SXY = 0.D0
      DO I = 1, N
          SY  = SY  + QM(I, Q)
          SXY = SXY + DLOGL(I)*QM(I, Q)
      ENDDO
      SIGMAA(Q) = (SX*SY-DN*SXY)/DENOM
      SIGMAB(Q) = (SY - SIGMAA(Q)*SX)/DN
      ENDDO
      END

      SUBROUTINE LINLSQ(N, X, Y, ILEFT, IRIGHT, A, B)
      IMPLICIT NONE
      INTEGER N, ILEFT, IRIGHT
      DOUBLE PRECISION X(N), Y(N)
      DOUBLE PRECISION A, B
      DOUBLE PRECISION SX, SY, SXX, SXY, DN
      INTEGER I
      DN   = DFLOAT(N)
      SX   = 0.D0
      SY   = 0.D0
      SXX  = 0.D0
      SXY  = 0.D0
      DO I = ILEFT, IRIGHT
          SX  =  SX + X(I)
          SY  =  SY + Y(I)
          SXX = SXX + X(I)*X(I)
          SXY = SXY + X(I)*Y(I)
      ENDDO
      A = (SX*SY - DN*SXY) / (SX*SX - DN*SXX)
      B = (SY - A*SX) / DN
      RETURN
      END

