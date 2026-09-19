.text
.globl main
main:
    addi sp, sp, -8        # allocate stack space

    # v[0] = 10
    li t0, 10              # v0
    sw t0, 0(sp)

    # v[1] = 15
    li t1, 15              # v1
    sw t1, 4(sp)

    jal ra, do_swap        # call swap function

    addi sp, sp, 8         # reset stack pointer
    j exit

do_swap:
    lw t0, 0(sp)           # load v[0]
    lw t1, 4(sp)           # load v[1]

    addi t2, t0, 0         # temp = v[0]
    addi t0, t1, 0         # v[0] = v[1]
    addi t1, t2, 0         # v[1] = temp

    sw t0, 0(sp)           # store v[0]
    sw t1, 4(sp)           # store v[1]

    jalr x0, 0(ra)         # return to caller

exit:
    j exit          # infinite loop / halt

    