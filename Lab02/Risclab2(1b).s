.text
.globl main
main:
# Setup registers
li x22, 0            # i = 0
li x24, 5            # k = 5
li x25, 0x1000       # base address of save array

# Example array in memory (conceptual layout):
# Address   Value
# 0x1000    5   (save[0])
# 0x1004    5   (save[1])
# 0x1008    7   (save[2])
# 0x100C    9   (save[3])

Loop:  slli x10, x22, 2       # x10 = i * 4
       add  x10, x10, x25     # x10 = address of save[i]
       ld   x9, 0(x10)        # x9 = save[i]
       bne  x9, x24, Exit     # exit if save[i] != k
       addi x22, x22, 1       # i = i + 1
       beq  x0, x0, Loop      # unconditional jump back to Loop
Exit:
       j Exit
