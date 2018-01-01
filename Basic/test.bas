REM ---------------------------------------------------
REM
REM TEST.BAS
REM
REM GENERAL INTERPRETER TESTS
REM
REM AUTHOR: ANDRE MURTA
REM DATE: 20/12/1992
REM 
REM DEVELOPED AT CENTRO DE ENSINO SUPERIOR DO PARA
REM
REM ---------------------------------------------------
CLS
cont = 3
10 PRINT "TESTE"
   PRINT 1 && 1
   PRINT 4 > 2
   PRINT (8 + 8) * 6
   PRINT 4 ^ 3
   PRINT -6 + 6
   cont = cont - 1
   PRINT "have been here"
   PRINT "Andre" >= "Murta"
20 IF (cont = 0) THEN GOTO 30 ELSE GOTO 10
30 PRINT "Acabou"
PRINT "-----"
FOR i=0 TO 10 STEP 2
    PRINT "Teste "; i
NEXT
PRINT "-----"
FOR i=10 DOWNTO 0 STEP 2
    PRINT "Teste "; i
NEXT
PRINT "-----"
FOR i=1 TO 5
    PRINT "Teste "; i
NEXT
PRINT "-----"
cond = 5
WHILE (cond >= 0)
	PRINT "cond = "; cond
	cond = cond - 1
WEND
PRINT "-----"
PRINT 4.2 + 5.25
mystr = "This is a string"
PRINT "<";mystr;">"
INPUT "String: ";$strval
INPUT myval
PRINT "Entered values:"
PRINT "Number: [";myval;"]"
PRINT "String: [";strval;"]"
END
