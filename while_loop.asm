.data
	meeting: .asciiz "Hello, please input your number: "
	space: .byte ' '
.text
	move $t0, $zero #$t0 will be the iterator i
	
	li $v0, 4 #string print
	la $a0, meeting
	syscall

	li $v0, 5 #integer input
	syscall
	
	move $t1, $v0 #input moved to t0

	while:
		bgt $t0, $t1, out
		
		#imprime o valor de i
		li $v0, 1
		move $a0, $t0
		syscall
		
		#print blank space
		li $v0, 4
		la $a0, space
		syscall
		
		#iterate
		addi $t0, $t0, 1
		j while
	out:
		