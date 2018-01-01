REM ---------------------------------------------------
REM
REM RAN_FILE.BAS
REM
REM USE OF RANDOMIC FILE ACCESS COMMANDS
REM
REM AUTHOR: ANDRE MURTA
REM DATE: 20/12/1992
REM 
REM DEVELOPED AT CENTRO DE ENSINO SUPERIOR DO PARA
REM
REM ---------------------------------------------------
rec2 = 10
DIM a(2,2)
CLS
PRINT "This program shows the MICRO BASIC"
PRINT "file handling routines"
OPEN "data.dat" FOR WRITING,RANDOM AS #1
FIELD #1, 5 AS rec1, 5 AS a(2,2), 8 AS rec3
rec1="11111" : a(2,2)="22222" : rec3="33333333" : PUT #1
rec1="44444" : a(2,2)="55555" : rec3="66666666" : PUT #1
rec1="77777" : a(2,2)="88888" : rec3="99999999" : PUT #1
rec1="00000" : a(2,2)="11111" : rec3="22222222" : PUT #1
CLOSE #1
PRINT "File saved..."
c = INKEY
OPEN "data.dat" FOR READING,RANDOM AS #1
REM *************************************************
REM We must redefine fields, cause we closed the file
REM *************************************************
FIELD #1, 5 AS rec1, 5 AS a(2,2), 8 AS rec3
PRINT " "
PRINT "Total records in the file: ";lof(1)
PRINT " "
PRINT "---"
FOR i=0 TO lof(1) - 1
	SEEK #1, i
	PRINT "Record: ";loc(1)
	GET #1
	PRINT "Field1: <";rec1;">"
	PRINT "Field2: <";a(2,2);">"
	PRINT "Field3: <";rec3;">"
	PRINT "---"
NEXT
CLOSE #1
