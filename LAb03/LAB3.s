.text
.globl main

main:
    addi x10, x0, 12      # first value
    addi x11, x0, 14      # second value
    jal x1, sum           # call sum routine
    add x10, x11, x0         # move result to x10
    li x10, 1             # syscall: print integer
    ecall
    j exit

sum:
    add x11, x10, x11     # x11 = x10 + x11
    jalr x0, 0(x1)        # return to caller

exit:
    j exit                # stop
