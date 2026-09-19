.text
.globl main

strcpy:
    addi sp, sp, -8        # adjust stack for 1 more item
    sw   x19, 0(sp)        # save x19

    add  x19, x0, x0       # i = 0

loop_copy:
    add  x5, x11, x19      # x5 = address of y[i]
    lbu  x6, 0(x5)         # x6 = y[i] (load byte unsigned)

    add  x7, x10, x19      # x7 = address of x[i]
    sb   x6, 0(x7)         # x[i] = y[i] (store byte)

    beq  x6, x0, end       # if y[i] == 0, go to end
    addi x19, x19, 1       # i = i + 1
    j loop_copy           # go to loop_copy

end:
    lw   x19, 0(sp)        # restore saved x19
    addi sp, sp, 8         # restore stack pointer
    j exit                 # go to exit

exit:
    j exit                 # Infinite loop to halt the program