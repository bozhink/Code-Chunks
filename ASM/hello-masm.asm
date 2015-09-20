.386
.model flat, stdcall
option casemap:none
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\kernel32.lib

.data
msg db "Hello, world!", 13,10
len equ $-msg

.data?
written dd ?

.code
start:
push -11
call SetStdHandle

push 0
push offset written
push len
push offset msg
push eax
call WriteFile

push 0
call ExitProcess
end start
