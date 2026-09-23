.text
.globl main

main:
    li x3, 0          # i = 0
    li x5, 5          # len = 5
    li x2, 0x4000     # base address of array

outer_loop:
    bge x3, x5, exit  # if i >= len, exit
    li x4, 0          # reset j = 0

inner_loop:
    bge x4, x5, next_i   # if j >= len, go to next i
    slli x7, x4, 2       # offset = j*4
    add x8, x2, x7
    lw x12, 0(x8)        # array[j]

    slli x9, x3, 2       # offset = i*4
    add x10, x2, x9
    lw x13, 0(x10)       # array[i]

    blt x12, x13, swap   # if array[j] < array[i], swap

    addi x4, x4, 1       # j++
    j inner_loop

swap:
    mv x11, x12          # temp = array[j]
    sw x13, 0(x8)        # array[j] = array[i]
    sw x11, 0(x10)       # array[i] = temp
    addi x4, x4, 1       # j++
    j inner_loop

next_i:
    addi x3, x3, 1       # i++
    j outer_loop

exit:
    j exit               # halt







