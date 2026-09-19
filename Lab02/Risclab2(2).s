.text
.globl main
main:
    li x1, 0x01        # base address of save array
    li x2, 0x02
    li x3, 0x03
    li x4, 0x04        # i = 2
    li x20, 0x05       # k = 5

    li x22, 0x12       # b
    li x23, 0x13       # c

    bne x20, x4, else2 # if k != i → else2
    add x21, x22, x23  # a = b + c
    sw x21, 0(x1)      # store a
    beq x0, x0, Exit   # unconditional jump

else2:
    bne x20, x3, else3 # if k != l → else3
    sub x21, x22, x23  # a = b - c
    sw x21, 0(x1)
    beq x0, x0, Exit

else3:
    bne x20, x3, else4 # if k != l → else4
    srai x21, x22, 1   # a = b / 2
    sw x21, 0(x1)
    beq x0, x0, Exit

else4:
    bne x20, x4, Exit  # if k != m → Exit
    slli x21, x22, 1   # a = b * 2
    sw x21, 0(x1)
    beq x0, x0, Exit

default:
    li x21, 0x00       # a = 0
    sw x21, 0(x1)
    beq x0, x0, Exit

Exit:
    j Exit             # infinite loop / halt

