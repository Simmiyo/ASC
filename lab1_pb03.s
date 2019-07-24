#suma elementelor unui vector
.data
v:.word 3, 5, 2, 1, 1, 1 #vector
n:.word 6 #nr elem vector
s:.word 0 #suma

.text
main:
lw $t0,n
li $t1,0

for:
beq $t1,$t0,iesire
add $t2,$t1,$t1
add $t2,$t2,$t2
lw $t3,s
lw $t4,v($t2)
add $t3,$t3,$t4
sw $t3,s
addi $t1,$t1,1
j for

iesire:
lw $a0,s
li $v0,1
syscall
li $v0,10
syscall

#main:
#lw $t0,n
#add $t0,$t0,$t0
#add $t0,$t0,$t0

#for:
#beq $t1,$t0,iesire
#lw $t2,s
#lw $t3,v($t1)
#add $t2,$t2,$t3
#sw $t2,s
#addi $t1,$t1,4
#j for
