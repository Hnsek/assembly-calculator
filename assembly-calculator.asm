.data

x: .asciiz "Insira o primeiro valor:" # armazena a string do primeiro valor
y: .asciiz "Insira o segunda valor:" # armazena a string do segundo valor
resultado: .asciiz "Resultado:"  # armazena a string do resultado da operacao
menu: .asciiz "Insira uma opcao(1-soma, 2-subtracao, 3-multiplicacao):" # armazena a string de opcoes
.text

##################################

.macro soma # funcao soma
la $a0,x # armazena x em $a0 
li $v0,4 # chamada do sistema para mostrar a string contida em $a0
syscall
li $v0,5 # le um inteiro
syscall
move $t0,$v0 # move o inteiro inserido para $t0

la $a0,y # armazena y em $a0 
li $v0,4 # chamada do sistema para mostrar a string contida em $a0
syscall
li $v0,5 # le um inteiro
syscall
move $t1,$v0 # move o inteiro inserido para $t0
add $t2,$t0,$t1 # realiza a soma entre $t0 e $t1 e armazena em $t2
la $a0,resultado # armazena resultado em $a0
li $v0,4 # chamada do sistema para mostrar a string contida em $a0
syscall
move $a0,$t2 # carrega o resultado da soma ($t2) em $a0
li $v0,1 # imprime o resultado
syscall
li $v0,10 # chamada de sistema para encerrar o programa
syscall

.end_macro # encerramento da funcao soma

##################################

.macro subtracao # funcao subtracao
la $a0,x # armazena x em $a0 
li $v0,4 # chamada do sistema para mostrar a string contida em $a0
syscall
li $v0,5 # le um inteiro
syscall
move $t0,$v0 # move o inteiro inserido para $t0

la $a0,y # armazena y em $a0 
li $v0,4 # chamada do sistema para mostrar a string contida em $a0
syscall
li $v0,5 # le um inteiro
syscall
move $t1,$v0 # move o inteiro inserido para $t0

sub $t2,$t0,$t1 # realiza a subtracao entre $t0 e $t1 e armazena em $t2
la $a0,resultado # armazena resultado em $a0
li $v0,4 # chamada do sistema para mostrar a string contida em $a0
syscall
move $a0,$t2 # carrega o resultado da subtracao ($t2) em $a0
li $v0,1 # imprime o resultado
syscall
li $v0,10 # chamada de sistema para encerrar o programa
syscall

.end_macro # encerramento da funcao subtracao

##################################

.macro multiplicacao # funcao multiplicacao
la $a0,x # armazena x em $a0 
li $v0,4 # chamada do sistema para mostrar a string contida em $a0
syscall
li $v0,5 # le um inteiro
syscall
move $t0,$v0 # move o inteiro inserido para $t0

la $a0,y # armazena y em $a0 
li $v0,4 # chamada do sistema para mostrar a string contida em $a0
syscall
li $v0,5 # le um inteiro
syscall
move $t1,$v0 # move o inteiro inserido para $t0

mul $t2,$t0,$t1 # realiza a multiplicacao entre $t0 e $t1 e armazena em $t2
la $a0,resultado # armazena resultado em $a0
li $v0,4 # chamada do sistema para mostrar a string contida em $a0
syscall
move $a0,$t2 # carrega o resultado da multiplicacao ($t2) em $a0
li $v0,1 # imprime o resultado
syscall
li $v0,10 # chamada de sistema para encerrar o programa
syscall

.end_macro # encerramento da funcao multiplicacao

##################################

.globl main # macro principal

main:
la $a0,menu # armazena em $a0 a string contida em menu
li $v0,4 # chamada de sistema para mostrar a string contida em $a0
syscall # executa a chamada de sistema
li $v0,5 # le um inteiro
syscall # executa a chamada de sistema
move $t0,$v0 # move o inteiro inserido em $v0 para $t0

beq $t0,1,soma # se $t0 for igual a 1, pula para o label soma, se nao, segue o programa
beq $t0,2,subtracao # se $t0 for igual a 2, pula para o label subtracao
beq $t0,3,multiplicacao # se $t0 for igual a 3, pula para o label multiplicacao

soma:
soma # chama o macro (funcao) soma
li $v0,10 # chamada de sistema que encerra o programa
syscall # executa a chamada de sistema

subtracao:
subtracao # chama o macro (funcao) subtracao
li $v0,10 # chamada de sistema que encerra o programa
syscall # executa a chamada de sistema

multiplicacao:
multiplicacao # chama o macro (funcao) multiplicacao
li $v0,10 # chamada de sistema que encerra o programa
syscall # executa a chamada de sistema