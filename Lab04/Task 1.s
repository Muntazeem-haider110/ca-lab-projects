.text
.globl main

main:
    li x10, 1   # result = 1
    li x5, 1    # i = 1
    li x6, 5    # n = 5

for:
    bgt x5, x6, end_for  # if i > n, exit loop
    mul x10, x10, x5     # result *= i
    addi x5, x5, 1       # i += 1
    j for                # repeat loop

end_for:
    j end_for
    
     