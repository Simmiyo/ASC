#cautare element in vector
.data
v:.word 1, 2, 3, 4, 5, 8
n:.word 6
el:.space 4

.text
main:
li $t4,0
li $v0,5
syscall
move $t0,$v0
li $t1,0
lw $t2,n
add $t2,$t2,$t2
add $t2,$t2,$t2

for:
beq $t1,$t2,iesire
lw $t3,v($t1)
beq $t0,$t3,gasit
addi $t1,$t1,4
j for

gasit:
li $t4,1

iesire:
move $a0,$t4
li $v0,1
syscall
li $v0,10
syscall
