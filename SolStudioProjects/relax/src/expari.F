      SUBROUTINE EXPARI(STRING,IPAR,IFIELD,ISTAT)
C======================================================================C
C  Extracts an integer parameter from a specified field of a
C  character string
C======================================================================C
      CHARACTER*(*) STRING

      LOGICAL IN_FIELD
#ifdef g77
      CHARACTER*1 TAB
      TAB=CHAR(9)
#else
      CHARACTER*(*)TAB
      PARAMETER(TAB=CHAR(9))
#endif
      ICOUNT=0
      IN_FIELD=.FALSE.

      DO I=1,LENSIG(STRING)
        IF(STRING(I:I).EQ.' '.OR.STRING(I:I).EQ.TAB)THEN
          IF(IN_FIELD)THEN
            IF(ICOUNT.EQ.IFIELD)GO TO 99
            IN_FIELD=.FALSE.
          ENDIF
        ELSE
          IF(.NOT.IN_FIELD)THEN
            ICOUNT=ICOUNT+1
            IN_FIELD=.TRUE.
            IF(ICOUNT.EQ.IFIELD)ISTART=I
          ENDIF
        ENDIF
      ENDDO

      IF(.NOT.IN_FIELD.OR.ICOUNT.NE.IFIELD)THEN
        ISTAT=-1
        RETURN
      ENDIF

99    READ(STRING(ISTART:I-1),*,ERR=999)IPAR
      ISTAT=0
      RETURN

 999  WRITE(*,1000)'Error reading parameter ',STRING(ISTART:I-1)
1000  FORMAT(1X,A,A)
      CALL FORMSG
      ISTAT=1
      RETURN
      END
