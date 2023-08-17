#PURPOSE:                                       This program finds the minimum value of a array

#VARIABLES:
#
#   %edi                                        Holds the counter for the loop
#   %eax                                        Holds the current value for the loop
#   %ebx                                        Holds the smallest value of the array
#   data_items                                  Array of numbers (long integers)
#
#
.section .data

data_items:
 .long 12,43,63,2,35,73,754,2341,54,76

 .section .text

 .globl _start
_start:

 movl $0, %edi                                  #Sets the counter to 0
 movl data_items(,%edi,4), %eax                 #Moves the first item of the list into %eax
 movl %eax, %ebx                                #Sets the first item of the list to be the smallest one

 start_loop:
  incl %edi                                     #Used to select the next item on the list
  cmpl $10, %edi                                #Used to check if the counter is outside the array
  je loop_exit                                  #If it is, breaks out of the loop

  
  movl data_items(,%edi,4), %eax                #Moves next item into eax
  cmpl %eax, %ebx                               #Used to check to see if the current number is the smallest so far
  jl start_loop                                 #If ebx is smaller, goes back to beggining of the loop
  movl %eax, %ebx                               #Else, moves the newest smallest number to ebx                           
  jmp start_loop                                #And jumps back to beggining
  
 loop_exit:
  movl $1, %eax                                 #Smallest number is already in ebx, returns ebx as exit status call
  int $0x80                                     #Run echo $? to display number


 