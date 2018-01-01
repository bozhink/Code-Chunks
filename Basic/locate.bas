REM ---------------------------------------------------
REM
REM LOCATE.BAS
REM
REM USE OF SOME SCREEN COMMANDS TO POSIT. THE CURSOR
REM
REM AUTHOR: ANDRE MURTA
REM DATE: 20/12/1992
REM 
REM DEVELOPED AT CENTRO DE ENSINO SUPERIOR DO PARA
REM
REM ---------------------------------------------------
X=5
Y=5
LOCATE 1,5 : CLS LINE
LOCATE Y,X
C = INKEY
WHILE C <> 27
        IF C = 0 THEN C = INKEY
        IF C = 80 THEN GOSUB 1000
        IF C = 72 THEN GOSUB 1010
        IF C = 77 THEN GOSUB 1020
        IF C = 75 THEN GOSUB 1030
        C = INKEY
WEND
END
REM Pressed 'X'
1000
        LOCATE Y,X
        Y = Y + 1
        IF Y > 24 THEN Y = 24
        LOCATE Y,X
RETURN
REM Pressed 'E'
1010
        LOCATE Y,X
        Y = Y - 1
        IF Y < 2 THEN Y = 2
        LOCATE Y,X
RETURN
REM Pressed 'D'
1020
        LOCATE Y,X
        X = X + 1
        IF X > 80 THEN X = 80
        LOCATE Y,X
RETURN
REM Pressed 'S'
1030
        LOCATE Y,X
        X = X - 1
        IF X < 1 THEN X = 1
        LOCATE Y,X
RETURN
REM Update screen
2000
        LOCATE 1,1 : PRINT C
        LOCATE 1,5 : CLS LINE
        LOCATE 1,5 : PRINT "Line: ";Y;"  Col: ";X
        LOCATE Y,X
RETURN
