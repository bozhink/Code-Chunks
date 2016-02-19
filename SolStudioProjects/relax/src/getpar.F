      SUBROUTINE GETPAR(PROMPT,PAR,IDISP,ISTAT)
C======================================================================C
C                                                                      C
C  GETPAR.FOR                                    F.W. Jones, TRIUMF    C
C                                                                      C
C  Get a parameter (REAL*4) from the user.                             C
C                                                                      C
C  Input:                                                              C
C                                                                      C
C  PROMPT = prompt string                                              C
C  PAR    = current value of parameter                                 C
C  IDISP  = 0: do not display current value                            C
C         = 1: display current value                                   C
C         = 2: display current value, and suppress the decimal         C
C              point when there is no decimal fraction.                C
C                                                                      C
C  Output:                                                             C
C                                                                      C
C  PAR    = new value of parameter if one was entered,                 C
C           otherwise unchanged                                        C
C  ISTAT  = 0: no new value was entered (carriage return)              C
C         = 1: a new value was entered                                 C
C         =-1: Q (quit) or CTRL-Z was entered                          C
C                                                                      C
C         The displayed values will contain at most 6 significant      C
C         digits, whereas VAX REAL*4 representation may have 7.        C
C         This limit is required to obtain correct conversion of       C
C         some quantities, e.g. 0.1, which converts as .9999999E-01    C
C         in Ex.7 format and correctly as .100000E+00 in Ex.6 format.  C
C         Six significant digits should be more than sufficient        C
C         for most applications.                                       C
C                                                                      C
C         Trailing zeros in a decimal fraction will be trimmed.        C
C         Quantities larger than 9,999,999 or smaller than .001        C
C         will be displayed in "E" format, although entered values     C
C         may be in either "E" or "F" format.  In general, the         C
C         display is designed for maximum readability.                 C
C                                                                      C
C======================================================================C

      CHARACTER*(*) PROMPT
      CHARACTER*17 VAL
      CHARACTER*20 ENTRY

1000  FORMAT(1X,A,' < ',A,' > ',$)
1010  FORMAT(1X,A,' > ',$)

C Display prompt and current value:
 10   IF(IDISP.GT.0)THEN
        CALL ASMB(PAR,VAL,IDISP,ILAST)
        WRITE(6,1000)PROMPT,VAL(1:ILAST)
C Display prompt only:
      ELSE
        WRITE(6,1010)PROMPT
      ENDIF

      READ(5,1009,ERR=10,END=999)ENTRY
1009  FORMAT(A)

C Nothing entered
      IF(LENSIG(ENTRY).EQ.0)THEN
        ISTAT=0
        RETURN
      ENDIF

C Uppercase and remove leading blanks
      CALL UPRCASE(ENTRY,ENTRY)
      DO WHILE(ENTRY(1:1).EQ.' ')
        ENTRY=ENTRY(2:)
      ENDDO

C Quit code?
      IF(ENTRY(1:1).EQ.'Q')THEN
        ISTAT=-1
        RETURN
      ENDIF

C Check for input that converts o.k. but should be rejected:
      IF(ENTRY(1:1).EQ.'T'.OR.ENTRY(1:1).EQ.'F'.OR.
     #   ENTRY(1:1).EQ.'D'.OR.ENTRY(1:1).EQ.'E')GO TO 10

C Convert user's input and return
      READ(ENTRY,*,ERR=10)PAR
      ISTAT=1
      RETURN

C End of file on input
999   ISTAT=-1
      RETURN

      END


      SUBROUTINE ASMB(PAR,VAL,IDISP,ILAST)
C======================================================================C
C  Auxiliary routine for GETPAR.                                       C
C  Assemble the display string VAL for parameter PAR.                  C
C  ILAST is returned as the last significant character position        C
C  in VAL.                                                             C
C======================================================================C

      CHARACTER*12 TEMP
      CHARACTER*17 VAL

155   WRITE(TEMP,1020)ABS(PAR)
1020  FORMAT(E11.6)

C Read back exponent:
      READ(TEMP,1021)IEXP
1021  FORMAT(8X,I3)

C Keep E format for large or small quantities:
      IF(IEXP.GT.6.OR.IEXP.LT.-2)THEN
        VAL(1:1)=TEMP(2:2)
        VAL(2:2)='.'
        VAL(3:7)=TEMP(3:7)
C Trim trailing zeros on mantissa:
        LOC=7
310     IF(VAL(LOC:LOC).NE.'0'.OR.LOC.EQ.3)GO TO 315
        LOC=LOC-1
        GO TO 310
315     IEXP=IEXP-1
        IF(IEXP.GT.9)THEN
          WRITE(VAL(LOC+1:LOC+4),1022)IEXP
          ILAST=LOC+4
        ENDIF
1022    FORMAT('E+',I2)
        IF(IEXP.GT.0.AND.IEXP.LE.9)THEN
          WRITE(VAL(LOC+1:LOC+3),1024)IEXP
          ILAST=LOC+3
        ENDIF
1024    FORMAT('E+',I1)
        IF(IEXP.LT.-9)THEN
          WRITE(VAL(LOC+1:LOC+4),1023)IEXP
          ILAST=LOC+4
        ENDIF
1023    FORMAT('E',I3)
        IF(IEXP.LT.0.AND.IEXP.GE.-9)THEN
          WRITE(VAL(LOC+1:LOC+3),1025)IEXP
          ILAST=LOC+3
        ENDIF
1025    FORMAT('E',I2)
        GO TO 170
      ENDIF

      IF(IEXP.EQ.0)THEN
        VAL(1:7)=TEMP(1:7)
        ILAST=7
        GO TO 350
      ENDIF

      IF(IEXP.GT.0)THEN
        ILAST=7
        VAL(1:IEXP)=TEMP(2:IEXP+1)
        VAL(IEXP+1:IEXP+1)='.'
        IF(IEXP.EQ.6)GO TO 350
        VAL(IEXP+2:7)=TEMP(IEXP+2:7)
        GO TO 350
      ENDIF

C IEXP .LT. 0:
      IEXP=IABS(IEXP)
      VAL(1:1)='.'
      VAL(2:2)='0'
      IF(IEXP.GT.1)VAL(3:3)='0'
      VAL(IEXP+2:IEXP+7)=TEMP(2:7)
      ILAST=IEXP+7

C Trim trailing zeros:
350   IF(VAL(ILAST:ILAST).NE.'0')GO TO 170
      ILAST=ILAST-1
      GO TO 350

C Special case for "zero":
170   IF(ILAST.EQ.1)THEN
        VAL(1:2)='0.'
        ILAST=2
      ENDIF
C Suppress final decimal point?
      IF(IDISP.EQ.2.AND.VAL(ILAST:ILAST).EQ.'.')ILAST=ILAST-1
C Minus sign needed?
      IF(PAR.LT.0.)THEN
        VAL(2:ILAST+1)=VAL(1:ILAST)
        VAL(1:1)='-'
        ILAST=ILAST+1
      ENDIF
C
      RETURN
      END


      SUBROUTINE GETPARI(PROMPT,IPAR,IDISP,ISTAT)
C======================================================================C
C  Integer version of GETPAR.
C  If a real number is entered, it is truncated to an integer.
C======================================================================C
      CHARACTER*(*) PROMPT

      PAR=IPAR
      IIDISP=IDISP
C Suppress the decimal point if old value displayed:
      IF(IIDISP.EQ.1)IIDISP=2
      CALL GETPAR(PROMPT,PAR,IIDISP,ISTAT)
      IF(ISTAT.NE.1)RETURN      !No number was entered
      IPAR=PAR

      RETURN
      END


      SUBROUTINE GETANS(PROMPT,ANS)
C======================================================================C
C  Get a single-character answer to a prompt
C======================================================================C
      BYTE ANS
      CHARACTER*(*) PROMPT

20    WRITE(6,1000)PROMPT
1000  FORMAT(1X,A,' > ',$)
      READ(5,1001,ERR=20,END=99)ANS
1001  FORMAT(A1)
      IF(ANS.GE.97.AND.ANS.LE.122)ANS=ANS-32      !to upper case
      RETURN
99    ANS=ICHAR('Q')      !end-of-file
      RETURN
      END
