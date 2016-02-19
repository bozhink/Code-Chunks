      SUBROUTINE CROSS_MENU
C======================================================================C
C  Displays the Key Menu for crosshair mode
C======================================================================C
      COMMON/PLOTMONITOR/IMONITOR,IOUTM

#ifdef g77
      CHARACTER*1 ESC
      CHARACTER*4 REV,NOR
      ESC=CHAR(27)
      REV=ESC//'[7m'
      NOR=ESC//'[0m'
#else
      CHARACTER*(*) ESC,REV,NOR
      PARAMETER (ESC=CHAR(27),REV=ESC//'[7m',NOR=ESC//'[0m')
#endif
      CALL TRANSPARENT_MODE(0)
      CALL CLTRANS
      IF(IMONITOR.EQ.15.OR.IMONITOR.EQ.18)THEN
        WRITE(6,*)'MOUSE BUTTONS:'
        WRITE(6,*)REV,' MB1 ',NOR,' Array value readout'
        IF(IMONITOR.EQ.18)WRITE(6,*)REV,' MB1 drag ',NOR,' Zoom'
        WRITE(6,*)REV,' MB2 ',NOR,' Odometer on/off'
        WRITE(6,*)REV,' MB3 ',NOR,' Long crosshairs on/off'
        WRITE(6,*)
      ENDIF
      WRITE(6,*)'KEYS:'
      WRITE(6,*)REV,' space ',NOR,' Array value readout'
      WRITE(6,*)REV,' / ',NOR,' Clear alpha screen'
      WRITE(6,*)REV,' M ',NOR,' Display this menu'
      WRITE(6,*)REV,' Q ',NOR,' Quit'
      WRITE(6,*)

      RETURN
      END
