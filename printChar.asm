.data
	character: .byte 'A' #character to be printed


.text
	li $v0, 4 #print char or string
	la $a0, character
	syscall 

	li $v0, 10 #finish program
	syscall