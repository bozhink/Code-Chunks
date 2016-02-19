      SUBROUTINE ITERAT(V,NITER,IMAX,JMAX,KMAX,IJMAX,I1,I2,J1,J2,
     #  K1,K2,INC,RELFAC,IMAXP1,JMAXP1,KMAXP1,IJKMAX,QUIT)
C======================================================================C
C
C  Performs a number of relaxation iterations on the main array.
C
C  The loop for one iteration is essentially as follows:
C      DO 100 K=1,KMAX
C        DO 100 J=1,JMAX
C          DO 100 I=1,IMAX
C            CENT=V(I,J,K)
C            IF(CENT.LT.0.)GO TO 100
C            CENT2=WX*(V(I-1,J,K)+V(I+1,J,K))
C                 +WY*(V(I,J-1,K)+V(I,J+1,K))
C                 +WZ*(V(I,J,K-1)+V(I,J,K+1))
C            V(I,J,K)=CENT+RELFAC*(CENT2-CENT)
C 100  CONTINUE
C
C  When the point I,J,K is on an edge, say the I=IMAX edge,
C  V(I-1,J,K)+V(I-1,J,K) is used instead of V(I-1,J,K)+V(I+1,J,K).
C
C  If RELFAC < 0 the relaxation factor is swept from |RELFAC| to 1.0
C  in steps of -0.1.
C
C======================================================================C
      COMMON/BLOCK1/HX,HY,HZ,WX,WY,WZ,COMFI,WYROT,WXAX,WYAX,COMFAX
      COMMON/BLOCK2/TOLER,IADRESS,MULT,OFF,OFF0,IOPT,BMAX
      COMMON/RELAX3D_TIME/TSTART,TMAX
      COMMON/RELAX3D_SWEEP/ALTERNATE,ITCOUNT
      LOGICAL ALTERNATE
      COMMON/RELAX3D_POLAR/NSYMM,IJ0,IJ90,IJ180,IJ270
      COMMON/RELAX3D_ALPHA/ALPHA

      COMMON/CTRLC/CTRLC_FLAG
      LOGICAL CTRLC_FLAG

C g77 has intrinsic by this name
#ifdef g77
      EXTERNAL CPU_TIME
#endif

      REAL*4 V(IJKMAX*MULT)
      LOGICAL QUIT

      LOGICAL CUBES
      DATA IDIR/-1/,JDIR/-1/,KDIR/-1/

      PARAMETER(R6=1./6.)

C Enable CTRL-C interrupts
      CALL CTRLC_TRAP(IDUM)

      QUIT=.FALSE.
      CUBES=(WX.EQ.WY.AND.WY.EQ.WZ)
      IMINC=IMAX*INC
      IJINC=IJMAX*INC
      IJMPIM=IJMAX+IMAX
C Define increments
      INCI=INC
      INCJ=INC*IMAX
      INCK=INC*IJMAX
C Define limits of iteration
      IA=I1
      IB=I2
      JA=IMAX*J1
      JB=IMAX*J2
      KA=IJMAX*K1
      KB=IJMAX*K2
      IAIB=IA+IB
      JAJB=JA+JB
      KAKB=KA+KB
C Define edges
      IE1=1
      IE2=IMAX
      JE1=IMAX
      JE2=IJMAX
      KE1=IJMAX
      KE2=IJKMAX

      NPT=(I2-I1+1)*(J2-J1+1)*(K2-K1+1)

      NSWEEP=1
      IF(RELFAC.LT.0.)NSWEEP=NITER

      DO 9000 NSW=1,NSWEEP
      IF(RELFAC.LT.0.)NITER=(-RELFAC-1.)*10.01+1
      IF(RELFAC.LT.0.)THEN
        WRITE(6,*)
        WRITE(6,*)'RFAC  TIME |Rmax         I   J   K    V      |',
     #    '(R/V)max     I   J   K    V'
      ENDIF

      DO 8000 NNN=1,NITER

      IF(CTRLC_FLAG)RETURN

      ITCOUNT=ITCOUNT+1      !update iteration counter

      IF(RELFAC.GT.0..AND.MOD(NNN-1,10).EQ.0)THEN
        WRITE(6,*)
        WRITE(6,*)'RFAC  TIME |Rmax         I   J   K    V      |',
     #    '(R/V)max     I   J   K    V'
      ENDIF

      RELF=ABS(RELFAC)-(NNN-1)*0.1
      IF(RELFAC.GT.0.)RELF=RELFAC
      IF(RELF.GT.1.99)RELF=1.99
      RESMAX=0.
      RESMAXN=0.
CC      MIDRMAX=MULT
CC      MIDRMAXN=MULT
      TT1=CPU_TIME(0.)
      KDIR=-KDIR      !always switch sweeping direction

C Execute relevant iteration loop:

      GO TO(100,200,300,400,500,600,700,800)IOPT

C======================================================================C
C  IOPT=1      Laplace
C======================================================================C
100   DO 190 KK=KA,KB,INCK
      K=KK
      IF(ALTERNATE.AND.KDIR.EQ.-1)K=KAKB-KK
      KMID=K-IJMPIM
      INC5=-INCK
      INC6= INCK
      IF(KMAX.EQ.1)THEN
        INC5=0
        INC6=0
      ENDIF
      IF(K.EQ.KE1)INC5=INC6      !check for K edge
      IF(K.EQ.KE2)INC6=INC5
      JDIR=-JDIR

      DO 190 JJ=JA,JB,INCJ
      J=JJ
      IF(ALTERNATE.AND.JDIR.EQ.-1)J=JAJB-JJ
      JMID=J+KMID
      INC3=-INCJ
      INC4= INCJ
      IF(J.EQ.JE1)INC3=INC4      !check for J edge
      IF(J.EQ.JE2)INC4=INC3
      IDIR=-IDIR

      DO 190 II=IA,IB,INCI
      I=II
      IF(ALTERNATE.AND.IDIR.EQ.-1)I=IAIB-II
      MID=I+JMID
      CENT=V(MID)
      IF(CENT.LT.0.) GO TO 190
      INC1=-INCI
      INC2= INCI
      IF(I.EQ.IE1)INC1=INC2      !check for I edge
      IF(I.EQ.IE2)INC2=INC1
C
      P1=V(MID+INC1)
      P2=V(MID+INC2)
      P3=V(MID+INC3)
      P4=V(MID+INC4)
      P5=V(MID+INC5)
      P6=V(MID+INC6)
C
C Cubic grid formula applied (DX=DY=DZ)
      IF(CUBES)THEN
        CENT2=WX*(ABS(P1)+ABS(P2)+ABS(P3)+ABS(P4)+ABS(P5)+ABS(P6))
C Non-cubic formula applied
      ELSE
        CENT2=WX*(ABS(P1)+ABS(P2))+WY*(ABS(P3)+ABS(P4))
     #       +WZ*(ABS(P5)+ABS(P6))
      ENDIF

      CC=CENT2-CENT
      CENTP=CENT+CC*RELF
C Clamp to 0 if we went negative due to overrelaxation:
      IF(CENTP.LT.0.)CENTP=0.
      V(MID)=CENTP
C Update residuals R and R/V
      IF(ABS(CC).GE.ABS(RESMAX))THEN
        RESMAX=CC
        MIDRMAX=MID
      ENDIF
      IF(CENT2.GT.0.)CC=CC/CENT2
      IF(ABS(CC).GE.ABS(RESMAXN))THEN
        RESMAXN=CC
        MIDRMAXN=MID
      ENDIF

190   CONTINUE
      GO TO 5000

C======================================================================C
C  IOPT=2      Laplace - cylindrical
C======================================================================C
200   JDIR=-JDIR
      DO 290 JJ=JA,JB,INCJ
      J=JJ
      IF(ALTERNATE.AND.JDIR.EQ.-1)J=JAJB-JJ
      JMID=J-IMAX
      JOFF=JMID/IMAX      !This is the real J-1
      JOFF=JOFF/INC       !Fix for reduced cases (rescale)
      INC3=-INCJ
      INC4= INCJ
      IF(J.EQ.JE1)INC3=INC4      !check for J edge
      IF(J.EQ.JE2)INC4=INC3
      IDIR=-IDIR
C
      DO 290 II=IA,IB,INCI
      I=II
      IF(ALTERNATE.AND.IDIR.EQ.-1)I=IAIB-II
      MID=I+JMID
      CENT=V(MID)
      IF(CENT.LT.0.) GO TO 290
      INC1=-INCI
      INC2= INCI
      IF(I.EQ.IE1)INC1=INC2      !check for I edge
      IF(I.EQ.IE2)INC2=INC1
C
      P1=ABS(V(MID+INC1))
      P2=ABS(V(MID+INC2))
      P3=ABS(V(MID+INC3))
      P4=ABS(V(MID+INC4))
C On-axis case:
      IF(JOFF.EQ.0)CENT2=WXAX*(P1+P2)+WYAX*P3
C Off-axis case:
      IF(JOFF.NE.0)
     #  CENT2=WX*(P1+P2) + WY*(P3+P4) + WYROT*(P4-P3)/JOFF
      CC=CENT2-CENT
      CENTP=CENT+CC*RELF
C Clamp to 0 if we went negative due to overrelaxation:
      IF(CENTP.LT.0.)CENTP=0.
      V(MID)=CENTP
      IF(ABS(CC).GE.ABS(RESMAX))THEN
        RESMAX=CC
        MIDRMAX=MID
      ENDIF
      IF(CENT2.GT.0.)CC=CC/CENT2
      IF(ABS(CC).GE.ABS(RESMAXN))THEN
        RESMAXN=CC
        MIDRMAXN=MID
      ENDIF
290   CONTINUE
      GO TO 5000

C======================================================================C
C  IOPT=3      Poisson
C======================================================================C
300   DO 390 KK=KA,KB,INCK
      K=KK
      IF(ALTERNATE.AND.KDIR.EQ.-1)K=KAKB-KK
      KMID=K-IJMPIM
      INC5=-INCK
      INC6= INCK
C 2d case:
      IF(KMAX.EQ.1)THEN
        INC5=0
        INC6=0
      ENDIF
      IF(K.EQ.KE1)INC5=INC6      !check for K edge
      IF(K.EQ.KE2)INC6=INC5
      JDIR=-JDIR
C
      DO 390 JJ=JA,JB,INCJ
      J=JJ
      IF(ALTERNATE.AND.JDIR.EQ.-1)J=JAJB-JJ
      JMID=J+KMID
      INC3=-INCJ
      INC4= INCJ
      IF(J.EQ.JE1)INC3=INC4      !check for J edge
      IF(J.EQ.JE2)INC4=INC3
      IDIR=-IDIR
C
      DO 390 II=IA,IB,INCI
      I=II
      IF(ALTERNATE.AND.IDIR.EQ.-1)I=IAIB-II
      MID=I+JMID
      MID=MID+MID      !correct for interleaved array
      CENT=V(MID)
      IF(CENT.LT.0.) GO TO 390
      RHO=V(MID-1)
      IF(ALPHA.NE.0.)RHO=RHO/(1.+ALPHA*CENT)
      INC1=-INCI
      INC2= INCI
      IF(I.EQ.IE1)INC1=INC2      !check for I edge
      IF(I.EQ.IE2)INC2=INC1
C
      P1=V(MID+INC1+INC1)
      P2=V(MID+INC2+INC2)
      P3=V(MID+INC3+INC3)
      P4=V(MID+INC4+INC4)
      P5=V(MID+INC5+INC5)
      P6=V(MID+INC6+INC6)
C
C Cubic grid formula applied (DX=DY=DZ)
      IF(CUBES)CENT2=
     #  WX*(ABS(P1)+ABS(P2)+ABS(P3)+ABS(P4)+ABS(P5)+ABS(P6))
     #  -RHO*COMFI
C
C Non-cubic formula applied
      IF(.NOT.CUBES)CENT2=
     #  WX*(ABS(P1)+ABS(P2))+WY*(ABS(P3)+ABS(P4))+WZ*(ABS(P5)+ABS(P6))
     #  -RHO*COMFI

      CC=CENT2-CENT
      CENTP=CENT+CC*RELF
      V(MID)=CENTP
      IF(ABS(CC).GE.ABS(RESMAX))THEN
        RESMAX=CC
        MIDRMAX=MID
      ENDIF
      VTRUE=ABS(CENT2-OFF)
      IF(VTRUE.GT.0.)CC=CC/VTRUE
      IF(ABS(CC).GE.ABS(RESMAXN))THEN
        RESMAXN=CC
        MIDRMAXN=MID
      ENDIF
C Add more offset if needed
      IF(CENTP.LT.0.)THEN
        V(MID)=0.
        IF(OFF0.EQ.0.)GO TO 390
        OFF=OFF+OFF0
        WRITE(6,*)'Array offset increased to ',OFF
        DO N=2,2*IJKMAX,2
          PHI=V(N)
          IF(PHI.GE.0.)PHI=PHI+OFF0
          IF(PHI.LT.0.)PHI=PHI-OFF0
          V(N)=PHI
        ENDDO
        OFF0=2.*OFF0
      ENDIF        
390   CONTINUE
      GO TO 5000

C======================================================================C
C  IOPT=4      Laplace - dielectric
C======================================================================C
 400  DO 490 KK=KA,KB,INCK
      K=KK
      IF(ALTERNATE.AND.KDIR.EQ.-1)K=KAKB-KK
      KMID=K-IJMPIM
      INC5=-INCK
      INC6= INCK
      IF(KMAX.EQ.1)THEN
        INC5=0
        INC6=0
      ENDIF
      IF(K.EQ.KE1)INC5=INC6      !check for K edge
      IF(K.EQ.KE2)INC6=INC5

      JDIR=-JDIR
      DO 490 JJ=JA,JB,INCJ
      J=JJ
      IF(ALTERNATE.AND.JDIR.EQ.-1)J=JAJB-JJ
      JMID=J+KMID
      INC3=-INCJ
      INC4= INCJ
      IF(J.EQ.JE1)INC3=INC4      !check for J edge
      IF(J.EQ.JE2)INC4=INC3
      IDIR=-IDIR
C
      DO 490 II=IA,IB,INCI
      I=II
      IF(ALTERNATE.AND.IDIR.EQ.-1)I=IAIB-II
      MID=I+JMID
      MID=MID+MID      !correct for interleaved array
      CENT=V(MID)
      IF(CENT.LT.0.) GO TO 490
      RHO=V(MID-1)
      INC1=-INCI
      INC2= INCI
      IF(I.EQ.IE1)INC1=INC2      !check for I edge
      IF(I.EQ.IE2)INC2=INC1
C
      P1=ABS(V(MID+INC1+INC1))
      P2=ABS(V(MID+INC2+INC2))
      P3=ABS(V(MID+INC3+INC3))
      P4=ABS(V(MID+INC4+INC4))

      IF(KMAX.GT.1)GO TO 450

C 2D TREATMENT FOLLOWS

C Dielectric boundary - non-corner point
      IF(RHO.GT.0.)THEN
        E1=V(MID+INC1+INC1-1)
        E3=V(MID+INC3+INC3-1)
C Vertical boundary:
        IF(J.EQ.1.OR.J.EQ.JMAX.OR.E1.EQ.0)THEN
          W2=2.0/(1.0+RHO)
          W1=(2.0*RHO)/(1.0+RHO)
          CENT2=(P2*W2+P4+P1*W1+P3)/4.0
C Horizontal boundary:
        ELSE IF(I.EQ.1.OR.I.EQ.IMAX.OR.E3.EQ.0)THEN
          W4=2.0/(1.0+RHO)
          W3=(2.0*RHO)/(1.0+RHO)
          CENT2=(P4*W4+P2+P3*W3+P1)/4.0
C Something wrong:
        ELSE
          WRITE(6,*)'Illegal dielectric boundary configuration'
          WRITE(6,*)'  at location I,J',I,J
        ENDIF
C Dielectric boundary - corner point:
      ELSE IF(RHO.LT.0.)THEN
        E1=V(MID+INC1+INC1-1)
        E2=V(MID+INC2+INC2-1)
        E3=V(MID+INC3+INC3-1)
        E4=V(MID+INC4+INC4-1)
        RHO=ABS(RHO)
        WA=(1.0+RHO)/2.0
        WB=3.0+RHO
C LL corner:
        IF(E1.EQ.0..AND.E3.EQ.0.)THEN
          CENT2=(P1+P3+WA*(P2+P4))/WB
C LR corner:
        ELSE IF(E2.EQ.0..AND.E3.EQ.0.)THEN
          CENT2=(P2+P3+WA*(P1+P4))/WB
C UR corner:
        ELSE IF(E2.EQ.0..AND.E4.EQ.0.)THEN
          CENT2=(P2+P4+WA*(P1+P3))/WB
C UL corner:
        ELSE IF(E1.EQ.0..AND.E4.EQ.0.)THEN
          CENT2=(P1+P4+WA*(P2+P3))/WB
C Bad config.
        ELSE
          WRITE(6,*)'Illegal dielectric boundary configuration'
          WRITE(6,*)'  at location I,J',I,J
        ENDIF
C Non-boundary point:
      ELSE
        CENT2=(P1+P2+P3+P4)/4.0
      ENDIF

      GO TO 480

C 3D TREATMENT FOLLOWS
C FOR NOW, NO PREPROCESSING!!!

 450  P5=ABS(V(MID+INC5+INC5))
      P6=ABS(V(MID+INC6+INC6))

      E1=V(MID+INC1+INC1-1)
      E2=V(MID+INC2+INC2-1)
      E3=V(MID+INC3+INC3-1)
      E4=V(MID+INC4+INC4-1)
      E5=V(MID+INC5+INC5-1)
      E6=V(MID+INC6+INC6-1)
      IF(E1.EQ.E2.AND.E3.EQ.E4.AND.E5.EQ.E6)THEN
        CENT2=R6*(P1+P2+P3+P4+P5+P6)
      ELSE
        W1=1.
        W2=1.
        W3=1.
        W4=1.
        W5=1.
        W6=1.
        IF(RHO.GT.MIN(E1,E2))THEN
          R=E1/E2
          W2=2./(R+1.)
          W1=R*W2
C          CENT2=R6*(W1*P1+W2*P2+P3+P4+P5+P6)
        ENDIF
C        ELSE IF(RHO.GT.MIN(E3,E4))THEN
        IF(RHO.GT.MIN(E3,E4))THEN
          R=E3/E4
          W4=2./(R+1.)
          W3=R*W4
C          CENT2=R6*(P1+P2+W3*P3+W4*P4+P5+P6)
        ENDIF
C        ELSE IF(RHO.GT.MIN(E5,E6))THEN
        IF(RHO.GT.MIN(E5,E6))THEN
          R=E5/E6
          W6=2./(R+1.)
          W5=R*W6
C          CENT2=R6*(P1+P2+P3+P4+W5*P5+W6*P6)
        ENDIF
C        ELSE
C          CENT2=R6*(P1+P2+P3+P4+P5+P6)
C        ENDIF
        CENT2=W1*P1+W2*P2+W3*P3+W4*P4+W5*P5+W6*P6
        CENT2=R6*CENT2
      ENDIF

 480  CC=CENT2-CENT
      CENTP=CENT+CC*RELF
C Clamp to 0 if we went negative due to overrelaxation:
      IF(CENTP.LT.0.)CENTP=0.
      V(MID)=CENTP
      IF(ABS(CC).GE.ABS(RESMAX))THEN
        RESMAX=CC
        MIDRMAX=MID
      ENDIF
      IF(CENT2.GT.0.)CC=CC/CENT2
      IF(ABS(CC).GE.ABS(RESMAXN))THEN
        RESMAXN=CC
        MIDRMAXN=MID
      ENDIF
490   CONTINUE
      GO TO 5000

C======================================================================C
C  IOPT=5      Poisson - cylindrical
C======================================================================C
500   JDIR=-JDIR
      DO 590 JJ=JA,JB,INCJ
      J=JJ
      IF(ALTERNATE.AND.JDIR.EQ.-1)J=JAJB-JJ
      JMID=J-IMAX
      JOFF=JMID/IMAX      !This is the real J-1
      JOFF=JOFF/INC       !Fix for reduced case (rescale)
      INC3=-INCJ
      INC4= INCJ
      IF(J.EQ.JE1)INC3=INC4      !check for J edge
      IF(J.EQ.JE2)INC4=INC3
      IDIR=-IDIR
C
      DO 590 II=IA,IB,INCI
      I=II
      IF(ALTERNATE.AND.IDIR.EQ.-1)I=IAIB-II
      MID=I+JMID
      MID=MID+MID      !correct for interleaved array
      CENT=V(MID)
      IF(CENT.LT.0.) GO TO 590
      RHO=V(MID-1)
      INC1=-INCI
      INC2= INCI
      IF(I.EQ.IE1)INC1=INC2      !check for I edge
      IF(I.EQ.IE2)INC2=INC1
C
      P1=ABS(V(MID+INC1+INC1))
      P2=ABS(V(MID+INC2+INC2))
      P3=ABS(V(MID+INC3+INC3))
      P4=ABS(V(MID+INC4+INC4))
C On-axis case:
      IF(JOFF.EQ.0)CENT2=WXAX*(P1+P2)+WYAX*P3 - RHO/COMFAX
C Off-axis case:
      IF(JOFF.NE.0)
     # CENT2=WX*(P1+P2) + WY*(P3+P4) + WYROT*(P4-P3)/JOFF
     #       -RHO*COMFI
      CC=CENT2-CENT
      CENTP=CENT+CC*RELF
      V(MID)=CENTP
      IF(ABS(CC).GE.ABS(RESMAX))THEN
        RESMAX=CC
        MIDRMAX=MID
      ENDIF
      VTRUE=ABS(CENT2-OFF)
      IF(VTRUE.GT.0.)CC=CC/VTRUE
      IF(ABS(CC).GE.ABS(RESMAXN))THEN
        RESMAXN=CC
        MIDRMAXN=MID
      ENDIF
C Add more offset if needed
      IF(CENTP.LT.0.)THEN
        V(MID)=0.
        IF(OFF0.EQ.0.)GO TO 590
        OFF=OFF+OFF0
        WRITE(6,*)'Array offset increased to ',OFF
        DO N=2,2*IJKMAX,2
          PHI=V(N)
          IF(PHI.GE.0.)PHI=PHI+OFF0
          IF(PHI.LT.0.)PHI=PHI-OFF0
          V(N)=PHI
        ENDDO
        OFF0=2.*OFF0
      ENDIF
590   CONTINUE
      GO TO 5000

C======================================================================C
C  IOPT=6      Laplace - cylindrical - dielectric
C======================================================================C
600   JDIR=-JDIR
      DO 690 JJ=JA,JB,INCJ
      J=JJ
      IF(ALTERNATE.AND.JDIR.EQ.-1)J=JAJB-JJ
      JMID=J-IMAX
      JOFF=JMID/IMAX      !this is the real J-1 (radius in grid units)
      INC3=-INCJ
      INC4= INCJ
      IF(J.EQ.JE1)INC3=INC4      !check for J edge
      IF(J.EQ.JE2)INC4=INC3
      IDIR=-IDIR
C
      DO 690 II=IA,IB,INCI
      I=II
      IF(ALTERNATE.AND.IDIR.EQ.-1)I=IAIB-II
      MID=I+JMID
      MID=MID+MID      !correct for interleaved array
      CENT=V(MID)
      IF(CENT.LT.0.)GO TO 690
      RHO=V(MID-1)
      INC1=-INCI
      INC2= INCI
      IF(I.EQ.IE1)INC1=INC2      !check for I edge
      IF(I.EQ.IE2)INC2=INC1
C
      P1=ABS(V(MID+INC1+INC1))
      P2=ABS(V(MID+INC2+INC2))
      P3=ABS(V(MID+INC3+INC3))
      P4=ABS(V(MID+INC4+INC4))
C
C============================================================C
C Dielectric boundaries: see John A. Seeger, Proc. IEEE,
C   August 1968, 1393-1394.
C Only horizontal and vertical boundaries are handled;
C   corner points are treated as interior points.
C============================================================C
C Non-boundary points:
      IF(RHO.LE.0.)THEN
        IF(JOFF.EQ.0)THEN      !at axis of symmetry
          CENT2=(P1+P2+4.*P4)/6.
        ELSE
          CENT2=(P1+P2+P3+P4 + (P4-P3)/(2.*JOFF))/4.
        ENDIF
        GO TO 680
      ENDIF
C
C Look at two neighbouring RHO values to get orientation of boundary
      E1=V(MID+INC1+INC1-1)
      E3=V(MID+INC3+INC3-1)
      RADP=JOFF+0.5      !Radius + 0.5
      RADM=JOFF-0.5      !Radius - 0.5
C Horizontal boundary:
      IF(I.EQ.1.OR.I.EQ.IMAX.OR.E3.EQ.0)THEN
         W12=RADM + RHO*RADP
         W3=2.*RADM
         W4=2.*RHO*RADP
         W0=4.*(RADM + RHO*RADP)      !Seeger's formula in error here
         CENT2=(W12*(P1+P2)+W3*P3+W4*P4)/W0
C Vertical boundary:
      ELSE IF(J.EQ.1.OR.J.EQ.JMAX.OR.E1.EQ.0)THEN
         IF(JOFF.EQ.0)THEN      !at axis of symmetry
            W1=2.
            W2=2.*RHO
            W4=4.*(1.-RHO)
            W0=6.*(1.-RHO)
            CENT2=(W1*P1+W2*P2+W4*P4)/W0
         ELSE
            W1=2.*RHO*JOFF
            W2=2.*JOFF
            W3=RADM+RHO*RADM
            W4=RADP+RHO*RADP
            W0=4.*JOFF*(RHO+1.)
            CENT2=(W1*P1+W2*P2+W3*P3+W4*P4)/W0
         ENDIF
C Something wrong:
      ELSE
         WRITE(6,*)'Illegal dielectric boundary configuration'
         WRITE(6,*)' at location I,J',I,J
         GO TO 690
      ENDIF
C
680   CC=CENT2-CENT
      CENTP=CENT+CC*RELF
C Don't let potentials go negative due to overrelaxation:
      IF(CENTP.LT.0.)CENTP=0.
      V(MID)=CENTP
      IF(ABS(CC).GE.ABS(RESMAX))THEN
        RESMAX=CC
        MIDRMAX=MID
      ENDIF
      IF(CENT2.GT.0.)CC=CC/CENT2
      IF(ABS(CC).GE.ABS(RESMAXN))THEN
        RESMAXN=CC
        MIDRMAXN=MID
      ENDIF
690   CONTINUE
      GO TO 5000

C======================================================================C
C  IOPT=7      Laplace POLAR
C    Grid reduction not allowed for the present
C======================================================================C
C Compute constants
700   CX=1./HX
      CY=1./HY
      IF(KMAX.EQ.1)THEN
        CZ=0.
      ELSE
        CZ=1./HZ
      ENDIF
C Weights used at origin point (I=1)
      C00=2.*(2.*CX**2+CZ**2)
      WX0=CX**2/C00
      WZ0=CZ**2/C00

      DO 790 K=K1,K2

      KADDR=(K-1)*IJMAX
      INC5=-IJMAX
      INC6= IJMAX
      IF(KMAX.EQ.1)THEN
        INC5=0
        INC6=0
      ENDIF
C Symmetry at edges:
      IF(K.EQ.1)INC5=INC6
      IF(K.EQ.KMAX)INC6=INC5

C Find new potential value at polar origin
      P1=ABS(V(IJ180+KADDR))      ! V(2,180deg,K)
      P2=ABS(V(IJ0+KADDR))        ! V(2,  0deg,K)
      P3=ABS(V(IJ270+KADDR))      ! V(2,270deg,K)
      P4=ABS(V(IJ90+KADDR))       ! V(2, 90deg,K)
      P5=ABS(V(1+KADDR+INC5))     ! V(1,1,K-1)
      P6=ABS(V(1+KADDR+INC6))     ! V(1,1,K+1)
      CENT0=WX0*(P1+P2+P3+P4)+WZ0*(P5+P6)

      JLIM=JMAX
      IF(NSYMM.GT.0)JLIM=JMAX-1      !wrap-around

      DO 790 J=1,JLIM

      JKADDR=(J-1)*IMAX+KADDR
      INC3=-IMAX
      INC4= IMAX
C Apply Neumann if no rotational symmetry:
      IF(NSYMM.EQ.0)THEN
        IF(J.EQ.1)INC3=INC4
        IF(J.EQ.JMAX)INC4=INC3
      ENDIF

      DO 790 I=I1,I2

      MID=I+JKADDR
      CENT=V(MID)
      IF(CENT.LT.0.) GO TO 790

      IF(I.EQ.1)THEN
        CENT2=CENT0
        GO TO 780
      ENDIF

      INC1=-1
      INC2= 1
      IF(I.EQ.IMAX)INC2=INC1

      R=(I-1)*HX      !radius
      CR=1./R
      C0=2.*(CX**2+CR**2*CY**2+CZ**2)
      W1R=(CX**2-CR*CX/2.)/C0
      W2R=(CX**2+CR*CX/2.)/C0
      WYR=CR**2*CY**2/C0
      WZR=CZ**2/C0

      IF(NSYMM.GT.0.AND.J.EQ.1)THEN      ! wrap-around
        P1=ABS(V(MID+INC1))
        P2=ABS(V(MID+INC2))
        P3=ABS(V(I+(JMAX-2)*IMAX+(K-1)*IJMAX))
        P4=ABS(V(MID+INC4))
        P5=ABS(V(MID+INC5))
        P6=ABS(V(MID+INC6))
        CENT2=W1R*P1+W2R*P2+WYR*(P3+P4)+WZR*(P5+P6)
      ELSE
        P1=ABS(V(MID+INC1))
        P2=ABS(V(MID+INC2))
        P3=ABS(V(MID+INC3))
        P4=ABS(V(MID+INC4))
        P5=ABS(V(MID+INC5))
        P6=ABS(V(MID+INC6))
        CENT2=W1R*P1+W2R*P2+WYR*(P3+P4)+WZR*(P5+P6)
      ENDIF

780   CC=CENT2-CENT
      CENTP=CENT+CC*RELF
C Clamp to 0 if we went negative due to overrelaxation:
      IF(CENTP.LT.0.)CENTP=0.
      V(MID)=CENTP
C Wrap-around: if J=1 put same value at JMAX
      IF(NSYMM.GT.0.AND.J.EQ.1)V(I+(JMAX-1)*IMAX+KADDR)=CENTP
C Update residuals R and R/V
      IF(ABS(CC).GE.ABS(RESMAX))THEN
        RESMAX=CC
        MIDRMAX=MID
      ENDIF
      IF(CENT2.GT.0.)CC=CC/CENT2
      IF(ABS(CC).GE.ABS(RESMAXN))THEN
        RESMAXN=CC
        MIDRMAXN=MID
      ENDIF

790   CONTINUE
      GO TO 5000

C======================================================================C
C  IOPT=8      Poisson POLAR
C    Grid reduction not allowed for the present
C======================================================================C
C Compute constants
800   CX=1./HX
      CY=1./HY
      IF(KMAX.EQ.1)THEN
        CZ=0.
      ELSE
        CZ=1./HZ
      ENDIF
C Weights used at origin point (I=1)
      C00=2.*(2.*CX**2+CZ**2)
      WX0=CX**2/C00
      WZ0=CZ**2/C00

      DO 890 K=K1,K2

      KADDR=(K-1)*IJMAX
      INC5=-IJMAX
      INC6= IJMAX
      IF(KMAX.EQ.1)THEN
        INC5=0
        INC6=0
      ENDIF
C Symmetry at edges:
      IF(K.EQ.1)INC5=INC6
      IF(K.EQ.KMAX)INC6=INC5

C Find new potential value at polar origin
      P1=ABS(V(2*(IJ180+KADDR)))      ! V(2,180deg,K)
      P2=ABS(V(2*(IJ0+KADDR)))        ! V(2,  0deg,K)
      P3=ABS(V(2*(IJ270+KADDR)))      ! V(2,270deg,K)
      P4=ABS(V(2*(IJ90+KADDR)))       ! V(2, 90deg,K)
      P5=ABS(V(2*(1+KADDR+INC5)))     ! V(1,1,K-1)
      P6=ABS(V(2*(1+KADDR+INC6)))     ! V(1,1,K+1)
      F0=V(1)
      CENT0 = WX0*(P1+P2+P3+P4) + WZ0*(P5+P6) - F0/C00

      JLIM=JMAX
      IF(NSYMM.GT.0)JLIM=JMAX-1      !wrap-around

      DO 890 J=1,JLIM

      JKADDR=(J-1)*IMAX+KADDR
      INC3=-IMAX
      INC4= IMAX
C Apply Neumann if no rotational symmetry:
      IF(NSYMM.EQ.0)THEN
        IF(J.EQ.1)INC3=INC4
        IF(J.EQ.JMAX)INC4=INC3
      ENDIF

      DO 890 I=I1,I2

      MID=I+JKADDR
      MID=MID+MID
      CENT=V(MID)
      IF(CENT.LT.0.) GO TO 890

      IF(I.EQ.1)THEN
        CENT2=CENT0
        GO TO 880
      ENDIF

      INC1=-1
      INC2= 1
      IF(I.EQ.IMAX)INC2=INC1

      R=(I-1)*HX      !radius
      CR=1./R
      C0=2.*(CX**2+CR**2*CY**2+CZ**2)
      W1R=(CX**2-CR*CX/2.)/C0
      W2R=(CX**2+CR*CX/2.)/C0
      WYR=CR**2*CY**2/C0
      WZR=CZ**2/C0

      IF(NSYMM.GT.0.AND.J.EQ.1)THEN      ! wrap-around
        P1=ABS(V(MID+INC1+INC1))
        P2=ABS(V(MID+INC2+INC2))
        P3=ABS(V(2*(I+(JMAX-2)*IMAX+(K-1)*IJMAX)))
        P4=ABS(V(MID+INC4+INC4))
        P5=ABS(V(MID+INC5+INC5))
        P6=ABS(V(MID+INC6+INC6))
        F0=V(MID-1)
        CENT2 = W1R*P1 + W2R*P2 + WYR*(P3+P4) + WZR*(P5+P6) - F0/C0
      ELSE
        P1=ABS(V(MID+INC1+INC1))
        P2=ABS(V(MID+INC2+INC2))
        P3=ABS(V(MID+INC3+INC3))
        P4=ABS(V(MID+INC4+INC4))
        P5=ABS(V(MID+INC5+INC5))
        P6=ABS(V(MID+INC6+INC6))
        F0=V(MID-1)
        CENT2 = W1R*P1 + W2R*P2 + WYR*(P3+P4) + WZR*(P5+P6) - F0/C0
      ENDIF

880   CC=CENT2-CENT
      CENTP=CENT+CC*RELF
      V(MID)=CENTP
C Wrap-around: if J=1 put same value at JMAX
      IF(NSYMM.GT.0.AND.J.EQ.1)V(2*(I+(JMAX-1)*IMAX+KADDR))=CENTP
C Update residuals R and R/V
      IF(ABS(CC).GE.ABS(RESMAX))THEN
        RESMAX=CC
        MIDRMAX=MID
      ENDIF
      VTRUE=ABS(CENT2-OFF)
      IF(VTRUE.GT.0.)CC=CC/VTRUE
      IF(ABS(CC).GE.ABS(RESMAXN))THEN
        RESMAXN=CC
        MIDRMAXN=MID
      ENDIF
C Add more offset if needed
      IF(CENTP.LT.0.)THEN
        V(MID)=0.
        IF(OFF0.EQ.0.)GO TO 890
        OFF=OFF+OFF0
        WRITE(6,*)'Array offset increased to ',OFF
        DO N=2,2*IJKMAX,2
          PHI=V(N)
          IF(PHI.GE.0.)PHI=PHI+OFF0
          IF(PHI.LT.0.)PHI=PHI-OFF0
          V(N)=PHI
        ENDDO
        OFF0=2.*OFF0
      ENDIF        

890   CONTINUE
      GO TO 5000

C======================================================================C
C  Display statistics for the sweep
C======================================================================C
C Get potentials at max residual sites
5000  VRMAX=V(MIDRMAX)
      VRMAXN=V(MIDRMAXN)
      IF(IOPT.EQ.3.OR.IOPT.EQ.5.OR.IOPT.EQ.8)THEN
        VRMAX=VRMAX-OFF
        VRMAXN=VRMAXN-OFF
      ENDIF
C Find address of largest residual
      IF(IOPT.GT.2.AND.IOPT.NE.7)THEN
        MIDRMAX=MIDRMAX/2
        MIDRMAXN=MIDRMAXN/2
      ENDIF
      IRMAX = 1 + MOD(MIDRMAX-1,IMAX)
      JRMAX = 1 + MOD((MIDRMAX-1)/IMAX,JMAX)
      KRMAX = 1 + (MIDRMAX-1)/IJMAX
      IRMAXN = 1 + MOD(MIDRMAXN-1,IMAX)
      JRMAXN = 1 + MOD((MIDRMAXN-1)/IMAX,JMAX)
      KRMAXN = 1 + (MIDRMAXN-1)/IJMAX

      TT2=CPU_TIME(0.)
      TR=TT2-TT1

      WRITE(6,5500,IOSTAT=IERR)RELF,TR,RESMAX,IRMAX,JRMAX,KRMAX,
     #  VRMAX,RESMAXN,IRMAXN,JRMAXN,KRMAXN,VRMAXN

5500  FORMAT(1X,F4.2,1X,F5.2,' |',G10.4,3I4,1X,G10.4,'|',
     #  G10.4,3I4,1X,G10.4)

C Return if out of time or residual less than tolerance
      IF(TT2.GT.TMAX)THEN
        QUIT=.TRUE.
        RETURN
      ENDIF
      IF(ABS(RESMAXN).LT.TOLER)RETURN

8000  CONTINUE
9000  CONTINUE

      RETURN
      END !ITERAT
