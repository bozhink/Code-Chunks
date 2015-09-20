.386
.model flat,stdcall
option casemap:none

.data
  @ArgCount MACRO parmlist:VARARG
           LOCAL count
           count = 0
           FOR parm, <parmlist>
               count = count + 1               ; Count the parameters
           ENDM
           EXITM count
       ENDM

.code
start:
        mov eax, 100
        .while eax > 0
          sub eax, 1
        .endw
end start