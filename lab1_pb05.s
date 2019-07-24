#sortare vector
.data
v:.word 9,7,8,6,3,5
n:.word 5

.text
main:
lw $t0,n
add $t0,$t0,$t0
add $t0,$t0,$t0
li $t1,4
do:
li $t2,0
for:
beq $t0,$t1,while
lw $t3,v($t1)
sub $t4,$t1,4
lw $t5,v($t4)
bgt $t5,$t3,interschimbare
addi $t1,$t1,4
j for

while:
sub $t0,$t0,4
beq $t2,$zero,iesire
j do

interschimbare:
sw $t3,v($t4)
sw $t5,v($t1)
li $t2,1
addi $t1,$t1,4
j for

iesire:
li $v0,10
syscall
