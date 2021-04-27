.data

x: .asciiz "Digite o primeiro valor: " # armazena a string do primeiro valor
y: .asciiz "Digite o segundo valor: " # armazena a string do segundo valor
resultado: .asciiz "Resultado: "  # armazena a string do resultado da operação
menu: .asciiz "Selecione uma opção (1-soma, 2-subtração, 3-multiplicação, 4-divisão): " # armazena a string de opções

##################################
.text

.macro soma # macro da soma
la $a0,x # armazena x em $a0 
li $v0,4 # chamada do sistema para mostrar a string contida em $a0
syscall
li $v0,5 # lê um inteiro
syscall
move $t0,$v0 # move o inteiro inserido para $t0

la $a0,y # armazena y em $a0 
li $v0,4 # chamada do sistema para mostrar a string contida em $a0
syscall
li $v0,5 # lê um inteiro
syscall
move $t1,$v0 # move o inteiro inserido para $t0

add $t2,$t0,$t1 # realiza a soma entre $t0 e $t1 e armazena em $t2
la $a0,resultado # armazena resultado em $a0
li $v0,4 # chamada do sistema para mostrar a string contida em $a0
syscall
move $a0,$t2 # carrega o resultado da soma ($t2) em $a0
li $v0,1 # exibe o resultado
syscall
li $v0,10 # chamada de sistema para encerrar o programa
syscall

.end_macro # encerramento da macro da soma

##################################

.macro subtracao # macro da subtração
la $a0,x # armazena x em $a0 
li $v0,4 # chamada do sistema para mostrar a string contida em $a0
syscall
li $v0,5 # lê um inteiro
syscall
move $t0,$v0 # move o inteiro inserido para $t0

la $a0,y # armazena y em $a0 
li $v0,4 # chamada do sistema para mostrar a string contida em $a0
syscall
li $v0,5 # lê um inteiro
syscall
move $t1,$v0 # move o inteiro inserido para $t0

sub $t2,$t0,$t1 # realiza a subtração entre $t0 e $t1 e armazena em $t2
la $a0,resultado # armazena resultado em $a0
li $v0,4 # chamada do sistema para mostrar a string contida em $a0
syscall
move $a0,$t2 # carrega o resultado da subtração ($t2) em $a0
li $v0,1 # exibe o resultado
syscall
li $v0,10 # chamada de sistema para encerrar o programa
syscall

.end_macro # encerramento da macro da subtração

##################################

.macro multiplicacao # macro da multiplicação
la $a0,x # armazena x em $a0 
li $v0,4 # chamada do sistema para mostrar a string contida em $a0
syscall
li $v0,5 # lê um inteiro
syscall
move $t0,$v0 # move o inteiro inserido para $t0

la $a0,y # armazena y em $a0 
li $v0,4 # chamada do sistema para mostrar a string contida em $a0
syscall
li $v0,5 # lê um inteiro
syscall
move $t1,$v0 # move o inteiro inserido para $t0

mul $t2,$t0,$t1 # realiza a multiplicação entre $t0 e $t1 e armazena em $t2
la $a0,resultado # armazena resultado em $a0
li $v0,4 # chamada do sistema para mostrar a string contida em $a0
syscall
move $a0,$t2 # carrega o resultado da multiplicação ($t2) em $a0
li $v0,1 # exibe o resultado
syscall
li $v0,10 # chamada de sistema para encerrar o programa
syscall

.end_macro # encerramento da macro da multiplicação

##################################

.macro divisao # macro da divisão
la $a0,x # armazena x em $a0 
li $v0,4 # chamada do sistema para mostrar a string contida em $a0
syscall
li $v0,5 # lê um inteiro
syscall
move $t0,$v0 # move o inteiro inserido para $t0

la $a0,y # armazena y em $a0 
li $v0,4 # chamada do sistema para mostrar a string contida em $a0
syscall
li $v0,5 # lê um inteiro
syscall
move $t1,$v0 # move o inteiro inserido para $t0

div $t2,$t0,$t1 # realiza a divisão entre $t0 e $t1 e armazena em $t2
la $a0,resultado # armazena resultado em $a0
li $v0,4 # chamada do sistema para mostrar a string contida em $a0
syscall
move $a0,$t2 # carrega o resultado da divisão ($t2) em $a0
li $v0,1 # exibe o resultado
syscall
li $v0,10 # chamada de sistema para encerrar o programa
syscall

.end_macro # encerramento da macro da divisão

##################################

.globl main # macro principal

main:
la $a0,menu # armazena em $a0 a string contida em menu
li $v0,4 # chamada de sistema para mostrar a string contida em $a0
syscall # executa a chamada de sistema
li $v0,5 # lê um inteiro
syscall # executa a chamada de sistema
move $t0,$v0 # move o inteiro inserido em $v0 para $t0

beq $t0,1,soma # se $t0 for igual a 1, pula para a label soma, se não, segue o programa
beq $t0,2,subtracao # se $t0 for igual a 2, pula para a label subtracao
beq $t0,3,multiplicacao # se $t0 for igual a 3, pula para a label multiplicacao
beq $t0,4,divisao # se $t0 for igual a 4, pula para a label divisao

soma:
soma # chama a macro soma
li $v0,10 # chamada de sistema que encerra o programa
syscall # executa a chamada de sistema

subtracao:
subtracao # chama a macro subtracao
li $v0,10 # chamada de sistema que encerra o programa
syscall # executa a chamada de sistema

multiplicacao:
multiplicacao # chama a macro multiplicacao
li $v0,10 # chamada de sistema que encerra o programa
syscall # executa a chamada de sistema

divisao:
divisao # chama a macro divisao
li $v0,10 # chamada de sistema que encerra o programa
syscall # executa a chamada de sistema
