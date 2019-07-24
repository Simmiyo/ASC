#suma cifrelor unui numar
.data
s:.word 0

.text 
main:
li $v0,5
syscall
move $t0,$v0
li $t1,10

while:
beq $t0,$zero,iesire
div $t0,$t1
mflo $t0
mfhi $t2
lw $t3,s
add $t3,$t3,$t2
sw $t3,s
j while

iesire:
lw $a0,s
li $v0,1
syscall
li $v0,10
syscall
