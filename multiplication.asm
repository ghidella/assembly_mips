.text
	li $t0, 12
	addi $t1, $zero, 10
	
	#$s0 will have the result of the multiplication
	mul $s0, $t0, $t1
	
	li $v0, 1
	move $a0, $s0
	syscall