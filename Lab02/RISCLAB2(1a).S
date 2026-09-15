.text
.globl main
main:

# Assign values to variables
li x19, 0
li x20, 7        # g = 7
li x21, 3        # h = 3
li x22, 5        # i = 5
li x23, 5        # j = 5

# f is in x19, will be computed


bne x22, x23, Else   # if i != j, jump to Else
add x19, x20, x21    # f = g + h
beq x0, x0, Exit     # unconditional jump

Else: sub x19, x20, x21  # f = g - h

Exit:  # continue program
    j Exit

