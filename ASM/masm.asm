    include \masm32\include\masm32rt.inc
    .code
    
start:
    call main
    inkey
    exit
    
main proc

    LOCAL th:DWORD

    .data
      MyString db "Hello, World!",0
      gh db 1

    .code
    print ADDR MyString,13,10
    print ADDR gh,13,10
    mov eax, 2
    mov th, eax
    print ADDR th,0,0
    ret
main endp

end start
