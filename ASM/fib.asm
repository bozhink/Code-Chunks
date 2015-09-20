.386
.model flat, stdcall
option casemap:none

.code
fib:
    mov edx, [esp+8]
    cmp edx, 0
    ja @f
    mov eax, 0
    ret
    
    @@:
    cmp edx, 2
    ja @f
    mov eax, 1
    ret
    
    @@:
    push ebx
    mov ebx, 1
    mov ecx, 1
    
    @@:
       lea eax, [ebx+ecx]
       cmp edx, 3
       jbe @f
       mov ebx, ecx
       mov ecx, eax
       dec edx
    jmp @b
    
    @@:
    pop ebx
    ret
end fib
