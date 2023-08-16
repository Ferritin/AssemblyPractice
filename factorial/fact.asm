fact:

n	equ 	8
	push 	rbp
	mov 	rbp,rsp
	sub 	rsp,16
	cmp 	rdi,1
	jg 	greater
	mov 	eax,1
	leave
	ret

greater:
	mov 	[rsp+n], rdi
	dec 	rdi
	call 	fact
	mov 	rdi, [rsp+n]
	imul	rax,rdi		;Multiply fact(n-1)*n
	leave
	ret
