.text
.globl main

main:
    li x10, 5              # x10 = n = 5
    li x2, 0x4000          # initialize stack pointer: sp = x2

    jal x1, ntri           # call ntri(n)

halt:
    jal x0, halt           # infinite loop; result remains in x10


ntri:
    addi x2, x2, -8        # allocate stack frame
    sw x10, 0(x2)          # save original n
    sw x1, 4(x2)           # save return address

    addi x5, x10, -1       # x5 = n - 1
    blt x0, x5, loop       # if n - 1 > 0, recurse
                           # equivalent to if n > 1

    # Base case: n <= 1
    li x10, 1              # return 1

    lw x1, 4(x2)           # restore return address
    addi x2, x2, 8         # release stack frame
    jalr x0, 0(x1)         # return


loop:
    addi x10, x10, -1      # argument = n - 1
    jal x1, ntri           # call ntri(n - 1)

    addi x6, x10, 0        # x6 = ntri(n - 1)

    lw x10, 0(x2)          # restore original n
    lw x1, 4(x2)           # restore return address
    addi x2, x2, 8         # release stack frame

    add x10, x10, x6       # result = n + ntri(n - 1)
    jalr x0, 0(x1)         # return




    
