.text
	li $t0, 32
	li $t1, 5
	
	div $t0, $t1
	
	
	#integer part in $s0
	mflo $s0
	
	#remainder in $s1
	mfhi $s1
	