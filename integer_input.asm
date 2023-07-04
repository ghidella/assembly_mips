.data
	meeting: .asciiz "Hello, please input your age: "
	output: .asciiz "Your age is: "
.text
	li $v0, 4 #string print
	la $a0, meeting
	syscall
	
	li $v0, 5 #integer input
	syscall
	
	move $t0, $v0 #input moved to t0
	
	li $v0, 4 #string print
	la $a0, output
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall