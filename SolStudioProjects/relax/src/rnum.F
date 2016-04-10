      SUBROUTINE RNUM(X,Y,SIZE,FPN,THETA,N)
C======================================================================C
C  Portable replacement for NUM_TPLT.                   FWJ 13-SEP-94
C  Plots the floating point number FPN at location (X,Y) with size
C  SIZE and angle THETA.  N is the number of decimal places.  
C  If N < 0, the decimal point is suppressed.
C  A maximum of 9 decimal places is allowed.
C======================================================================C

      CHARACTER*12 BUFFER
      CHARACTER*7 CFMT

      BUFFER=' '
      CFMT='(F12.1)'

      NDEC=MAX(N,0)
      NDEC=MIN(NDEC,9)
      WRITE(CFMT,900)NDEC
  900 FORMAT('(F12.',I1,')')

      WRITE(BUFFER,CFMT,IOSTAT=IERR)FPN

      I2=LENSIG(BUFFER)
      IF(I2.LE.0)RETURN
      DO WHILE(BUFFER(1:1).EQ.' ')
        BUFFER=BUFFER(2:)
        I2=I2-1
      ENDDO
      IF(N.LT.0)I2=I2-1
      CALL PSYM(X,Y,SIZE,%REF(BUFFER),THETA,I2)

      RETURN

      END
