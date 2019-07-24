#diferenta dintre minimul si maximul elementelor unui vector
.data
v:.word 1 2 3
n:.word 3
sir1:.asciiz "nul"
sir2:.asciiz "nenul"

.text
main:
lw $a1,n
la $a0,v
sub $sp,$sp,4
sw $a1,0($sp)
sub $sp,$sp,4
sw $a0,0($sp)
jal diferenta
move $a0,$v0
li $v0,1
syscall
add $sp,$sp,8
beq $v0,$zero,nul
la $a0,sir2
li $v0,4
syscall

terminare:
li $v0,10
syscall

nul:
la $a0,sir1
li $v0,4
syscall
j terminare

diferenta:
sub $sp,$sp,16
sw $ra,12($sp)
sw $fp,8($sp)
sw $s0,4($sp)
sw $s1,0($sp)
move $fp,$sp
li $t1,0
lw $t3,20($fp)
beq $t1,$t3,vectornul
lw $t5,16($fp)
lw $s0,16($fp) #minim
lw $s1,16($fp) #maxim
add $t3,$t3,$t3
add $t3,$t3,$t3
addi $t1,$t1,4

for:
beq $t1,$t3,iesire
addi $t5,$t5,4
lw $t2,($t5)
blt $s1,$t2,newmaxim
bgt $s0,$t2,newminim
addi $t1,$t1,4
j for

newminim:
move $s1,$t2
addi $t1,$t1,4
j for

newmaxim:
move $s0,$t2
addi $t1,$t1,4
j for

iesire:
sub $v0,$s1,$s0
add $sp,$sp,12
lw $s1,0($fp)
lw $s0,4($fp)
lw $fp,8($fp)
lw $ra,0($sp)
sub $sp,$sp,4
jr $ra

vectornul:
li $v0,0
add $sp,$sp,12
lw $s1,0($fp)
lw $s0,4($fp)
lw $fp,8($fp)
lw $ra,0($sp)
sub $sp,$sp,4
jr $ra
