.data
	msg: .asciiz "Input a number: "
	even: .asciiz "The number is even. "
	odd: .asciiz "The number is odd."
.text
	#printing message for the user
	li $v0, 4
	la $a0, msg
	syscall
	
	#reading number
	li $v0, 5
	syscall
	
	li $t0, 2
	div $v0, $t0
	
	mfhi $t1 #rest of the division = 2
	
	beq $t1, $zero, printEven
	li $v0, 4
	la $a0, odd
	syscall
	
	li $v0, 10
	syscall
	
	printEven:
		li $v0, 4
		la $a0, even
		syscall