      SUBROUTINE EXFIELD(STRING,FIELD,IFIELD,ISTAT)
C======================================================================C
C  Extracts a specified field from a character string
C======================================================================C
      CHARACTER*(*) STRING,FIELD

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
            IF(ICOUNT.EQ.IFIELD)THEN
              FIELD=STRING(ISTART:I-1)
              ISTAT=0
              RETURN
            ENDIF
            IN_FIELD=.FALSE.
          ENDIF
cc        ELSE IF(STRING(I:I).EQ.'/')THEN
cc          IF(IN_FIELD)THEN
cc            IF(ICOUNT.EQ.IFIELD)THEN
cc              FIELD=STRING(ISTART:I-1)
cc              ISTAT=0
cc              RETURN
cc            ENDIF
cc          ENDIF
cc          ICOUNT=ICOUNT+1
cc          IN_FIELD=.TRUE.
cc          ISTART=I
        ELSE
          IF(.NOT.IN_FIELD)THEN
            ICOUNT=ICOUNT+1
            IN_FIELD=.TRUE.
            ISTART=I
          ENDIF
        ENDIF
      ENDDO

      IF(IN_FIELD.AND.ICOUNT.EQ.IFIELD)THEN
        FIELD=STRING(ISTART:LENSIG(STRING))
        ISTAT=0
      ELSE
        ISTAT=-1
      ENDIF
      RETURN
      END
