      SUBROUTINE CLDISP
C======================================================================C
C  Clears the graphics screen.
C  Also clears transparent screen on some terminals:  VT640, Pericom
C======================================================================C
      COMMON/PLOTMONITOR/IMONITOR,IOUTM

      CHARACTER*1 GS/29/,ESC/27/,FF/12/,CAN/24/

      IF(IMONITOR.EQ.8)THEN      ! REGIS
#ifdef VMS
        WRITE(IOUTM,1000)ESC//'\'//ESC//'[2J'//ESC//'[1;1H'
#else
        WRITE(IOUTM,1000)ESC//'\\'//ESC//'[2J'//ESC//'[1;1H'
#endif
        CALL REGIS_MODE
        WRITE(IOUTM,1000)'W(F15)'   ! JLC  Nov 28/88
        CALL TRANSPARENT_MODE(0)
      ELSE IF(IMONITOR.EQ.17)THEN
        CALL GENERIC_CLEAR
        CALL TRANSPARENT_MODE(0)
      ELSE
        WRITE(6,1000)GS//ESC//FF//CAN
      ENDIF

1000  FORMAT('+',A,$)

      RETURN
      END
