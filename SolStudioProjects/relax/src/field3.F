      SUBROUTINE FIELD3(V,MULT,IMAX,JMAX,KMAX,E,ID,JD,
     &                  PLANE,LPLANE)
C======================================================================C
C
C  3D field calculation
C
C======================================================================C
      REAL V(MULT,IMAX,JMAX,KMAX)
      REAL E(ID,JD)
      CHARACTER*1 PLANE

      COMMON/BLOCK1/HX,HY,HZ,WX,WY,WZ,COMFI,WYROT,WXAX,WYAX,COMFAX
      COMMON/FIELDS/EMIN,EMAX,IEMAX,JEMAX,KEMAX

      EMAX=-1.E30
      EMIN=+1.E30

      HXX=2.*HX
      HYY=2.*HY
      HZZ=2.*HZ

      DO 30 N=1,JD
      DO 20 M=1,ID

      IF(PLANE.EQ.'K')THEN
        I=M
        J=N
        K=LPLANE
      ELSE IF(PLANE.EQ.'J')THEN
        I=M
        J=LPLANE
        K=N
      ELSE
        I=LPLANE
        J=M
        K=N
      ENDIF

      IF(I.EQ.1)THEN
        EX=(ABS(V(1,2,J,K))-ABS(V(1,1,J,K)))/HX
      ELSE IF(I.EQ.IMAX)THEN
        EX=(ABS(V(1,IMAX,J,K))-ABS(V(1,IMAX-1,J,K)))/HX
      ELSE
        EX=(ABS(V(1,I+1,J,K))-ABS(V(1,I-1,J,K)))/HXX
      ENDIF
      IF(J.EQ.1)THEN
        EY=(ABS(V(1,I,2,K))-ABS(V(1,I,1,K)))/HY
      ELSE IF(J.EQ.JMAX)THEN
        EY=(ABS(V(1,I,JMAX,K))-ABS(V(1,I,JMAX-1,K)))/HY
      ELSE
        EY=(ABS(V(1,I,J+1,K))-ABS(V(1,I,J-1,K)))/HYY
      ENDIF
      IF(K.EQ.1)THEN
        EZ=(ABS(V(1,I,J,2))-ABS(V(1,I,J,1)))/HZ
      ELSE IF(K.EQ.KMAX)THEN
        EZ=(ABS(V(1,I,J,KMAX))-ABS(V(1,I,J,KMAX-1)))/HZ
      ELSE
        EZ=(ABS(V(1,I,J,K+1))-ABS(V(1,I,J,K-1)))/HZZ
      ENDIF

      ETOT=SQRT(EX**2+EY**2+EZ**2)
C Experimental:
      IF(V(1,I,J,K).LT.0.)ETOT=0.

      E(M,N)=ETOT
      IF(ETOT.LT.EMIN)EMIN=ETOT
      IF(ETOT.GT.EMAX)THEN
        EMAX=ETOT
        IEMAX=I
        JEMAX=J
        KEMAX=K
      ENDIF

20    CONTINUE
30    CONTINUE

C Normalize to [0,1]
      IF(EMAX-EMIN.EQ.0.)RETURN
      DO N=1,JD
        DO M=1,ID
          E(M,N)=(E(M,N)-EMIN)/(EMAX-EMIN)
        ENDDO
      ENDDO
      RETURN

      END !FIELD3
