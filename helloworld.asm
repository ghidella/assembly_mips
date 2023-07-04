.data
	# (area for data in main memory)
	msg: .asciiz "Olá, mundo!" #Message to be printed

.text
	# (area for program instructions)
	
	li $v0, 4 #String print instruction
	la $a0, msg #shows the message address
	syscall #print
	