section .data
	;These are simply strings and their length 

	userMsg db 'Please enter a number: '	
	lenUserMsg equ $-userMsg
	dispMsg db 'You have entered: '
	lenDispMsg equ $-dispMsg

section .bss
	
	num resb 12	;reserves 5 bytes for variable num

section .text
	global _start

_start:
	;Outputs userMsg

	mov eax, 4
	mov ebx, 1
	mov ecx, userMsg
	mov edx, lenUserMsg
	int 80h

	;Read and store user input into num
	mov eax, 3
	mov ebx, 2 
	mov ecx, num
	mov edx ,12	;5 bytes is the length of num
	int 80h

	;Output dispMsg
	
	mov eax, 4
	mov ebx, 1
	mov ecx, dispMsg
	mov edx, lenDispMsg
	int 80h
	
	;Output num
	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 12
	int 80h

	;Exit code
	mov eax, 1
	mov ebx, 0
	int 80h
