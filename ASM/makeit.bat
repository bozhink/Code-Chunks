@echo off
if exist testdll.obj del testdll.obj
if exist testdll.dll del testdll.dll
\masm32\bin\ml /c /coff testdll.asm
\masm32\bin\Link /SUBSYSTEM:WINDOWS /DLL /DEF:testdll.def testdll.obj 
del testdll.obj
del testdll.exp
dir testdll.*
pause
