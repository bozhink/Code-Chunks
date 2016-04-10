      SUBROUTINE FIELD(P,E,ID,JD,NFIXED)
C======================================================================C
C
C   CALCULATES ELECTRIC FIELD E FROM POTENTIAL VALUES P IN 2D ONLY
C   NORMALIZED BETWEEN 0 & 1
C
C  Rewritten by F.W. Jones using 5-point Lagrange formulas.
C======================================================================C
      REAL P(ID,JD),E(ID,JD)
      COMMON/BLOCK1/HX,HY,HZ,WX,WY,WZ,COMFI,WYROT,WXAX,WYAX,COMFAX
      COMMON/FIELDS/EMIN,EMAX

      IF(ID.LT.5.OR.JD.LT.5)THEN
        WRITE(6,*)'Unable to calculate field;',
     #    ' slice must be at least 5 x 5.'
        RETURN
      ENDIF
      IF(NFIXED.EQ.1)FACI=24.0*HY
      IF(NFIXED.EQ.1)FACJ=24.0*HZ
      IF(NFIXED.EQ.2)FACI=24.0*HX
      IF(NFIXED.EQ.2)FACJ=24.0*HZ
      IF(NFIXED.EQ.3)FACI=24.0*HX
      IF(NFIXED.EQ.3)FACJ=24.0*HY
      EMAX=-1.E30
      EMIN=+1.E30
C
      DO 30 I=1,ID
      DO 20 J=1,JD

C Calculate EX:
      IF(I.GE.3.AND.I.LE.ID-2)THEN
        EX=2.*P(I-2,J)-16.*P(I-1,J)+16.*P(I+1,J)-2.*P(I+2,J)
      ELSE IF(I.EQ.1)THEN
        EX=-50.*P(1,J)+96.*P(2,J)-72.*P(3,J)+32.*P(4,J)-6.*P(5,J)
      ELSE IF(I.EQ.2)THEN
        EX=-6.*P(1,J)-20.*P(2,J)+36.*P(3,J)-12.*P(4,J)+2.*P(5,J)
      ELSE IF(I.EQ.ID-1)THEN
        EX=-2.*P(ID-4,J)+12.*P(ID-3,J)-36.*P(ID-2,J)
     #     +20.*P(I,J)+6.*P(ID,J)
      ELSE IF(I.EQ.ID)THEN
        EX=6.*P(ID-4,J)-32.*P(ID-3,J)+72.*P(ID-2,J)
     #     -96.*P(ID-1,J)+50.*P(ID,J)
      ENDIF
C
C Calculate EY:
      IF(J.GE.3.AND.J.LE.JD-2)THEN
        EY=2.*P(I,J-2)-16.*P(I,J-1)+16.*P(I,J+1)-2.*P(I,J+2)
      ELSE IF(J.EQ.1)THEN
        EY=-50.*P(I,1)+96.*P(I,2)-72.*P(I,3)+32.*P(I,4)-6.*P(I,5)
      ELSE IF(J.EQ.2)THEN
        EY=-6.*P(I,1)-20.*P(I,2)+36.*P(I,3)-12.*P(I,4)+2.*P(I,5)
      ELSE IF(J.EQ.JD-1)THEN
        EY=-2.*P(I,JD-4)+12.*P(I,JD-3)-36.*P(I,JD-2)
     #     +20.*P(I,J)+6.*P(I,JD)
      ELSE IF(J.EQ.JD)THEN
        EY=6.*P(I,JD-4)-32.*P(I,JD-3)+72.*P(I,JD-2)
     #     -96.*P(I,JD-1)+50.*P(I,JD)
      ENDIF

      EX=EX/FACI
      EY=EY/FACJ
      EXY=SQRT(EX**2+EY**2)
      E(I,J)=EXY
      IF(EXY .LT. EMIN) EMIN=EXY
      IF(EXY .GT. EMAX) EMAX=EXY
20    CONTINUE
30    CONTINUE

C Normalize to [0,1]
      IF(EMAX-EMIN.EQ.0.)RETURN
      DO J=1,JD
        DO I=1,ID
          E(I,J)=(E(I,J)-EMIN)/(EMAX-EMIN)
        ENDDO
      ENDDO
      RETURN
      END !FIELD
