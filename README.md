.data

x: .asciiz "Insira o primeiro valor:" #armazina a string do primeiro valor
y: .asciiz "Insira o segunda valor:" #armazina a string do segundo valor
resultado: .asciiz "Resultado:"  #armazena a string do resultado da operação
menu: .asciiz "Insira uma opção(1-soma,3-multiplicação):" #armazena a string de opções
.text

.macro soma #função soma
la $a0,x #armazena x em $a0 
li $v0,4 #chamada do sistema para mostrar a string contida em $a0
syscall
li $v0,5 #lê um inteiro
syscall
move $t0,$v0 #move o inteiro inserido para $t0

la $a0,y #armazena y em $a0 
li $v0,4 #chamada do sistema para mostrar a string contida em $a0
syscall
li $v0,5 #lê um inteiro
syscall
move $t1,$v0 #move o inteiro inserido para $t0
add $t2,$t0,$t1 #realiza a soma entre $t0 e $t1 e armazena em $t2
la $a0,resultado #armazena resultado em $a0
li $v0,4 #chamada do sistema para mostrar a string contida em $a0
syscall
move $a0,$t2 #carega o resultado da soma ($t2) em $a0
li $v0,1 #imprime o resultado
syscall
li $v0,10 #chamada de sistema para encerrar o programa
syscall

.end_macro #encerramento da função soma

.macro multiplicacao #função multiplicacao
la $a0,x #armazena x em $a0 
li $v0,4 #chamada do sistema para mostrar a string contida em $a0
syscall
li $v0,5 #lê um inteiro
syscall
move $t0,$v0 #move o inteiro inserido para $t0

la $a0,y #armazena y em $a0 
li $v0,4 #chamada do sistema para mostrar a string contida em $a0
syscall
li $v0,5 #lê um inteiro
syscall
move $t1,$v0 #move o inteiro inserido para $t0

mul $t2,$t0,$t1 #realiza a multiplicação entre $t0 e $t1 e armazena em $t2
la $a0,resultado #armazena resultado em $a0
li $v0,4 #chamada do sistema para mostrar a string contida em $a0
syscall
move $a0,$t2 #carega o resultado da multiplicação ($t2) em $a0
li $v0,1 #imprime o resultado
syscall
li $v0,10 #chamada de sistema para encerrar o programa
syscall

.end_macro #encerramento da função multiplicacão

.globl main #macro principal

main:
la $a0,menu #armazena em $a0 a string contida em menu
li $v0,4 # chamada de sistema para mostrar a string contida em $a0
syscall #execcuta a chamada de sistema
li $v0,5 #lê um inteiro
syscall #execcuta a chamada de sistema
move $t0,$v0 #move o inteiro inserido em $v0 para $t0
beq $t0,1,soma # se $t0 for igual a 1,pula para o label soma,se não, segue o programa

beq $t0,3,multiplicacao # se $t0 for igual a 3,pula para o label multiplicacao
multiplicacao:
multiplicacao #chama o macro (função) multiplicacao
li $v0,10 #chamada de sistema que encerra o programa
syscall #execcuta a chamada de sistema

soma:
soma #chama o macro (função) soma
li $v0,10 #chamada de sistema que encerra o programa
syscall #execcuta a chamada de sistema




