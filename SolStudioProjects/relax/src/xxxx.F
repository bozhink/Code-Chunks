      SUBROUTINE XXXX(V,IMAX,JMAX,KMAX)
C======================================================================C
C  Brings up the crosshairs for coordinate readout & measurement
C  HACKED TO PRINT OUT FIELDS -- NOT GENERAL!
C======================================================================C

      REAL*4 V(IMAX,JMAX,KMAX)

      COMMON/BLOCK1/HX,HY,HZ,WX,WY,WZ,COMFI,WYROT,WXAX,WYAX,COMFAX
      COMMON/BLOCK2/TOLER,IADRESS,MULT,OFF,OFF0,IOPT,BMAX
      COMMON/SLICES/ISLICE(101),NSLICE,ISLCURRENT,PLANE
      CHARACTER*1 PLANE
      COMMON/RORIG/AX0,AY0,IX0,IY0
      COMMON/RSCALE/SFX,SFY

      COMMON/HARDCOPYRANGE/XMINHP2,XMAXHP2,YMINHP2,YMAXHP2,IORIENTH2
      COMMON/PLOTMONITOR/IMONITOR,IOUTM

      COMMON/CURSOR_READOUT/XCROFF,XCRSCALE,YCROFF,YCRSCALE,YCOF,XCOF

      INTEGER I1(3),I2(3)
      CHARACTER*40 KBUFF
      DATA XXL/524./,YXL/393./
      BYTE CODE

#ifdef g77
      CHARACTER*1 E
      CHARACTER*4 R,N,U
      CHARACTER*5 T
      CHARACTER*50 PROMPT
      E=CHAR(27)
      R=E//'[7m'
      N=E//'[0m'
      T=E//'[50C'
      U=E//'[1A'
      PROMPT=U//T//R//' M '//N//'Menu display   '//
     &                     R//' Q '//N//'Quit'
#else
      CHARACTER*(*) E,REV,NOR,T,U,PROMPT
      PARAMETER (E=CHAR(27),REV=E//'[7m',NOR=E//'[0m',
     &           T=E//'[50C',U=E//'[1A')
      PARAMETER (PROMPT=U//T//REV//' M '//NOR//'Menu display   '//
     &                     REV//' Q '//NOR//'Quit')
#endif

      IF(ISLCURRENT.EQ.0)THEN
        WRITE(6,*)'No plot on screen'
        RETURN
      ENDIF

      IJMAX=IMAX*JMAX

      HXX=2.*HX
      HYY=2.*HY
      HZZ=2.*HZ

      CALL CLTRANS
      WRITE(6,*)'Press MB1 or spacebar for readout'
      WRITE(6,*)PROMPT
      WRITE(6,*)
     &  '          I           J           K          V              F'
      WRITE(6,*)
     &  '      -------------------------------------------------------'
     &  //'-------'

20    CALL CROSSHAIR_R(XIN,YIN,CODE,XXL,YXL)
      XXL=XIN
      YXL=YIN
C Convert X and Y to graph coordinates
C     XG = 1. + (XIN-AX0)*SFX
C     YG = 1. + (YIN-AY0)*SFY
      XG = IX0 + (XIN-AX0)*SFX
      YG = IY0 + (YIN-AY0)*SFY
D     WRITE(6,*)'XG,IX0,XIN,AX0,SFX'
D     WRITE(6,*)XG,IX0,XIN,AX0,SFX

21    IF(CODE.EQ.ICHAR('Q'))GO TO 99
C Coordinate display:
      IF(CODE.EQ.ICHAR(' '))THEN
        CALL TRANSPARENT_MODE(0)
        IF(PLANE.EQ.'I')THEN
          I=ISLCURRENT
          J=NINT(XG)
          K=NINT(YG)
        ELSE IF(PLANE.EQ.'J')THEN
          J=ISLCURRENT
          I=NINT(XG)
          K=NINT(YG)
        ELSE IF(PLANE.EQ.'K')THEN
          K=ISLCURRENT
          I=NINT(XG)
          J=NINT(YG)
        ENDIF      
        IF(I.LT.1.OR.I.GT.IMAX.OR.J.LT.1.OR.J.GT.JMAX.OR.
     &     K.LT.1.OR.K.GT.KMAX)THEN
          WRITE(6,*)'Outside plot region'
          GO TO 20
        ENDIF
C       INDEX=MULT*(I+(J-1)*IMAX+(K-1)*IJMAX)
C       VIJK=V(INDEX)
        VIJK=V(I,J,K)
C Remove any offset:
        IF(VIJK.LT.0.)THEN
          VIJK=VIJK+OFF
        ELSE
          VIJK=VIJK-OFF
        ENDIF
        IF(MULT.EQ.1)THEN
          WRITE(6,*)I,J,K,'   ',VIJK
C        ELSE
C          WRITE(6,*)I,J,K,'   ',VIJK,V(INDEX-1)
        ENDIF

C CALCULATE FIELDS
      IF(I.EQ.1)THEN
        EX=(ABS(V(2,J,K))-ABS(V(1,J,K)))/HX
      ELSE IF(I.EQ.IMAX)THEN
        EX=(ABS(V(IMAX,J,K))-ABS(V(IMAX-1,J,K)))/HX
      ELSE
        EX=(ABS(V(I+1,J,K))-ABS(V(I-1,J,K)))/HXX
      ENDIF
      IF(J.EQ.1)THEN
        EY=(ABS(V(I,2,K))-ABS(V(I,1,K)))/HY
      ELSE IF(J.EQ.JMAX)THEN
        EY=(ABS(V(I,JMAX,K))-ABS(V(I,JMAX-1,K)))/HY
      ELSE
        EY=(ABS(V(I,J+1,K))-ABS(V(I,J-1,K)))/HYY
      ENDIF
      IF(KMAX.GT.1)THEN
        IF(K.EQ.1)THEN
          EZ=(ABS(V(I,J,2))-ABS(V(I,J,1)))/HZ
        ELSE IF(K.EQ.KMAX)THEN
          EZ=(ABS(V(I,J,KMAX))-ABS(V(I,J,KMAX-1)))/HZ
        ELSE
          EZ=(ABS(V(I,J,K+1))-ABS(V(I,J,K-1)))/HZZ
        ENDIF
      ELSE
        EZ=0.
      ENDIF

      ETOT=SQRT(EX**2+EY**2+EZ**2)
      IF(V(I,J,K).LT.0.)THEN
        EX=0.
        EY=0.
        EZ=0.
        ETOT=0.
      ENDIF
      WRITE(6,*)EX,EY,EZ,ETOT

C Clear alpha screen:
      ELSE IF(CODE.EQ.ICHAR('/'))THEN
        CALL TRANSPARENT_MODE(0)
        CALL CLTRANS

C Key menu:
      ELSE IF(CODE.EQ.ICHAR('M'))THEN
        CALL CROSS_MENU

      ELSE
        CALL TRANSPARENT_MODE(0)
        WRITE(6,*)'Undefined key'
      ENDIF

      GO TO 20

 99   CALL TRANSPARENT_MODE(0)

      RETURN
      END
