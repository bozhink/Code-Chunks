      SUBROUTINE PRNT(V,IMAX,JMAX,KMAX,IJKMAX,IJMAX,JMAXP1,INC,LUN)
C======================================================================C
C                    SUBROUTINE PRNT
C  Modified 01-AUG-91 by FWJ: QUIT removed (not used) and LUN added
C  to allow output to a file.
C======================================================================C
      REAL*4 V(IJKMAX*MULT)
      LOGICAL QUIT
      COMMON/BLOCK2/TOLER,IADRESS,MULT,OFF,OFF0,IOPT,BMAX
C
C     X,Y,Z form a right-handed coordinate system.
C
      CHARACTER*1 ALPHA1(24),ALPHA(24),ALINE(100)
      REAL ALPHAV(21)
      INTEGER III(100)
C     INTEGER IALINE(100)
C     EQUIVALENCE(ALINE,IALINE)
      CHARACTER*20 LINE
      LOGICAL PAGE
      CHARACTER*1 BLANK/' '/
C     DATA ZERO,ALPHA1/1HZ,1HA,1HB,1HC,1HD,1HE,1HF,1HG,1HH,1HI,
C    +  1HJ,1HK,1HL,1HM,1HN,1HO,1HP,1HQ,1HR,1HS,1HT,1HU,1H@,1H:,1H=/
      CHARACTER*1 ZERO/'.'/
      DATA ALPHA1/'0',' ','1',' ','2',' ','3',' ','4',' ','5',' ',
     #            '6',' ','7',' ','8',' ','9',' ','A',
     #            '@',':','='/
      CHARACTER*1 BDRY
      CHARACTER*1 A,B,C
      REAL AREAL
      EQUIVALENCE(A,AREAL)

C  10 FORMAT(25A1)
D     WRITE(6,*)'PRNT: LUN=',LUN
C     WRITE(6,*)'ENTER CHARACTER FOR BOUNDARY'
C     READ(5,22222)BDRY
C22222FORMAT(A1)
C     IBDRY=252
      BDRY='$'

      IX=IMAX
      IY=JMAX
      IZ=KMAX
      DO 20 I=1,24
20    ALPHA(I)=ALPHA1(I)
      DO 30 I=1,21
30    ALPHAV(I)=FLOAT(I)/20.0-0.05
40    FORMAT(3I3)
C     IF(INC.NE.1) GO TO 60
      DO 50 I=2,20,2
50    ALPHA(I)=BLANK
C
C  Find range of V values for normalization.
C
      VMAX=ABS(V(MULT))-OFF
      VMIN=VMAX
      DO 55 I=MULT,IJKMAX*MULT,MULT
      TEMP=ABS(V(I))-OFF
      IF(TEMP.GT.VMAX)VMAX=TEMP
      IF(TEMP.LT.VMIN)VMIN=TEMP
55    CONTINUE
      RANGE=VMAX-VMIN
      IF(RANGE.EQ.0.0)RANGE=1.0
C
C   Request for slices and recycle point for errors in requests
C
60    LL=0
      A=BLANK
      IF(KMAX.EQ.1)THEN
        LL=1
        A='K'
        GO TO 99
      ENDIF
70    WRITE(6,80)
80    FORMAT(' ENTER SLICE# (0=NO MORE) AND  I  J  OR  K :',$)
      READ(5,90,END=999,ERR=70)LINE
90    FORMAT(A)
      CALL EXPARI(LINE,LL,1,ISTAT)
      IF(ISTAT.NE.0)GO TO 70
      CALL EXFIELD(LINE,A,2,ISTAT)
      IF(ISTAT.NE.0)GO TO 70
      CALL UPRCASE(A,A)
      IF(LL.LE.0) GO TO 390
99    M1=1
      M2=100
      WRITE(LUN,140)A,LL
140   FORMAT(' X-SECTION TAKEN AT ',A4,' =',I3/'0')
      IF(A.EQ.'X')GO TO 160
      IF(A.EQ.'I') GO TO 160
      IF(A.EQ.'Y')GO TO 190
      IF(A.EQ.'J') GO TO 190
      IF(A.EQ.'Z')GO TO 210
      IF(A.EQ.'K') GO TO 210
      WRITE(6,150)
150   FORMAT(' PLANE REQUESTED NOT  I   J   K   X   Y   Z')
      GO TO 60
160   IF(LL.GE.1 .AND. LL.LE.IMAX) GO TO 180
      WRITE(6,170)LL,IMAX
170   FORMAT(' SLICE#',I5,' OUTSIDE RANGE 1 TO ',I5)
      GO TO 60
180   B='Z'
      C='Y'
      MMAX=IZ
      NMAX=IY
      GO TO 230
190   IF(LL.GE.1 .AND. LL.LE.JMAX) GO TO 200
      WRITE(6,170)LL,JMAX
      GO TO 60
200   B='Z'
      C='X'
      MMAX=IZ
      NMAX=IX
      GO TO 230
210   IF(LL.GE.1 .AND. LL.LE.KMAX) GO TO 220
      WRITE(6,170)LL,KMAX
      GO TO 60
C
C Process the slice
C
220   B='Y'
      C='X'
      MMAX=IY
      NMAX=IX
230   WRITE(6,100) LL,A
100   FORMAT(' REQUEST MADE FOR PRINTS OF SLICE',I5,' PLANE= ',A4)
      WRITE(LUN,120)ALPHAV
 120  FORMAT('  0.0 ',F3.1,'+ ',20(F4.2,2X))
C120  FORMAT('1 0.0 ',F3.1,'+ ',20(F4.2,2X))
      WRITE(LUN,130)ZERO,(ALPHA(I),I=1,21)
130   FORMAT(3X,A1,3X,A1,4X,20(A1,5X)/)
      WRITE(LUN,135)VMAX,VMIN
135   FORMAT(/' VMAX=',E20.10,10X,'VMIN=',E20.10)
      DO 240 I=M1,M2
      III(MOD(I-1,100)+1)=MOD(I/100,10)
240   CONTINUE 
      PAGE=MMAX.GT.M2
      IF(M2.GT.MMAX)M2=MMAX
      WRITE(LUN,290)B,(III(MOD(I-1,100)+1),I=M1,M2)
290   FORMAT(30X,'*',A1,'*',/'0',4X,100I1)
      DO 250 I=M1,M2
      III(MOD(I-1,100)+1)=MOD(I/10,10)
250   CONTINUE 
      WRITE(LUN,260)(III(MOD(I-1,100)+1),I=M1,M2)
260   FORMAT(1H ,4X,100I1)
      DO 270 I=M1,M2
      III(MOD(I-1,100)+1)=MOD(I,10)
270   CONTINUE
      WRITE(LUN,280)(III(MOD(I-1,100)+1),I=M1,M2)
280   FORMAT(1H ,4X,100I1)
      IF(A.EQ.'X')ASSIGN 310 TO NA
      IF(A.EQ.'I')ASSIGN 310 TO NA
      IF(A.EQ.'Y')ASSIGN 320 TO NA
      IF(A.EQ.'J')ASSIGN 320 TO NA
      IF(A.EQ.'Z')ASSIGN 330 TO NA
      IF(A.EQ.'K')ASSIGN 330 TO NA
      WRITE(LUN,300)
300   FORMAT(' ')

      DO 370 N=1,NMAX
      DO 350 M=M1,M2

      MMOD=MOD(M-1,100)+1
      GO TO NA,(310,320,330)
310   TTT=V(MULT*(LL+(N-JMAXP1)*IMAX+M*IJMAX))
      GO TO 340
320   TTT=V(MULT*(N+(LL-JMAXP1)*IMAX+M*IJMAX))
      GO TO 340
330   TTT=V(MULT*(N+(M-JMAXP1)*IMAX+LL*IJMAX))

C340  T=(ABS(TTT)-OFF-VMIN)/RANGE
 340  IF(TTT.GE.0.)THEN
        T=(TTT-OFF-VMIN)/RANGE
        IT=(T*20.0)+1.500000
        IF(T.LT.0.0.OR.T.GT.1.0)ALINE(MMOD)='X'
        IF(T.GT.0.0.AND.T.LE.1.0)ALINE(MMOD)=ALPHA(IT)
        IF(T.EQ.0.0)ALINE(MMOD)=ZERO
      ELSE
        ALINE(MMOD)=BDRY
C       IALINE(MMOD)=IBDRY
      ENDIF
350   CONTINUE
      M2MOD=MOD(M2-1,100)+1
      WRITE(LUN,360)N,(ALINE(I),I=1,M2MOD)
360   FORMAT('9',I3,1X,100(A1))
370   CONTINUE

      WRITE(LUN,380)C
380   FORMAT('9'/'9*',A1,'*')
C
C Is another "page" necessary for this slice-if not go for new slice
C
      IF(.NOT.PAGE)THEN
        IF(KMAX.EQ.1)RETURN
        GO TO 60
      ENDIF
      M1=M1+100
      M2=M2+100
      IF(M2.GT.MMAX)M2=MMAX
      GO TO 230
390   WRITE(LUN,400)
400   FORMAT('1')

 999  RETURN

      END
