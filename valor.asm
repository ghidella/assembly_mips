.data
    .align 2
    str1:    .asciiz "Digite o valor de i: "
    strf:    .asciiz "F("
    strg:     .asciiz "G("
    str2:    .asciiz ")"
    str3:    .asciiz " = "

.text
    la        $a0, str1
    li        $v0, 4
    syscall
    
    #lendo o inteiro
    li        $v0, 5
    syscall
    
    add $a1, $zero, $v0
    add $a0, $zero, $v0
    
    #Calculando F(i) e G(i)
    jal valor

    #Exibindo F(i)
    la        $a0, strf
    li        $v0, 4
    syscall
    
    add        $a0, $zero, $a1
    li        $v0, 1
    syscall    
    
    la        $a0, str2
    li        $v0, 4
    syscall
    
    la        $a0, str3
    li        $v0, 4
    syscall
    
    add        $a0, $zero, $s6
    li        $v0, 1
    syscall

    
    #Exibindo G(i)
    la        $a0, strg
    li        $v0, 4
    syscall
    
    add        $a0, $zero, $a1
    li        $v0, 1
    syscall    
    
    la        $a0, str2
    li        $v0, 4
    syscall
    
    la        $a0, str3
    li        $v0, 4
    syscall
    
    add        $a0, $zero, $s7
    li        $v0, 1
    syscall

    #return 0
    li        $v0, 10
    syscall
    
    #############################################################
valor:
    #pop
    sw        $ra,  0($sp)
    sw        $a0, -4($sp)
    sw        $a1, -8($sp)
    sw        $s0,-16($sp)
    sw        $s1,-20($sp)
    sw        $t0,-24($sp)
    addi    $sp, $sp, -28
    
    add        $s0, $zero, $a0        #copiando o argumento

    beq $s0, 1, caso_x_igual_1
    beq $s0, 2, caso_x_igual_2    


    addi $s1, $zero, 3          # i = 3
    
    #Estado inicial
    addi $t0, $zero, 2      #F(i - 2)
    addi $t1,  $zero, 1       #F(i - 1)

    addi $t2, $zero, 1      #G(i - 2)
    addi $t3, $zero, 2      #G(i - 1)

    loop:
           #Calculando F(i)
           mul $a1, $t1, 2
           add $a1, $a1, $t2

           #Calculando G(i)
           mul $a2, $t0, 3
           add $a2, $a2, $t3

           #O valor de F(i) fica em $a1
           #O valor de G(i) fica em $a2

        add $t0, $zero, $t1
           add $t1, $zero, $a1

           add $t2, $zero, $t3
           add $t3, $zero, $a2

    addi $s1, $s1, 1        # iterador++
    ble  $s1, $s0, loop     # loop enquanto $s1(iterador) <= x
    
    add $s6, $zero, $a1
    add $s7, $zero, $a2
    
    j saida

    caso_x_igual_1:
        addi     $s6, $zero, 2
        addi    $s7, $zero, 1
    j saida
    
    caso_x_igual_2:    
        addi     $s6, $zero, 1
        addi    $s7, $zero, 2    
    
    saida:
    #pop
    addi    $sp, $sp, 28
    lw        $ra,  0($sp)
    lw        $a0, -4($sp)
    lw        $a1, -8($sp)
    lw        $s0,-12($sp)
    lw        $s1,-16($sp)
    lw        $t0,-20($sp)
        
    #voltando para onde a funcao foi chamada
    jr        $ra
