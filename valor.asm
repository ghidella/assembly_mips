.data # Seção destinada para declarar e alocar memória para variáveis globais
      # e constantes que serão utilizadas no programa.
	.align 2
	str1: .asciiz "Digite o valor de k: "
	strf: .asciiz "F("
	strg: .asciiz "G("
	str2: .asciiz ")"
	str3: .asciiz " = "
.text
	# Carrega registradores
	la $a0, str1
	li $v0, 4
	syscall
	
	#lendo o inteiro
	li $v0, 5
	syscall
	add $a1, $zero, $v0
	add $a0, $zero, $v0
	
	#Calculando F(k) e G(k)
	jal valor
	
	#Exibindo F(i)
	la $a0, strf #Carrega o endereço da string strf para o registrador $a0
	li $v0, 4    #Imprime string
 	syscall      #Chamada no sistema
 	#A sequência de instruções abaixo segue o mesmo padrão
	add $a0, $zero, $a1
	li $v0, 1
	syscall
	la $a0, str2
	li $v0, 4
	syscall
	la $a0, str3
	li $v0, 4
	syscall
	add $a0, $zero, $s6
	li $v0, 1
	syscall
	
	#Exibindo G(i)
	la $a0, strg
	li $v0, 4
	syscall
	add $a0, $zero, $a1
	li $v0, 1
	syscall
	la $a0, str2
	li $v0, 4
	syscall
	la $a0, str3
	li $v0, 4
	syscall
	add $a0, $zero, $s7
	li $v0, 1
	syscall
	#return 0
	li $v0, 10
	syscall
	# Função valor
	valor:
		# Pop
		# salva os valores na pilha
		sw $ra, 0($sp) #Store word, salva o valor do registrador $ra
		sw $a0, -4($sp)#Salva o valor do registrador $a0 no endereço de memória $sp - 4
		#As instruções para a pilha seguem o mesmo padrão
		sw $a1, -8($sp) 
		sw $s0,-16($sp)
		sw $s1,-20($sp)
		sw $t0,-24($sp)
		addi $sp, $sp, -28
		add $s0, $zero, $a0 #copiando o argumento
		# Verifica os valores de entrada para os casos 1 e 2
		beq $s0, 1, caso_k_igual_1
		beq $s0, 2, caso_k_igual_2
		addi $s1, $zero, 3 # k = 3
		#Estado inicial
		addi $t0, $zero, 2 #F(k - 2)
		addi $t1, $zero, 1 #F(k - 1)
		addi $t2, $zero, 1 #G(k - 2)
		addi $t3, $zero, 2 #G(k - 1)
		loop:
			#Calculando F(k)
			mul $a1, $t1, 2 #a1 = t1 * 2
			add $a1, $a1, $t2 #a1 = a1 + t2
			#Calculando G(k)
			mul $a2, $t0, 3 #a2 = t0 * 3
			add $a2, $a2, $t3 #a2 = a2 * t3
			#O valor de F(k) fica em $a1
			#O valor de G(k) fica em $a2
			add $t0, $zero, $t1 #t0 = 0 + t1
			add $t1, $zero, $a1 #t1 = 0 + a1
			add $t2, $zero, $t3 #t2 = 0 + t3
			add $t3, $zero, $a2 #t3 = 0 + a2
			addi $s1, $s1, 1 # iterador++
			ble $s1, $s0, loop # loop enquanto $s1(iterador) <= x
			add $s6, $zero, $a1 #s6 = 0 + a1
			add $s7, $zero, $a2 #s7 = 0 + a2
			j saida #salto incondicional (jump) para saida
		# Trata os casos k = 1 e k = 2, associando os devidos valores a Fx e Gk
		caso_k_igual_1:
			addi $s6, $zero, 2 #s6 = 0 + 2
			addi $s7, $zero, 1 #s7 = 0 + 1
			j saida #salto incondicional (jump) para saida
		caso_k_igual_2:
			addi $s6, $zero, 1 #s6 = 0 + 1
			addi $s7, $zero, 2 #s7 = 0 + 2
		saida:
		# Pop
		# Restaura os registradores salvos na pilha
		addi $sp, $sp, 28 #adiciona 28 ao valor do registrador $sp, que é o ponteiro da pilha.
		lw $ra, 0($sp) #Carrega o valor do endereço de memória apontado por $sp + 0 para o registrador $ra
		#os seguintes seguem o mesmo padrão
		lw $a0, -4($sp)
		lw $a1, -8($sp)
		lw $s0,-12($sp)
		lw $s1,-16($sp)
		lw $t0,-20($sp)
		#voltando para onde a funcao foi chamada
		jr $ra #Faz o retorno da função, fazendo um salto incondicional para o endereço contido no registrador $ra
