      SUBROUTINE CROSS(V,IMAX,JMAX,KMAX)
C======================================================================C
C  Brings up the crosshairs for coordinate readout & measurement
C======================================================================C

      REAL*4 V(1)
      COMMON/BLOCK2/TOLER,IADRESS,MULT,OFF,OFF0,IOPT,BMAX
      COMMON/SLICES/ISLICE(101),NSLICE,ISLCURRENT,PLANE
      CHARACTER*1 PLANE
      COMMON/RORIG/AX0,AY0
      COMMON/RSCALE/SFX,SFY

      COMMON/HARDCOPYRANGE/XMINHP2,XMAXHP2,YMINHP2,YMAXHP2,IORIENTH2
      COMMON/PLOTMONITOR/IMONITOR,IOUTM

      COMMON/CURSOR_READOUT/XCROFF,XCRSCALE,YCROFF,YCRSCALE,YCOF,XCOF

      INTEGER I1(3),I2(3)
      CHARACTER*40 KBUFF
      REAL XXL/524./,YXL/393./
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
      CHARACTER*(*) E,R,N,T,U,PROMPT
      PARAMETER (E=CHAR(27),R=E//'[7m',N=E//'[0m',
     &           T=E//'[50C',U=E//'[1A')
      PARAMETER (PROMPT=U//T//R//' M '//N//'Menu display   '//
     &                     R//' Q '//N//'Quit')
#endif

      IF(ISLCURRENT.EQ.0)THEN
        WRITE(6,*)'No plot on screen'
        RETURN
      ENDIF

      IJMAX=IMAX*JMAX

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
      XG = 1. + (XIN-AX0)*SFX
      YG = 1. + (YIN-AY0)*SFY

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
        INDEX=MULT*(I+(J-1)*IMAX+(K-1)*IJMAX)
        VIJK=V(INDEX)
C Remove any offset:
        IF(VIJK.LT.0.)THEN
          VIJK=VIJK+OFF
        ELSE
          VIJK=VIJK-OFF
        ENDIF
        IF(MULT.EQ.1)THEN
          WRITE(6,*)I,J,K,'   ',VIJK
        ELSE
          WRITE(6,*)I,J,K,'   ',VIJK,V(INDEX-1)
        ENDIF

C Clear alpha screen:
      ELSE IF(CODE.EQ.ICHAR('/'))THEN
        CALL TRANSPARENT_MODE(0)
        CALL CLTRANS

C Key menu:
      ELSE IF(CODE.EQ.ICHAR('M'))THEN
        CALL CROSS_MENU

      ELSE IF(CODE.EQ.ICHAR('Q'))THEN
        CALL TRANSPARENT_MODE(0)
        RETURN

      ELSE
        CALL TRANSPARENT_MODE(0)
        WRITE(6,*)'Undefined key'
      ENDIF

      GO TO 20

      END
