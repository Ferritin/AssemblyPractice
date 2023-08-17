#PURPOSE:  This program find the maximum number of a
#          set of data items
#
#VARIABLES: The registers have the following uses:
#
# %edi  -   Holds the index of the data item being examined
# %ebx  -   Largest data item found
# %eax  -   Current data item
#
# The following memory locations are used:
#
# data_items - contains the item data. A 0 is used
#              to terminate the data

.section .data

data_items:                         # These are the data items 
 .long 3,63,12,53,245,54,76,95,12,86,23,42,0

 .section .text

 .globl _start
_start:

 movl $0, %edi                       # move 0 into the index register 
 movl data_items(,%edi,4), %eax      # loads current data item (%eax) with the first byte of data in data_items.  
 movl %eax, %ebx                     # since the first item is the biggest one, load it into largest data item.


start_loop:                         # starts loop
 cmpl $0, %eax                      # compares the number 0 and the value at current data item.
 je loop_exit
 incl %edi                          # increments the value at %edi by one.
 movl data_items(,%edi,4), %eax     # loads current data value with the next byte of data in data_items.
 cmpl %ebx, %eax                    # compare values
 jle start_loop                     # jump to loop beggining if the new number isnt bigger

 movl %eax, %ebx                    # move the value as the largest
 jmp start_loop                     # jump to loop beggining

loop_exit:
# We will use an exit system call, since %ebx already has the largest number, we will simply leave it there
 movl $1, %eax                      # 1 is the exit() syscall
 int $0x80                          # Since the largest allowed exit status number is 255, it will 
                                    # reset the number back to 0 and output number - 256.

 