.data
D:  .word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0   # scratch array, 16 words (enough for a=3, b=4)

.text
.globl main
main:
    li   x5, 3               # a = 3
    li   x6, 4               # b = 4
    la   x10, D              # x10 = base address of D

    li   x7, 0               # i = 0
Loop1:
    bge  x7, x5, Exitloop1    # if (i >= a) exit outer loop
    li   x29, 0               # j = 0
    mv   x28, x10             # ptr = address of D[4*0] = base of D
Loop2:
    bge  x29, x6, Exitloop2   # if (j >= b) exit inner loop
    add  x30, x7, x29         # temp = i + j
    sw   x30, 0(x28)          # D[4*j] = i + j
    addi x28, x28, 16         # ptr += 16 (index step of 4 * 4 bytes/word)
    addi x29, x29, 1          # j++
    j   Loop2
Exitloop2:
    addi x7, x7, 1            # i++
    j    Loop1
Exitloop1:
    j end

end:
    j end