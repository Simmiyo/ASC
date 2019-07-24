#strset

.data
s: .space 500
ch: .space 3

.text
main:
la $a0,s
li $a1,500
li $v0,8
syscall

la $a0,ch
li $a1,3
li $v0,8
syscall

la $a0,s  #la="load adress", i.e. s e luat ca pointer
lb $a1,ch
sub $sp,$sp,4
sw $a1,0($sp)
sub $sp,$sp,4
sw $a0,0($sp)
jal strset

add $sp,$sp,12
move $a0,$v0
li $v0,4
syscall

li $v0,10
syscall

strset:

sub $sp,$sp,24
sw $ra,20($sp)
sw $fp,16($sp)

sw $s0,12($sp)
sw $s1,8($sp)
sw $s2,4($sp)
sw $s3,0($sp)

move $fp,$sp

lw $s0,24($fp)
lb $s1,28($fp)
li $s2,10

while:
lb $s3,($s0)
beq $s3,$s2,final
sb $s1,($s0)
addi $s0,$s0,1
j while

final:
lw $v0,24($fp)
addi $sp,$sp,20
lw $s3,0($fp)
lw $s2,4($fp)
lw $s1,8($fp)
lw $s0,12($fp)
lw $fp,16($fp)
lw $ra,($sp)
jr $ra
