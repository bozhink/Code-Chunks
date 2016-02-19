      SUBROUTINE RNUMR(X,Y,SIZE,FPN,THETA,N)
C======================================================================C
C  RELAX3D modified version of NUMR_TPLT by C.J. Kost.
C======================================================================C
      COMMON/RNCAXIS/NCBT,NDEC,NDIG

      BYTE CH(20)

      NN=N
C     IF(N.EQ.0) NN=-1  ! NO LONGER SUPPRESS "." (MUST SET N=-1 TO DO)
      DO 10 I=1,NDIG
      CH(I)=ICHAR('0')
  10  CONTINUE
      CALL REALCH(FPN,1,0,NDIG,NN,CH)
      CALL PSYM(X,Y,SIZE,CH,THETA,NDIG)
      RETURN
      END
