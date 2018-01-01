REM ---------------------------------------------------
REM
REM FOR2.BAS
REM
REM USE OF THE FOR STATEMENT, SECOND EXAMPLE
REM
REM AUTHOR: ANDRE MURTA
REM DATE: 20/12/1992
REM 
REM DEVELOPED AT CENTRO DE ENSINO SUPERIOR DO PARA
REM
REM ---------------------------------------------------
DIM vet(10,10)
FOR x=1 TO 2
	FOR y=1 TO 2
		vet(x,y) = x+y
		PRINT "X: ";x;" Y: ";y;" Value: ";vet(x,y)
	NEXT
NEXT
PRINT vet(1,1)
PRINT vet(2,1)
FOR x=1 to 2
	vet(x,1) = x+1000
NEXT
PRINT vet(1,1)
PRINT vet(2,1)
