REM ---------------------------------------------------
REM
REM CHAIN.BAS
REM
REM AUTHOR: ANDRE MURTA
REM DATE: 20/12/1992
REM 
REM DEVELOPED AT CENTRO DE ENSINO SUPERIOR DO PARA
REM
REM ---------------------------------------------------
HIGHVIDEO
CLS
PRINT "chaining to another application"
PRINT " "
PRINT "Please, press any key"
c = INKEY

CHAIN "colors.bas"

CLS
PRINT "Back from chained application"
PRINT "Press any key to terminate"

C = INKEY
LOWVIDEO
CLS
END

