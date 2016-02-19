      SUBROUTINE PLOT2(V,IMAX,JMAX,KMAX,NCELLS,IXORG,IYORG,SPACEL,
     #  IFLUX,IDEBUG)
C======================================================================C
C  Generates a contour plot for each slice
C======================================================================C
      REAL*4 V(*)

      COMMON/BLOCK2/TOLER,IADRESS,MULT,OFF,OFF0,IOPT,BMAX
      COMMON/SLICES/ISLICE(101),NSLICE,ISLCURRENT,PLANE
      CHARACTER*1 PLANE
      COMMON/LEVELS/CLEV(101),NCLEV,PCTLAB
      LOGICAL PCTLAB
      COMMON/FIELDS/EMIN,EMAX
      COMMON/RELAX3D_POLAR1/POLAR,HYDEG,THMAX
      LOGICAL POLAR

C Graph characteristics:
      COMMON/RNCAXIS/NCBT,NDEC,NDIG
      COMMON/RCIL/IPENX,IPENY,IPS,IPC,IPCN,FACR,XM,SIZES,SIZEN,SIZEL,
     #  TICK,STEP,XSPAC,IPNAB,ITAPE,IB,IBC,IBYTE,IBASE,IMMET
      COMMON/RORIG/AX0,AY0
      COMMON/RSCALE/SFX,SFY

C PLOT commons:
      COMMON/TO_BIT_OR_NOT/WELL
      LOGICAL WELL
      COMMON/PLOTMONITOR/IMONITOR,IOUTM
      COMMON/PLOTMONITOR2/IMONITOR2,IOUTM2
      COMMON/DEVICE/TERMTYPE,HARDTYPE
      CHARACTER*15 TERMTYPE,HARDTYPE
C X Window Odometer
      COMMON/CURSOR_READOUT/XCROFF,XCRSCALE,YCROFF,YCRSCALE,YCOF,XCOF

      COMMON/CTRLC/CTRLC_FLAG
      LOGICAL CTRLC_FLAG

C Contour arrays for potential and flux
      INTEGER NPMX,NGRMX
      PARAMETER(NPMX=3000000,NGRMX=5000)
      REAL VP(NPMX),FP(NPMX)
      REAL XGR(NGRMX),YGR(NGRMX)

      CHARACTER*1 ANS

C Set graph parameters
      NCBT=NCELLS
      NDEC=-1
      SIZEL=13.      !label size
      SIZEN=13.      !number size
      SIZES=13.
      TICK=10.
      IMMET=NCBT*10
C Start of axes:
      AX0=55.
      AY0=55.

C Check contour levels to see if percent labelling is possible
      PCTLAB=.TRUE.
      DO I=1,NCLEV
        CL=CLEV(I)
        IF(ABS(CL-NINT(CL)).GE.0.0001)PCTLAB=.FALSE.
      ENDDO      

      IJMAX=IMAX*JMAX
      IJKMAX=IMAX*JMAX*KMAX

C Find range of main array for normalization to [0,1]
      VMAX=ABS(V(MULT))-OFF
      VMIN=VMAX
      DO INDEX=1,IJKMAX
        TEMP=ABS(V(MULT*INDEX))-OFF
        VMAX=MAX(VMAX,TEMP)
        VMIN=MIN(VMIN,TEMP)
      ENDDO
      RANGE=VMAX-VMIN
      IF(RANGE.EQ.0.)RANGE=1.

C======================================================================C
C  Beginning of loop on slices
C======================================================================C
200   DO 900 ISL=1,NSLICE

      IF(NSLICE.EQ.1)GO TO 210      !only one slice
      WRITE(6,5000)PLANE,ISLICE(ISL)
5000  FORMAT(' Plot slice ',A1,'=',I3,' ?  Yes/no/quit > ',$)
      READ(5,5001)ANS
5001  FORMAT(A1)
      IF(ANS.EQ.'Q'.OR.ANS.EQ.'q')RETURN
      IF(ANS.EQ.'N'.OR.ANS.EQ.'n')GO TO 900

210   CALL CLEAR_PLOT
#ifndef g77
      CALL DWG_NEXT
#endif
      CALL TRANSPARENT_MODE(0)
C Reset the origin
      IPENX=0
      IPENY=0

C Fill the slice array and draw the axes

      IF(PLANE.EQ.'K')THEN      !IxJ
        IF(IMAX*JMAX.GT.NPMX)THEN
          WRITE(6,*)'Too many points in slice ',IMAX*JMAX
          WRITE(6,*)'Increase code parameter NPMX'
          RETURN
        ELSE IF(IMAX.GT.NGRMX.OR.JMAX.GT.NGRMX)THEN
          WRITE(6,*)'Too many points on axes ',IMAX,JMAX
          WRITE(6,*)'Increase code parameter NGRMX'
          RETURN
        ENDIF
        K=ISLICE(ISL)
        DO J=1,JMAX
          DO I=1,IMAX
            INDEX=MULT*(I+(J-1)*IMAX+(K-1)*IJMAX)
            VV=ABS(V(INDEX))-OFF
            VVN=(VV-VMIN)/RANGE      !normalize
C Preserve boundary labelling for flux plots:
            IF(IFLUX.EQ.1.AND.V(INDEX).LT.0.)VVN=-VVN
            VP(I+(J-1)*IMAX)=VVN
          ENDDO
        ENDDO
        NX=IMAX
        NY=JMAX
        IPLANE=3
        XMAX=(NX-IXORG)*NCELLS
        YMAX=(NY-IYORG)*NCELLS
C Reset start point of axes which may have been altered for
C CNTOUR on previous polar plot (see below)
        AX0=55.
        AY0=55.
        IF(KMAX.GT.1)THEN
          CALL PSYM(AX0,5.,SIZEL,%REF('K='),0.,2)
          CALL RNUM(AX0+2.*SIZEL,5.,SIZEL,FLOAT(K),0.,-1)
        ENDIF
        IF(POLAR)THEN
          IXORG=1      !only contour full grid for now,
          IYORG=1      !otherwise need clipping at axes
          XMAX=(NX-1)*NCELLS
          XLAXIS=0.
          YMAX=XMAX
          YLAXIS=0.
          IF(THMAX.GT.90.1)THEN
            XMAX=2.*XMAX
            XLAXIS=-(NX-1)
          ENDIF
          IF(THMAX.GT.180.1)THEN
            YMAX=2.*YMAX
            YLAXIS=-(NX-1)
          ENDIF
          CALL RAXIS(AX0,AY0,XMAX,0.,XLAXIS,1./NCELLS,%REF('X'),1)
          CALL RAXIS(AX0,AY0,YMAX,90.,YLAXIS,1./NCELLS,%REF('Y'),-1)
          CALL RAXIS(AX0,AY0+YMAX,XMAX,0.,XLAXIS,0.,%REF(' '),-1)
          CALL RAXIS(AX0+XMAX,AY0,YMAX,90.,YLAXIS,0.,%REF(' '),1)
C Set the origin for CNTOUR
          IF(THMAX.GT.90.1)AX0=AX0+XMAX/2.
          IF(THMAX.GT.180.1)AY0=AY0+YMAX/2.
        ELSE
          CALL RAXIS(AX0,AY0,XMAX,0.,FLOAT(IXORG),1./NCELLS,%REF('I'),1)
          CALL RAXIS(AX0,AY0,YMAX,90.,FLOAT(IYORG),1./NCELLS,%REF('J'),
     &      -1)
          CALL RAXIS(AX0,AY0+YMAX,XMAX,0.,FLOAT(IXORG),0.,%REF(' '),-1)
          CALL RAXIS(AX0+XMAX,AY0,YMAX,90.,FLOAT(IYORG),0.,%REF(' '),1)
        ENDIF

      ELSE IF(PLANE.EQ.'J')THEN      !IxK
        IF(IMAX*KMAX.GT.NPMX)THEN
          WRITE(6,*)'Too many points in slice ',IMAX*KMAX
          WRITE(6,*)'Increase code parameter NPMX'
          RETURN
        ELSE IF(IMAX.GT.NGRMX.OR.KMAX.GT.NGRMX)THEN
          WRITE(6,*)'Too many points on axes ',IMAX,KMAX
          WRITE(6,*)'Increase code parameter NGRMX'
          RETURN
        ENDIF
        J=ISLICE(ISL)
        DO K=1,KMAX
          DO I=1,IMAX
            INDEX=MULT*(I+(J-1)*IMAX+(K-1)*IJMAX)
            VV=ABS(V(INDEX))-OFF
            VVN=(VV-VMIN)/RANGE      !normalize
C Preserve boundary labelling for flux plots:
            IF(IFLUX.EQ.1.AND.V(INDEX).LT.0.)VVN=-VVN
            VP(I+(K-1)*IMAX)=VVN
          ENDDO
        ENDDO
        NX=IMAX
        NY=KMAX
        IPLANE=2
        XMAX=(NX-IXORG)*NCELLS
        YMAX=(NY-IYORG)*NCELLS
        CALL PSYM(AX0,5.,SIZEL,%REF('J='),0.,2)
        CALL RNUM(AX0+2.*SIZEL,5.,SIZEL,FLOAT(J),0.,-1)
        CALL RAXIS(AX0,AY0,XMAX,0.,FLOAT(IXORG),1./NCELLS,%REF('I'),1)
        CALL RAXIS(AX0,AY0,YMAX,90.,FLOAT(IYORG),1./NCELLS,%REF('K'),-1)
        CALL RAXIS(AX0,AY0+YMAX,XMAX,0.,FLOAT(IXORG),0.,%REF(' '),-1)
        CALL RAXIS(AX0+XMAX,AY0,YMAX,90.,FLOAT(IYORG),0.,%REF(' '),1)

      ELSE IF(PLANE.EQ.'I')THEN      !JxK
        IF(JMAX*KMAX.GT.NPMX)THEN
          WRITE(6,*)'Too many points in slice ',JMAX*KMAX
          WRITE(6,*)'Increase code parameter NPMX'
          RETURN
        ELSE IF(JMAX.GT.NGRMX.OR.KMAX.GT.NGRMX)THEN
          WRITE(6,*)'Too many points on axes ',JMAX,KMAX
          WRITE(6,*)'Increase code parameter NGRMX'
          RETURN
        ENDIF
        I=ISLICE(ISL)
        DO K=1,KMAX
          DO J=1,JMAX
            INDEX=MULT*(I+(J-1)*IMAX+(K-1)*IJMAX)
            VV=ABS(V(INDEX))-OFF
            VVN=(VV-VMIN)/RANGE      !normalize
C Preserve boundary labelling for flux plots:
            IF(IFLUX.EQ.1.AND.V(INDEX).LT.0.)VVN=-VVN
            VP(J+(K-1)*JMAX)=VVN
          ENDDO
        ENDDO
        NX=JMAX
        NY=KMAX
        IPLANE=1
        XMAX=(NX-IXORG)*NCELLS
        YMAX=(NY-IYORG)*NCELLS
        CALL PSYM(AX0,5.,SIZEL,%REF('I='),0.,2)
        CALL RNUM(AX0+2.*SIZEL,5.,SIZEL,FLOAT(I),0.,-1)
        CALL RAXIS(AX0,AY0,XMAX,0.,FLOAT(IXORG),1./NCELLS,%REF('J'),1)
        CALL RAXIS(AX0,AY0,YMAX,90.,FLOAT(IYORG),1./NCELLS,%REF('K'),-1)
        CALL RAXIS(AX0,AY0+YMAX,XMAX,0.,FLOAT(IXORG),0.,%REF(' '),-1)
        CALL RAXIS(AX0+XMAX,AY0,YMAX,90.,FLOAT(IYORG),0.,%REF(' '),1)
      ENDIF

      CALL TRANSPARENT_MODE(0)
      WRITE(6,*)'clabel,magn,x0,y0:',NINT(SPACEL),NCELLS,IXORG,IYORG
      WRITE(6,*)'Vmin,Vmax,range:  ',VMIN,VMAX,RANGE

C Record slice number for use by CROSS
      ISLCURRENT=ISLICE(ISL)
C Set up X-Window odometers for graph coordinates.
C X1,X2,Y1,Y2 are graph coordinates of edges of window.
      IF(IMONITOR.EQ.15.OR.IMONITOR.EQ.18)THEN
        SFX = (NX-1)/XMAX      !scale factor for w.c. to g.c.
        X1 = 1 - AX0*SFX
        X2 = NX + (1047.-AX0-XMAX)*SFX
        SFY = (NY-1)/YMAX      !scale factor for w.c. to g.c.
        Y1 = 1 - AY0*SFY
        Y2 = NY + (785.-AY0-YMAX)*SFY
        XCROFF=X1
        YCROFF=Y1
        XCRSCALE=X2-X1
        YCRSCALE=(Y2-Y1)/0.75
      ENDIF

C Calculate flux or field if requested
      IF(IFLUX.EQ.1)THEN
        CALL CFLUX(VP,FP,NX,NY,IDEBUG)
        DO I=1,NX*NY      !now remove boundary labelling
          VP(I)=ABS(VP(I))
        ENDDO
      ELSE IF(IFLUX.EQ.2)THEN
        CALL FIELD(VP,FP,NX,NY,IPLANE)
C Display un-normalized field limits:
        WRITE(6,*)'Emin,Emax,range:  ',RANGE*EMIN,RANGE*EMAX,
     #    RANGE*(EMAX-EMIN)
      ENDIF

C Load grid coordinate arrays
C Contouring is now performed in the "grid" coordinate system
C and scaling to screen coordinates is done in TOURB1.
      DO I=1,NX
C       XGR(I)=(I-1)*NCELLS
        XGR(I)=I-1
      ENDDO
      DO I=1,NY
C       YGR(I)=(I-1)*NCELLS
        YGR(I)=I-1
      ENDDO
C For polar plots need actual theta in degrees
      IF(POLAR.AND.PLANE.EQ.'K')THEN
        DO I=1,NY
          YGR(I)=(I-1)*HYDEG
        ENDDO
      ENDIF

C Size of contour labels
      SYMSIZ=6.
C Distance between contour labels
      SPL=MAX(0.,SPACEL)
c      SPL=SPL/NCELLS
C======================================================================C
C  Beginning of loop on contour levels
C======================================================================C
      CALL CTRLC_TRAP(IDUM)

      DO 140 I=1,NCLEV

      IF(CTRLC_FLAG)GO TO 141

      CN=.01*CLEV(I)
C Stay slightly away from 0 and 1 so contour algorithm will work:
      IF(CN.LT.0.00001)CN=0.00001
      IF(CN.GT.0.99999)CN=0.99999

C Label for integral percent values (only integer portion is plotted):
      ZLAB = CN*100. + 0.1

C Plot potential contour
      IF(IFLUX.EQ.2)GO TO 125
      IF(PCTLAB)THEN
        CALL CNTOUR(XGR,NX-IXORG+1,YGR,NY-IYORG+1,
     #    VP(IXORG+(IYORG-1)*NX),NX,CN,SPL,ZLAB,SYMSIZ)
      ELSE
        CALL CNTOUR(XGR,NX-IXORG+1,YGR,NY-IYORG+1,
     #    VP(IXORG+(IYORG-1)*NX),NX,CN,SPL,0.,SYMSIZ)
      ENDIF
      IF(IFLUX.NE.1) GO TO 140

C Plot flux or field contour
125   IF(PCTLAB)THEN
        CALL CNTOUR(XGR,NX-IXORG+1,YGR,NY-IYORG+1,
     #    FP(IXORG+(IYORG-1)*NX),NX,CN,SPL,ZLAB,SYMSIZ)
      ELSE
        CALL CNTOUR(XGR,NX-IXORG+1,YGR,NY-IYORG+1,
     #    FP(IXORG+(IYORG-1)*NX),NX,CN,SPL,0.,SYMSIZ)
      ENDIF

140   CONTINUE
C======================================================================C
C  End of loop on contour levels
C======================================================================C

141   CALL FLUSH_PLOT

      IF(NSLICE.EQ.1)GO TO 900
      WRITE(6,5002)
5002  FORMAT(' Hardcopy?  yes/No > ',$)
      READ(5,5001)ANS
      IF(ANS.EQ.'Y'.OR.ANS.EQ.'y')THEN
        CALL NARGSI(1)
        IF(HARDTYPE.EQ.'PX')THEN
          CALL GRAPHICS_HARDCOPY(1)
        ELSE IF(HARDTYPE.EQ.'ZETA')THEN
          CALL GRAPHICS_HARDCOPY(2)
        ELSE IF(HARDTYPE.EQ.'HPP')THEN
          CALL GRAPHICS_HARDCOPY(3)
        ELSE IF(HARDTYPE(1:3).EQ.'HPL')THEN
          CALL GRAPHICS_HARDCOPY(4)
        ELSE IF(HARDTYPE.EQ.'HPPJ')THEN
          CALL GRAPHICS_HARDCOPY(11)
        ELSE IF(HARDTYPE.EQ.'PS')THEN
          CALL GRAPHICS_HARDCOPY(12)
        ENDIF
      ENDIF

900   CONTINUE
C======================================================================C
C  End of loop on slices
C======================================================================C
      RETURN
      END !PLOT2
