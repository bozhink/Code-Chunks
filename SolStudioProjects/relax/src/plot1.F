      SUBROUTINE PLOT1(V,IMAX,JMAX,KMAX,IDIMP,IJKMAX,NCELLS,
     #  IXORG,IYORG,SPACEL,IFLUX,IDEBUG)
C======================================================================C
C                      SUBROUTINE PLOT1
C  Sets up the list of slices and contour levels for the plots
C======================================================================C
      REAL*4 V(*)

      COMMON/BLOCK2/TOLER,IADRESS,MULT,OFF,OFF0,IOPT,BMAX
      COMMON/SLICES/ISLICE(101),NSLICE,ISLCURRENT,PLANE
      CHARACTER*1 PLANE
      COMMON/LEVELS/CLEV(101),NCLEV,PCTLAB
      LOGICAL PCTLAB

      CHARACTER*1 PLANE_IN
      INTEGER ISLICE_IN(101)
      REAL CLEV_IN(101)

C 2-d case: trivial slice list
      IF(KMAX.EQ.1)GO TO 100

C======================================================================C
C  Determine the slice list
C======================================================================C
10    CALL CLTRANS
      WRITE(6,1000)PLANE
1000  FORMAT(' Plane for slice plots:  ',A1,'=constant')
      WRITE(6,*)
      WRITE(6,*)'Current list of slices to be plotted:'
      WRITE(6,2000)(ISLICE(I),I=1,NSLICE)
2000  FORMAT(1X,20I4)
15    WRITE(6,*)
      WRITE(6,*)'Options:'
      WRITE(6,*)'  0   Use current slice list'
      WRITE(6,*)'  1   Specify plane'
      WRITE(6,*)'  2   Specify range of slice numbers'
      WRITE(6,*)'  3   Specify individual slice numbers'
      WRITE(6,*)
16    IMENU=0
      CALL GETPARI('Option number',IMENU,1,ISTAT)
      IF(IMENU.EQ.0)THEN
        GO TO 100
      ELSE IF(IMENU.EQ.1)THEN
20      WRITE(6,2001)
2001    FORMAT(' Specify plane: constant I, J or K? > ',$)
        READ(5,3000,ERR=20)PLANE_IN
3000    FORMAT(A1)
        CALL UPRCASE(PLANE_IN,PLANE_IN)
        IF(PLANE_IN.NE.'I'.AND.PLANE_IN.NE.'J'.AND.PLANE_IN.NE.'K')THEN
          WRITE(6,*)'Invalid input: specify I, J or K.'
          GO TO 20
        ENDIF
        PLANE=PLANE_IN
C Revise the slice list:
        IF(PLANE.EQ.'I')NMAX=IMAX
        IF(PLANE.EQ.'J')NMAX=JMAX
        IF(PLANE.EQ.'K')NMAX=KMAX
        NSLICE_NEW=0
        DO I=1,NSLICE
          IF(ISLICE(I).LE.NMAX)THEN
            NSLICE_NEW=NSLICE_NEW+1
            ISLICE(NSLICE_NEW)=ISLICE(I)
          ENDIF
        ENDDO
        IF(NSLICE_NEW.EQ.0)THEN
          NSLICE=1
          ISLICE(1)=1
        ELSE
          NSLICE=NSLICE_NEW
        ENDIF
      ELSE IF(IMENU.EQ.2)THEN
        IF(PLANE.EQ.'I')NMAX=IMAX
        IF(PLANE.EQ.'J')NMAX=JMAX
        IF(PLANE.EQ.'K')NMAX=KMAX
        WRITE(6,*)'Maximum slice number is',NMAX
30      CALL GETPARI('Starting slice number',ISTART,0,ISTAT)
        IF(ISTAT.EQ.0)GO TO 10
        IF(ISTART.LT.1.OR.ISTART.GT.NMAX)THEN
          WRITE(6,*)'Slice number out of range.'
          GO TO 30
        ENDIF
40      CALL GETPARI('Ending slice number',IEND,0,ISTAT)
        IF(ISTAT.EQ.0)GO TO 10
        IF(IEND.LT.ISTART.OR.IEND.GT.NMAX)THEN
          WRITE(6,*)'Slice number out of range.'
          GO TO 40
        ENDIF
        NSLICE_NEW=IEND-ISTART+1
        IF(NSLICE_NEW.GT.101)THEN
          WRITE(6,*)'Too many slices: maximum is 101.'
          GO TO 30
        ENDIF
        NSLICE=NSLICE_NEW
        DO I=1,NSLICE
          ISLICE(I)=ISTART+I-1
        ENDDO
      ELSE IF(IMENU.EQ.3)THEN
        IF(PLANE.EQ.'I')NMAX=IMAX
        IF(PLANE.EQ.'J')NMAX=JMAX
        IF(PLANE.EQ.'K')NMAX=KMAX
50      WRITE(6,*)'Maximum slice number is',NMAX
        WRITE(6,5000)'Enter a list of up to',MIN(NMAX,101),
     #    ' slice numbers.'
5000    FORMAT(1X,A,I4,A)
        WRITE(6,*)'Terminate the list with a slash (/).'
        DO I=1,101
          ISLICE_IN(I)=0
        ENDDO
        READ(5,*,ERR=50)ISLICE_IN
        DO I=1,101
          IF(ISLICE_IN(I).LE.0)THEN
            NSLICE=I-1
            GO TO 90
          ELSE IF(ISLICE_IN(I).GT.NMAX)THEN
            WRITE(6,*)'Slice number',ISLICE_IN(I),' exceeds maximum.'
            GO TO 50
          ENDIF
        ENDDO
        NSLICE=101
90      IF(NSLICE.EQ.0)GO TO 10
        DO I=1,NSLICE
          ISLICE(I)=ISLICE_IN(I)
        ENDDO
      ELSE
        WRITE(6,*)'Invalid option number.'
        GO TO 16
      ENDIF
      GO TO 10

C======================================================================C
C  Determine contour levels
C======================================================================C
100   CALL CLTRANS
      WRITE(6,*)'Number of contour levels to be plotted:',NCLEV
      WRITE(6,*)
      WRITE(6,*)'Current list of contour levels (percent):'
      WRITE(6,4000)(CLEV(I),I=1,NCLEV)
4000  FORMAT(1X,10F8.3)
105   WRITE(6,*)
      WRITE(6,*)'Options:'
      WRITE(6,*)'  0   Use current contour list'
      WRITE(6,*)'  1   Specify range of contour levels'
      WRITE(6,*)'  2   Specify individual contour levels'
      WRITE(6,*)'  3   Standard 5% contour levels'
      WRITE(6,*)
106   IMENU=0
      CALL GETPARI('Option number',IMENU,1,ISTAT)
      IF(IMENU.EQ.0)THEN
        GO TO 200
      ELSE IF(IMENU.EQ.1)THEN
130     CALL GETPAR('Starting contour level (%)',CSTART,0,ISTAT)
        IF(ISTAT.EQ.0)GO TO 100
        IF(CSTART.LT.0..OR.CSTART.GT.100.)THEN
          WRITE(6,*)'Contour level out of range 0-100'
          GO TO 130
        ENDIF
140     CALL GETPAR('Ending contour level (%)',CEND,0,ISTAT)
        IF(ISTAT.EQ.0)GO TO 100
        IF(CEND.LE.CSTART.OR.CEND.GT.100.)THEN
          WRITE(6,*)'Contour level out of range.'
          GO TO 140
        ENDIF
150     CALL GETPARI('Number of equally-spaced contours (max 101)',
     #    NCLEV_IN,0,ISTAT)
        IF(ISTAT.EQ.0)GO TO 100
        IF(NCLEV_IN.LT.2.OR.NCLEV_IN.GT.101)THEN
          WRITE(6,*)'Number of contours out of range 2-101.'
          GO TO 150
        ENDIF
        NCLEV=NCLEV_IN
        CINC=(CEND-CSTART)/(NCLEV-1)
        DO I=1,NCLEV
          CLEV(I)=CSTART+(I-1)*CINC
        ENDDO
      ELSE IF(IMENU.EQ.2)THEN
160     WRITE(6,*)'Enter a list of up to 101 contour levels.'
        WRITE(6,*)'Terminate the list with a slash (/).'
        DO I=1,101
          CLEV_IN(I)=-1.
        ENDDO
        READ(5,*,ERR=160)CLEV_IN
        DO I=1,101
          IF(CLEV_IN(I).LT.0.)THEN
            NCLEV_IN=I-1
            GO TO 190
          ELSE IF(CLEV_IN(I).GT.100.)THEN
            WRITE(6,*)'Contour level exceeds 100%'
            GO TO 160
          ENDIF
        ENDDO
        NCLEV_IN=101
190     IF(NCLEV_IN.EQ.0)GO TO 100
        NCLEV=NCLEV_IN
        DO I=1,NCLEV
          CLEV(I)=CLEV_IN(I)
        ENDDO
      ELSE IF(IMENU.EQ.3)THEN
        NCLEV=21
        DO I=1,NCLEV
          CLEV(I)=(I-1)*5.
        ENDDO
      ELSE
        WRITE(6,*)'Invalid option number.'
        GO TO 106
      ENDIF
      GO TO 100
C
200   CALL PLOT2(V,IMAX,JMAX,KMAX,NCELLS,IXORG,IYORG,SPACEL,
     #  IFLUX,IDEBUG)
      RETURN
      END !PLOT1
