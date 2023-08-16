section .data

msg:	

db	"Hello CS 233!", 0x0a,0

section .text
global main
extern printf

main:
	push rbp
	mov rbp, rsp
	lea rdi,[msg]
	xor eax, eax
	call printf
	xor eax, eax
	pop rbp
	ret
