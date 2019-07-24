#sortare 3 numere
.data
x:.space 4
y:.space 4
z:.space 4
spatiu:.byte 1

.text
main:
li $t0,32
sb $t0,spatiu
li $v0,5
syscall
sw $v0,x
li $v0,5
syscall
sw $v0,y
li $v0,5
syscall
sw $v0,z
lw $t0,x
lw $t1,y
ble $t0,$t1,et1
sw $t1,x
sw $t0,y

et1:
lw $t0,x
lw $t1,z
ble $t0,$t1,et2
sw $t1,x
sw $t0,z

et2:
lw $t0,y
lw $t1,z
ble $t0,$t1,iesire
sw $t1,y
sw $t0,z

iesire:
lw $a0,x
li $v0,1
syscall
la $a0,spatiu
li $v0,4
syscall
lw $a0,y
li $v0,1
syscall
la $a0,spatiu
li $v0,4
syscall
lw $a0,z
li $v0,1
syscall
li $v0,10
syscall
