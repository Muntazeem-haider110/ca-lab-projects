.text
.globl main
main:
    li x1, 1           # case1 selector
    li x2, 2           # case2 selector
    li x3, 3           # case3 selector
    li x4, 4           # case4 selector

    li x22, 2          # x (switch variable)
    li x23, 5          # b = 5
    li x24, 3          # c = 3
    li x25, 0          # a = 0

    beq x22, x1, case1
    beq x22, x2, case2

    beq x22, x3, case3
    beq x22, x4, case4
    j default

case1:
    add x25, x23, x24  # a = b + c
    j end

case2:
    sub x25, x23, x24  # a = b - c
    j end

case3:
    mul x25, x23, x24  # a = b * c
    j end

case4:
    div x25, x23, x24  # a = b / c
    j end

default:
    li x25, 0          # a = 0
    j end

end:
    j end              # halt
