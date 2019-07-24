#maximul a 3 numere

.data #atribuire in RAM
x:.space 4
y:.space 4
z:.word 9
#word contine 32 biti, i.e. 4 octeti
max:.space 4
#se rezerva pt max 4 octeti

.text
main:
la $a0,x
li $v0,5
syscall
la $a0,y
li $v0,5
syscall
lw $t0,x
lw $t1,y
blt $t0,$t1,et1
sw $t0,max
j et2

et1:
sw $t1,max

et2:
lw $t0,max
lw $t1,z
bgt $t0,$t1,iesire
sw $t1,max

iesire:
lw $a0,max
li $v0,1
syscall
li $v0,10
syscall


