      SUBROUTINE ITERAT3(V,NITER,IMAX,JMAX,KMAX,IJMAX,I1,I2,J1,J2,
     #  K1,K2,INC,RELFAC,IMAXP1,JMAXP1,KMAXP1,IJKMAX,QUIT)
C *** Experimentally modified ITERAT with 3-d addresses! *************
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

      COMMON/CTRLC/CTRLC_FLAG
      LOGICAL CTRLC_FLAG

C g77 has intrinsic by this name
#ifdef g77
      EXTERNAL CPU_TIME
#endif

      REAL*4 V(IMAX,JMAX,KMAX)
      LOGICAL QUIT

      LOGICAL CUBES
      DATA IDIR/-1/,JDIR/-1/,KDIR/-1/

C Weights for 27-point molecule
      PARAMETER(W1=21./(32.*6.),W2=9./(32.*12.),W3=1./(16.*8.))

C Enable CTRL-C interrupts
      CALL CTRLC_TRAP(IDUM)

      QUIT=.FALSE.
      CUBES=(WX.EQ.WY.AND.WY.EQ.WZ)

      I1I2=I1+I2
      J1J2=J1+J2
      K1K2=K1+K2

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
      TT1=CPU_TIME(0.)
      KDIR=-KDIR      !always switch sweeping direction

C Execute relevant iteration loop:

      IOPT3=IOPT-10
      GO TO(100,200)IOPT3
      RETURN

C======================================================================C
C  IOPT=11      Laplace, EXPERIMENTAL 3-D ADDRESSING
C======================================================================C
100   DO 192 KL=K1,K2,INC
      K=KL
      IF(ALTERNATE.AND.KDIR.EQ.-1)K=K1K2-KL
      KM1=K-1
      IF(K.EQ.1)KM1=2
      KP1=K+1
      IF(K.EQ.KMAX)KP1=KMAX-1
      JDIR=-JDIR

      DO 191 JL=J1,J2,INC
      J=JL
      IF(ALTERNATE.AND.JDIR.EQ.-1)J=J1J2-JL
      JM1=J-1
      IF(J.EQ.1)JM1=2
      JP1=J+1
      IF(J.EQ.JMAX)JP1=JMAX-1
      IDIR=-IDIR

      DO 190 IL=I1,I2,INC
      I=IL
      IF(ALTERNATE.AND.IDIR.EQ.-1)I=I1I2-IL
D     WRITE(6,*)I,J,K
      CENT=V(I,J,K)
      IF(CENT.LT.0.) GO TO 190
      IM1=I-1
      IF(I.EQ.1)IM1=2
      IP1=I+1
      IF(I.EQ.IMAX)IP1=IMAX-1

      CENT2=WX*(ABS(V(IM1,J,K))+ABS(V(IP1,J,K)))      
     #     +WY*(ABS(V(I,JM1,K))+ABS(V(I,JP1,K)))
     #     +WZ*(ABS(V(I,J,KM1))+ABS(V(I,J,KP1)))

      CC=CENT2-CENT
      CENTP=CENT+CC*RELF
C Clamp to 0 if we went negative due to overrelaxation:
      IF(CENTP.LT.0.)CENTP=0.
      V(I,J,K)=CENTP
C Update residuals R and R/V
      IF(ABS(CC).GE.ABS(RESMAX))THEN
        RESMAX=CC
        IRMAX=I
        JRMAX=J
        KRMAX=K
      ENDIF
      IF(CENT2.GT.0.)CC=CC/CENT2
      IF(ABS(CC).GE.ABS(RESMAXN))THEN
        RESMAXN=CC
        IRMAXN=I
        JRMAXN=J
        KRMAXN=K
      ENDIF

190   CONTINUE
191   CONTINUE
192   CONTINUE
      GO TO 5000

C======================================================================C
C  IOPT=12      Laplace, EXPERIMENTAL 27-PT MOLECULE, HX=HY=HZ
C======================================================================C
200   DO 292 KL=K1,K2,INC
      K=KL
      IF(ALTERNATE.AND.KDIR.EQ.-1)K=K1K2-KL
      KM1=K-1
      IF(K.EQ.1)KM1=2
      KP1=K+1
      IF(K.EQ.KMAX)KP1=KMAX-1
      JDIR=-JDIR

      DO 291 JL=J1,J2,INC
      J=JL
      IF(ALTERNATE.AND.JDIR.EQ.-1)J=J1J2-JL
      JM1=J-1
      IF(J.EQ.1)JM1=2
      JP1=J+1
      IF(J.EQ.JMAX)JP1=JMAX-1
      IDIR=-IDIR

      DO 290 IL=I1,I2,INC
      I=IL
      IF(ALTERNATE.AND.IDIR.EQ.-1)I=I1I2-IL
D     WRITE(6,*)I,J,K
      CENT=V(I,J,K)
      IF(CENT.LT.0.) GO TO 290
      IM1=I-1
      IF(I.EQ.1)IM1=2
      IP1=I+1
      IF(I.EQ.IMAX)IP1=IMAX-1

C 6 points at distance 1
      AVG1=ABS(V(IM1,J,K))+ABS(V(IP1,J,K))+
     #     ABS(V(I,JM1,K))+ABS(V(I,JP1,K))+
     #     ABS(V(I,J,KM1))+ABS(V(I,J,KP1))

C 12 points at distance Sqrt[2]
      AVG2=ABS(V(IM1,JM1,K))+ABS(V(IP1,JM1,K))+
     #     ABS(V(IM1,JP1,K))+ABS(V(IP1,JP1,K))+
     #     ABS(V(IM1,J,KM1))+ABS(V(IP1,J,KM1))+
     #     ABS(V(IM1,J,KP1))+ABS(V(IP1,J,KP1))+
     #     ABS(V(I,JM1,KM1))+ABS(V(I,JP1,KM1))+
     #     ABS(V(I,JM1,KP1))+ABS(V(I,JP1,KP1))

C 8 points at distance Sqrt[3]
      AVG3=ABS(V(IM1,JM1,KM1))+ABS(V(IP1,JM1,KM1))+
     #     ABS(V(IM1,JP1,KM1))+ABS(V(IP1,JP1,KM1))+
     #     ABS(V(IM1,JM1,KP1))+ABS(V(IP1,JM1,KP1))+
     #     ABS(V(IM1,JP1,KP1))+ABS(V(IP1,JP1,KP1))

      CENT2=W1*AVG1+W2*AVG2+W3*AVG3

      CC=CENT2-CENT
      CENTP=CENT+CC*RELF
C Clamp to 0 if we went negative due to overrelaxation:
      IF(CENTP.LT.0.)CENTP=0.
      V(I,J,K)=CENTP
C Update residuals R and R/V
      IF(ABS(CC).GE.ABS(RESMAX))THEN
        RESMAX=CC
        IRMAX=I
        JRMAX=J
        KRMAX=K
      ENDIF
      IF(CENT2.GT.0.)CC=CC/CENT2
      IF(ABS(CC).GE.ABS(RESMAXN))THEN
        RESMAXN=CC
        IRMAXN=I
        JRMAXN=J
        KRMAXN=K
      ENDIF

290   CONTINUE
291   CONTINUE
292   CONTINUE
      GO TO 5000

C======================================================================C
C  Display statistics for the sweep
C======================================================================C
C Get potentials at max residual sites
5000  VRMAX=V(IRMAX,JRMAX,KRMAX)
      VRMAXN=V(IRMAXN,IRMAXN,KRMAXN)
      IF(IOPT.EQ.3.OR.IOPT.EQ.5.OR.IOPT.EQ.8)THEN
        VRMAX=VRMAX-OFF
        VRMAXN=VRMAXN-OFF
      ENDIF

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
