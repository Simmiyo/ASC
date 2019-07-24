#elementele distincte ale unui vector
.data
v:.word 3,5,8,7,8,9,7,7,1,9
n:.word 10
u:.space 40
m:.space 4

.text
main:
lw $t0,n
add $t0,$t0,$t0
add $t0,$t0,$t0
li $t1,0
li $t2,0
li $t3,0

for:
beq $t1,$t0,iesire
lw $t4,v($t1)

for0:
beq $t2,$t3,adaug
lw $t5,u($t2)
beq $t4,$t5,dublura
addi $t2,$t2,4
j for0

dublura:
addi $t1,$t1,4
li $t2,0
j for

adaug:
sw $t4,u($t3)
addi $t3,$t3,4
addi $t1,$t1,4
li $t2,0
j for

iesire:
li $t2,4
div $t3,$t2
mflo $t3
sw $t3,m
li $v0,10
syscall
