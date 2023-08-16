
segment .data
	format db "%s",0x0a,0
segment .text
global main
extern printf
main:
	push rbp ;prepare stack frame for main
	mov rbp,rsp
	sub rsp,16
	mov rcx,rsi ;move argv to rcx
	mov rsi,[rcx] ;get 1st argv string
start_loop:
	lea rdi,[format]
	mov [rsp],rcx ;save argv
	call printf
	mov rcx,[rsp] ;restore rsi
	add rcx,8 ;advance pointer in argv
	mov rsi,[rcx] ;get next argv string
	cmp rsi,0 ;necessary... mov doesnt test
	jnz start_loop ;end with the NULL pointer
end_loop:
	xor eax,eax
	leave
	ret
