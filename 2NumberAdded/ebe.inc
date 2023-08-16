segment .data
a dq 174
b dq 4097
segment .text
global main
main:
    mov rax, [a]
    add rax  [b]
    xor eax, eax
    ret
    
