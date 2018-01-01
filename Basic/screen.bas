REM ---------------------------------------------------
REM
REM SCREEN.BAS
REM
REM SOME SCREEN COMMANDS
REM
REM AUTHOR: ANDRE MURTA
REM DATE: 20/12/1992
REM 
REM DEVELOPED AT CENTRO DE ENSINO SUPERIOR DO PARA
REM
REM ---------------------------------------------------
CLS
FLASH
COLOR 4,2,1
LOCATE 5,5
PRINT "Blink test"
COLOR 4,2
LOCATE 6,5
PRINT "This text should be static"
c = INKEY
COLOR 7,0
CLS
WINDOW 1,10,80,25
PRINT "New window size"
a = GETTEXT(1,10,15,10)
COLOR 7,4
PRINT a
