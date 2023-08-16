;Hello World Program
SECTION .data
msg db 'Hello World',0xa	;The string being stored in msg 
len equ $ - msg 		;Length of the string being stored in len

SECTION .text
global  _start

_start:
    mov edx,len			;Moves len into edx register
    mov ecx,msg			;Moves msg into ecx register
    mov ebx,1			;
    mov eax,4			;system call sys_write (looks at the char* at ebx and its length at edx)
    int 0x80			;calls kernel

    mov eax,1			;system call sys_exit (exits the program)
    int 0x80			;calls kernel
