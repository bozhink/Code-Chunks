REM ---------------------------------------------------
REM
REM DIRS.BAS
REM
REM USE OF THE DIRECTORY FUNCTIONS
REM
REM AUTHOR: ANDRE MURTA
REM DATE: 20/12/1992
REM 
REM DEVELOPED AT CENTRO DE ENSINO SUPERIOR DO PARA
REM
REM ---------------------------------------------------
r = mkdir(".\teste")
PRINT r

c = INKEY

r = chdir("teste")
PRINT r

r = chdir("..")
PRINT r

r = rmdir("teste")
PRINT r
