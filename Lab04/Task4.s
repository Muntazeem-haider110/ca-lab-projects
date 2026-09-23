.text
.globl main

main:
    li x2, 0x4000        # base address of array
    li x5, 5             # length = 5

    # Initialize array [5,3,4,1,2] for debugging
    li t0, 5
    sw t0, 0(x2)
    li t0, 3
    sw t0, 4(x2)
    li t0, 4
    sw t0, 8(x2)
    li t0, 1
    sw t0, 12(x2)
    li t0, 2
    sw t0, 16(x2)

    li x3, 1             # i = 1 (start from 2nd element)

outer_loop:
    bge x3, x5, done     # if i >= len, exit

    slli t1, x3, 2       # offset = i*4
    add t2, x2, t1
    lw t3, 0(t2)         # key = array[i]

    addi x4, x3, -1      # j = i-1

inner_loop:
    blt x4, x0, insert   # if j < 0, insert key

    slli t4, x4, 2
    add t5, x2, t4
    lw t6, 0(t5)         # array[j]

    ble t6, t3, insert   # if array[j] <= key, insert

    sw t6, 4(t5)         # shift array[j] right
    addi x4, x4, -1
    j inner_loop

insert:
    slli t0, x4, 2
    add t1, x2, t0
    sw t3, 4(t1)         # array[j+1] = key

    addi x3, x3, 1       # i++
    j outer_loop

done:
    j done               # halt (result in memory)

