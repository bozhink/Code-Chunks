      SUBROUTINE REDUCE(V,IJKMAX,INC,IMAX,JMAX,KMAX,
     #  I1,I2,J1,J2,K1,K2)
C======================================================================C
C                SUBROUTINE REDUCE
C======================================================================C
      COMMON/BLOCK2/TOLER,IADRESS,MULT,OFF,OFF0,IOPT,BMAX
      REAL*4 V(IJKMAX*MULT)
C
C Find which points to change to boundary points.
C (they are changed back again by subroutine EXPAND).
      IJMAX=IMAX*JMAX
      DO 30 K=K1,K2,INC
      DO 30 J=J1,J2,INC
      DO 30 I=I1,I2,INC
      MID=MULT*(I+(J-1)*IMAX+(K-1)*IJMAX)
      IF(V(MID).LT.0.0) GO TO 30
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
      IF(V(MSCAN).GE.0) GO TO 10
      CALL EXE_CUT(II,JJ,KK,PHI,RHO,LL,%VAL(IADRESS))
C CALL BND(II,JJ,KK,PHI,RHO,LL)
      IF(PHI.LT.0.0) GO TO 20
10    CONTINUE
      GO TO 30
C
C Replace V(MID) iff there is an original BND point in the
C neighbourhood; i.e. don't look at negative points that
C have been changed by a previous call to REDUCE.
C
20    V(MID)=V(MSCAN)
30    CONTINUE
      RETURN
      END !REDUCE

