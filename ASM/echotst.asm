.386
.model flat,stdcall
;option casemap :none
.data
  txt db "Hello, World!",0
.code
start:
  echo txt
end start
