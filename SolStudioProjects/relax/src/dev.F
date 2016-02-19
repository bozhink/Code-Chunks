      SUBROUTINE DEV(TERM,HARD)
C======================================================================C
C  Sets up the terminal and hardcopy device
C======================================================================C
      CHARACTER*(*) TERM,HARD

      COMMON/TO_BIT_OR_NOT/WELL
      LOGICAL WELL
      COMMON/BITMAP_DEVICE/IBIT
      COMMON/PLOTMONITOR2/IMONITOR2,IOUTM2
      COMMON/PLOT_COLOURS/ICOLOUR_1,ICOLOUR_2

      CALL GET_TERMTYPE(TERM)
      CALL GET_HARDTYPE(HARD)

      XM1=0.
      YM1=0.
      IF(TERM.EQ.'CIT467')THEN
        XM2=571.
        YM2=479.
        IMON=6
      ELSE IF(TERM.EQ.'X'.OR.TERM.EQ.'DECWINDOWS')THEN
        TERM='X'
        XM2=1.
        YM2=0.75
        IMON=18
      ELSE IF(TERM.EQ.'REGIS')THEN
        XM2=639.
        YM2=479.
        IMON=8
      ELSE IF(TERM.EQ.'GENERIC')THEN
        XM2=639.
        YM2=479.
        IMON=17
      ELSE IF(TERM.EQ.'TK4107')THEN
        XM2=639.
        YM2=479.
        IMON=7
      ELSE IF(TERM.EQ.'PT100G')THEN
        XM2=639.
        YM2=479.
        IMON=9
      ELSE      !VT640
        TERM='VT640'
        XM2=639.
        YM2=479.
        IMON=1
      ENDIF
      XH1=0.
      YH1=0.
      IBIT=0
      IMONITOR2=0
      IF(HARD.EQ.'PRINTRONIX')THEN      !Printronix
        XH2=1271.
        YH2=785.
        IORI=1
        WELL=.TRUE.
      ELSE IF(HARD.EQ.'HPA')THEN      !HP/Zeta plotter
        XH2=479.
        YH2=639.
        IORI=1
        WELL=.FALSE.
      ELSE IF(HARD.EQ.'HPLASER300')THEN      !HP Laserjet 300 dpi
        XH2=2999.
        YH2=2249.
        IORI=1
        WELL=.TRUE.
        CALL HPJET_DENSITY('300')
        CALL HPJETC_DENSITY('300')
        IBIT=32
      ELSE IF(HARD.EQ.'HPPAINTJET')THEN      !HP Paintjet
        XH1=45.
        XH2=1844.
        YH1=45.
        YH2=1394.
        IORI=1
        WELL=.TRUE.
        IBIT=5
      ELSE IF(HARD.EQ.'POSTSCRIPT'.OR.HARD.EQ.'PS')THEN
        HARD='POSTSCRIPT'
        XH2=479.
        YH2=639.
        IORI=-1
        WELL=.FALSE.
      ELSE                           !Laserjet 150 dpi
        HARD='HPLASER'
        XH2=1499.
        YH2=1124.
        IORI=1
        WELL=.TRUE.
      ENDIF
      CALL HARDCOPY_RANGE(XH1,XH2,YH1,YH2,0.,1047.,0.,785.,IORI)
      CALL MONITOR_RANGE(IMON,6,XH1,XH2,YH1,YH2,XM1,XM2,YM1,YM2,IORI)
      IF(HARD.EQ.'HPA')THEN
        CALL MONITOR2_RANGE(5,7,XH1,XH2,YH1,YH2,0.,25.36,0.,19.02,IORI)
      ELSE IF(HARD.EQ.'POSTSCRIPT')THEN
        CALL MONITOR2_RANGE(14,7,XH1,XH2,YH1,YH2,
     #    150.,3150.,150.,2400.,IORI)
      ENDIF
      IF(TERM.EQ.'CIT467')THEN
        CALL PLOT_COLOR(6,0)
        CALL TRANSPARENT_MODE(0)
      ELSE IF(TERM.EQ.'TK4107')THEN
        CALL PLOT_COLOR(5,0)
        CALL TRANSPARENT_MODE(0)
      ELSE IF(TERM.EQ.'CVAXSTATION')THEN
        CALL CLEAR_PLOT
        CALL PLOT_COLOR(7,0)
      ELSE IF(TERM.EQ.'MVAXSTATION')THEN
        CALL CLEAR_PLOT
      ELSE IF(TERM.EQ.'X')THEN
        CALL CLEAR_PLOT
        CALL PLOT_COLOR(7,0)
        CALL XVST_WNAME('RELAX3D'//CHAR(0),'RELAX3D'//CHAR(0))
      ELSE IF(TERM.EQ.'REGIS')THEN
        CALL PLOT_COLOR(6,0)      !gives white on DecW VT340 emulator
        CALL TRANSPARENT_MODE(0)
      ENDIF
C Set HP Paintjet to black
      IF(TERM.EQ.'HPPAINTJET')ICOLOUR_1=7

      RETURN
      END
