segment .data

	name db 'Karla', 0xa
	name2 db 'Marko'
	lenName equ $ - name 
	lenName2 equ $ - name2 

segment .text

	global _start

_start:
	;Printing out name
	mov rdx, lenName
	mov rcx, name
	mov rbx, 1
	mov rax, 4
	int 0x80

	;Change name to Marko
	mov [name], dword  'Mark'
	mov [name+lenName2], byte 'o'

	;printing out name again
	mov rdx, lenName
	mov rcx, name
	mov rbx, 1
	mov rax, 4
	int 0x80

	;Exiting out
	mov rax, 1
	int 0x80
