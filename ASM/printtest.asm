.386
.model flat, stdcall
option casemap:none

include \masm32\include\masm32rt.inc

.data
mString db "Hello",0

.code
start:
    print ADDR mString,10,10
    exit
end start
    