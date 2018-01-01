REM ---------------------------------------------------
REM
REM VECTOR.BAS
REM
REM USE OF MULTIDIM ARRAYS
REM
REM AUTHOR: ANDRE MURTA
REM DATE: 20/12/1992
REM 
REM DEVELOPED AT CENTRO DE ENSINO SUPERIOR DO PARA
REM
REM ---------------------------------------------------
DIM vet(10,10)
DIM vet2(10,10,5)
LET b = 10
LET c = 20
LET d = 30
vet(1,3) = "Test"
vet(1,1) = 10
vet(1,2) = 32.4
REM replaces the old value
vet(1,3) = "Murta"
REM DURING TEST FASE, THE LINE BELOW WAS USED TO GENERATE
REM AN ARRAY DIMENSION ERROR...
REM vet(11,1) = "Ups!!!"
LET vet2(4,3,1) = 20
PRINT "<";vet(1,3);">"
PRINT "<";vet(1,2);">"
PRINT "<";vet(1,1);">"
PRINT "<";vet2(4,3,1);">"
REM PRINT "<";vet(11,1);">"
PRINT b,c,d
END
