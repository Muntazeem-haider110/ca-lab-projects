.text
.globl leaf_example
leaf_example:

    li x10,5 # x10 = g
    li x11,6 # x11 = h
    li x12,7 # x12 = i
    li x13,8 # x13 = j
    li sp,0x200
    li x18,8
    li x19,9
    li x20,7

    addi sp,sp,-12
    sw x18,8(sp)
    sw x19,4(sp)
    sw x20,0(sp) # x20 = f



    add x18,x10,x11
    add x19,x12,x13
    sub x20,x18,x19
    addi x10,x20,0


    lw x20,0(sp) 
    lw x19,4(sp) 
    lw x18,8(sp) 

    addi x11,x10,0
    li x10,1
    ecall
    j exit

exit:
      j exit

    


