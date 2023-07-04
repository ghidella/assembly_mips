.data
	age: .word 56 #int value in RAM

.text
	li $v0, 1
	lw $a0, age 
	syscall 