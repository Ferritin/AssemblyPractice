#PURPOSE:                                       This program finds the minimum value of a array
#
#METHOD:                                        This is done by setting "0" to be the "stop"
#                                               value for the loop
#
#VARIABLES:
#
#   %edi                                        Holds the length count for data_items
#   %ecx                                        Holds the counter for the minimum loop
#   %eax                                        Holds the current value for both loops
#   %ebx                                        Holds the smallest value of the array
#   data_items                                  Array of numbers (long integers)
#
#
.section .data

data_items:
    .long 12,43,63,34,35,73,754,2341,54,2,0

.section .text

.globl _start

_start:

    #Start of the counter loop
    movl $0, %edi              

    start_counter_loop:
        movl data_items(,%edi,4), %eax
        cmpl $0, %eax
        je exit_counter_loop
        incl %edi
        jmp start_counter_loop
    exit_counter_loop:

    #Starts the minimum loop

    movl $0, %ecx                                     #Used to reset the register to be used as a counter for the loop
    movl data_items(,%ecx,4), %eax                    #Moves the first item of the list into %eax
    movl %eax, %ebx                                   #Sets the first item of the list to be the smallest one

    start_minimum_loop:
        incl %ecx                                     #Used to select the next item on the list
        cmpl %edi, %ecx                               #Used to check if the counter is outside the array
        je loop_minimum_exit                          #If it is, breaks out of the loop

        movl data_items(,%ecx,4), %eax                #Moves next item into eax
        cmpl %eax, %ebx                               #Used to check to see if the current number is the smallest so far
        jl start_minimum_loop                         #If ebx is smaller, goes back to beggining of the loop
        movl %eax, %ebx                               #Else, moves the newest smallest number to ebx
        jmp start_minimum_loop                        #And jumps back to beggining
loop_minimum_exit:

movl $1, %eax                                         #Smallest number is already in ebx, number is returned as a exit status
int $0x80







