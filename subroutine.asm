.data 
	msgUsr: .asciiz "Input the positive number: "
	msgEven: .asciiz "Even"
	msgOdd: .asciiz "Odd"
.text
	la $a0, msgUsr
	jal printString
	jal readInteger
	
	move $a0, $v0
	jal isOdd
	beq $v0, $zero, printEven
	la $a0, msgOdd
	jal printString
	jal finishProgram
	
	
	printEven:
		la $a0, msgEven
		jal printString
		jal finishProgram
		
	#function that verify if the argument $a0 is odd
	#return 1 if it's odd or 0 if even
	isOdd:
		li $t0, 2
		div $a0, $t0
		
		mfhi $v0
		jr $ra
		
	#finish program
	finishProgram:
		li, $v0, 10
		syscall
	
	#function that receive a String in $a0 and print it
	printString:
		li $v0, 4
		syscall
		jr $ra
		
	#function that read an integer and return it in $v0
	readInteger:
	li, $v0, 5
	syscall
	jr $ra
	