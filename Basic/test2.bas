REM ---------------------------------------------------
REM
REM TEST2.BAS
REM
REM MORE GENERIC TESTS INCLUDING USER DEFINED FUNCTIONS
REM
REM AUTHOR: ANDRE MURTA
REM DATE: 20/12/1992
REM 
REM DEVELOPED AT CENTRO DE ENSINO SUPERIOR DO PARA
REM
REM ---------------------------------------------------
DEFFN teste1(p1,p2,p3,p4) = p1+p2+p3+p4
DEFFN teste2(x,y) = x*y
CLS
PRINT stack
DIM vet(5,5)
a = "Andre Murta"
PRINT len(a)
b = INKEY
PRINT b
c = "Andre Murta" : PRINT "<";left(c, 5);">"
PRINT "<";mid(c, 5, 5);">"
PRINT "<";right(c,5);">"
PRINT pi
PRINT "<";str(123.45) + " str concatenation";">"
PRINT sgn(2-4)
PRINT "<";ucase("andre");">"
PRINT "<";lcase("MURTA");">"
PRINT "[";time;"]"
PRINT "[";date;"]"
REM PRINT timer
REM RANDOMIZE timer
REM PRINT rnd
DATA 10.55, "Andre", 30.66, "Murta",123.45
READ a,b,c,d,vet(1,1)
PRINT "[";a;"] - [";b;"] - [";c;"] - [";d;"] - [";vet(1,1);"]"
PRINT "<";a;">"
PRINT "<";b;">"
PRINT "<";c;">"
PRINT "<";d;">"
PRINT "<";vet(1,1);">"
PRINT etype("str"+"abc")
PRINT etype(2+2)
FILES "*.*"
PRINT stack
PRINT teste1(1,1,1,1) + teste2(2,2)
PRINT teste1("A","B","C","D")
END
