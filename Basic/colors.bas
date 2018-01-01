REM ---------------------------------------------------
REM
REM COLORS.BAS
REM
REM ILUSTRATE THE USE OF SYSTEM COLORS
REM
REM AUTHOR: ANDRE MURTA
REM DATE: 20/12/1992
REM 
REM DEVELOPED AT CENTRO DE ENSINO SUPERIOR DO PARA
REM
REM ---------------------------------------------------
CLS
PRINT " " : PRINT "Testing background colors"
FOR i=0 TO 7
        COLOR 15,i
        PRINT "Background color..."
NEXT
COLOR 7,8
PRINT " " : PRINT "Now testing characters colors"
c = INKEY
CLS
FOR i=0 TO 15
        COLOR i,8
        IF i=0 THEN COLOR i,7
        PRINT "Character color..."
NEXT
END

