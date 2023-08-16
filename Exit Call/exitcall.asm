; Program: exit
; executes the exit system call
; no input
; output: only exit status
  segment .text
  global _start
_start:
  mov eax,1 ;1 is the exit syscall number
  mov ebx,5 ;status value to return
  int 0x80  ;execute a system call
  
