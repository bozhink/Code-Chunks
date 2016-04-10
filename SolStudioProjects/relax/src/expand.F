      SUBROUTINE EXPAND(V,IJKMAX,IMAX,JMAX,KMAX,INC,
     #  I1,I2,J1,J2,K1,K2)
C======================================================================C
C                       SUBROUTINE EXPAND
C======================================================================C
      COMMON/BLOCK2/TOLER,IADRESS,MULT,OFF,OFF0,IOPT,BMAX
      REAL*4 V(IJKMAX*MULT)

      INCOLD=INC
      INC=INC/2
      IJMINC=IMAX*JMAX*INC
      IMINC=IMAX*INC
      IF(INCOLD.EQ.1) STOP 'STOP 600'
      IJMAX=IMAX*JMAX
      JMAXP1=JMAX+1
C
C Check first that negative points are 'real' boundary points.
C
      DO 30 K=K1,K2,INCOLD
      DO 30 J=J1,J2,INCOLD
      DO 30 I=I1,I2,INCOLD
      MID=MULT*(I+(J-1)*IMAX+(K-1)*IJMAX)
      IF(V(MID).GE.0.0) GO TO 30
      CALL EXE_CUT(I,J,K,PHI,RHO,LL,%VAL(IADRESS))
C     CALL BND(I,J,K,PHI,RHO,LL)
      IF(PHI.LT.0.0) GO TO 30
      IF(INC.EQ.1) GO TO 20
      II1=I-INC/2
      II2=I+INC/2
      JJ1=J-INC/2
      JJ2=J+INC/2
      KK1=K-INC/2
      KK2=K+INC/2
      IF(II1.LT.I1)II1=I
      IF(II2.GT.I2)II2=I
      IF(JJ1.LT.J1)JJ1=J
      IF(JJ2.GT.J2)JJ2=J
      IF(KK1.LT.K1)KK1=K
      IF(KK2.GT.K2)KK2=K
      DO 10 KK=KK1,KK2
      DO 10 JJ=JJ1,JJ2
      DO 10 II=II1,II2
      MSCAN=MULT*(II+(JJ-1)*IMAX+(KK-1)*IJMAX)
      IF(V(MSCAN).GE.0.0) GO TO 10
C CALL BND(II,JJ,KK,PHI,RHO,LL):
      CALL EXE_CUT(II,JJ,KK,PHI,RHO,LL,%VAL(IADRESS))
      IF(PHI.LT.0.0) GO TO 30
10    CONTINUE
20    VVV=V(MID)
      V(MID)=ABS(VVV)
30    CONTINUE
C
C  All negative points are now valid boundary points.
C
      IX1=I1+INC
      IX2=I2-INC
      JX1=J1+INC
      JX2=J2-INC
C 2d case:
      IF(KMAX.EQ.1)GO TO 45
      KX1=K1+INC
      KX2=K2-INC
C
C  Interpolate in z
C
      DO 40 K=KX1,KX2,INCOLD
      DO 40 J=J1,J2,INCOLD
      DO 40 I=I1,I2,INCOLD
      MID=MULT*(I+(J-1)*IMAX+(K-1)*IJMAX)
      IF(V(MID).LT.0.0) GO TO 40
      V1=V(MID-MULT*IJMINC)
      V2=V(MID+MULT*IJMINC)
      V(MID)=(ABS(V1)+ABS(V2))/2.
40    CONTINUE
C
C  Interpolate in y
C
45    DO 50 K=K1,K2,INC
      DO 50 J=JX1,JX2,INCOLD
      DO 50 I=I1,I2,INCOLD
      MID=MULT*(I+(J-1)*IMAX+(K-1)*IJMAX)
      IF(V(MID).LT.0.0) GO TO 50
      V1=V(MID-MULT*IMINC)
      V2=V(MID+MULT*IMINC)
      V(MID)=(ABS(V1)+ABS(V2))/2.
50    CONTINUE
C
C  Interpolate in x
C
      DO 60 K=K1,K2,INC
      DO 60 J=J1,J2,INC
      DO 60 I=IX1,IX2,INCOLD
      MID=MULT*(I+(J-1)*IMAX+(K-1)*IJMAX)
      IF(V(MID).LT.0.0) GO TO 60
      V1=V(MID-MULT*INC)
      V2=V(MID+MULT*INC)
      V(MID)=(ABS(V1)+ABS(V2))/2.
60    CONTINUE
      RETURN
      END !EXPAND

