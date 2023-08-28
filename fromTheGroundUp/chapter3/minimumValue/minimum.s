#PURPOSE:                                       This program finds the minimum value of a array
#
#METHOD:                                        This is done by checking if current address is the
#                                               same as the end address of the loop
#
#VARIABLES:
#
#   %ecx                                        Holds the counter for the minimum loop
#   %eax                                        Holds the current value for current loop
#   %ebx                                        Holds the smallest value of the array
#   data_items                                  Array of numbers (long integers)
#   data_items_end                              Pointer to end of the array
#
#
.section .data

data_items:
    .long 2,12,43,6
data_items_end:

.section .text

.globl _start

_start:

    #Starts the minimum loop

    movl $0, %ecx                                     #Used to reset the register to be used as a counter for the loop
    movl data_items(,%ecx,4), %ebx                    #Sets the first item of the list to be the smallest one

    start_minimum_loop:
        incl %ecx                                     
        leal data_items(,%ecx,4), %eax                #Loads address to next item in the list
        cmpl $data_items_end , %eax                   #Used to check if the counter is outside the array
        je loop_minimum_exit                          #If it is, breaks out of the loop

        cmpl (%eax), %ebx                             #Used to check to see if the current number is the smallest so far
        jl start_minimum_loop                         #If ebx is smaller, goes back to beggining of the loop
        movl (%eax), %ebx                             #Else, moves the newest smallest number to ebx
        jmp start_minimum_loop                        #And jumps back to beggining
    loop_minimum_exit:

movl $1, %eax                                         #Smallest number is already in ebx, number is returned as a exit status
int $0x80







