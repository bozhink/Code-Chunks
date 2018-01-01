REM ---------------------------------------------------
REM
REM FOR.BAS
REM
REM USE OF THE FOR STATEMENT
REM
REM AUTHOR: ANDRE MURTA
REM DATE: 20/12/1992
REM 
REM DEVELOPED AT CENTRO DE ENSINO SUPERIOR DO PARA
REM
REM ---------------------------------------------------
DIM vet(10,10)
CLS
FOR vet(1,1)=1 TO 5
	PRINT "<";vet(1,1);">"
NEXT
C = INKEY
CLS
FOR vet(2,2)=1000 TO 1005
	PRINT "<";vet(2,2);">"
NEXT
REM THE LINE BELOW IS A LABEL
10
    C = INKEY
    CLS
    PRINT "vet(1,1): ";vet(1,1) : PRINT "vet(2,2): ";vet(2,2)
    vet(1,1) = 0
    vet(2,2) = 0
    PRINT "vet(1,1): ";vet(1,1)
    PRINT "vet(2,2): ";vet(2,2)
    FOR x=1 TO 5
        FOR y=1 TO 5
            vet(x,y) = x+y
            PRINT "x: ";x;" y: ";y;" x+y: ";vet(x,y)
        NEXT
        C = INKEY
    NEXT
    resp="s"
    INPUT "Entre o valor de X: ";x
    INPUT "Entre o valor de Y: ";y
    PRINT "Valor eh: ";vet(x,y)
    REM **********************************************************************
    REM this is due to an error in the compiler used to create the interpreter
    REM **********************************************************************
    INPUT "";$resp
    INPUT "Deseja continuar ? ";$resp
    IF (resp <> "n" && resp <> "N") THEN GOTO 10

REM ******************
REM termina o programa
REM ******************

END
