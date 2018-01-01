REM ---------------------------------------------------
REM
REM USER_FUNC.BAS
REM
REM USER DEFINED FUNCTIONS. CREATION AND USE
REM
REM AUTHOR: ANDRE MURTA
REM DATE: 20/12/1992
REM 
REM DEVELOPED AT CENTRO DE ENSINO SUPERIOR DO PARA
REM
REM ---------------------------------------------------
dot = "..."
DEFFN teste(par1,par2) = par1 + par2 + dot
x = "test"
y = 2.5
PRINT teste("Andre"," Murta")
PRINT "Ok?"
PRINT x;" - ";y*2
