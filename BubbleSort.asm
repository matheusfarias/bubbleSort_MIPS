#Aluno: Matheus Farias dos Santos
#RGA:   2018.1905.005.0
# ----------------------------------------------------------------------------------------
#Uso de registradores na subrotina bubbleSort:
# $t1 = i
# $t2 = trocou
# $t3 = limite
# $t4 = aux
# $t5 = &vetor[i]
# $t6 = vetor[i]
# $t7 = vetor[i+1]
# $s0 = &n
# $s1 = &vetor[0]
# ----------------------------------------------------------------------------------------
							.text


main:					addi $v0, $zero, 4
					la $a0,msg1
					syscall

					jal bubbleSort						

					addi $v0, $zero, 10						#finalizando programa
					syscall	

bubbleSort:				addi $sp, $sp, -4
					sw $ra, 0($sp)

					la $s1, n							# s1 = &n
					la $s0, vetor							# s0 = &vetor
					lw $t7, 0($s1)

					jal mostra_vetor

					addi $t2, $zero, 1     						# trocou = TRUE
					addi $t3, $t7, -1	   					# limite = n - 1

while:					slt $t4, $zero, $t3			  			#inicio cond_while
					beq $t4, $zero, fim_while

					beq $t2, $zero, fim_while    					 #fim cond_while

					addi $t2, $zero, 0						#trocou = FALSE
					addi $t1, $zero, 0     						# i = 0

for:					slt $t4, $t1, $t3						# <
					beq $t4, $zero, fim_for     					# i < limite ?

					add $t5, $zero, $t1						# t5 = i
					sll $t5, $t5, 2							# t5 *= 4

					add $t5, $t5, $s0						# t5 += end_ini

					lw $t6, 0($t5)							#t6 = v[i]
					lw $t7, 4($t5)							#t7 = v[i+1]

					slt $t4, $t7, $t6						# <
					beq $t4, $zero, fim_if						# if (v[i] > v[i+1])

					jal troca

					addi $t2, $zero, 1						# trocou = TRUE


fim_if:					addi $t1, $t1, 1						#i++
					j for

fim_for:				jal mostra_vetor
					addi $t3, $t3, -1          					#limite--
					j while


fim_while:  	lw $ra, 0($sp)
					addi $sp, $sp, 4
					jr $ra


#------------------------------------------------------------------------------
troca:					lw $t0, 0($t5)
					lw $t4, 4($t5)
					sw $t0, 4($t5)
					sw $t4, 0($t5)

					jr $ra
#------------------------------------------------------------------------------


#------------------------------------------------------------------------------
mostra_vetor:				addi $sp, $sp, -16					#alocando espaco em sp
					sw $ra, 0($sp)						#salvando o endereco de retorno da main na pilha
					sw $t0, 4($sp)						# salva t0
					sw $t1, 8($sp)						# salva t1
					sw $t2, 12($sp)						# salva t2

					addi $t0, $zero, 0					# j = 0
					lw $t1, 0($s1)						# t1 = n

for_sub:				slt $t2, $t0, $t1
					beq $t2, $zero, fim_for_sub

					add $a0, $zero, $t0					#a0 = i (a0 e o parametro)
					jal	mostra_elemento_vetor				#chama subrotina mostra_elemento_vetor

					addi $t0, $t0, 1
					j for_sub

fim_for_sub:				lw $ra, 0($sp)						#restaurando valor de ra
					lw $t0, 4($sp)						#restaurando t0
					lw $t1, 8($sp)						#restaurando t1
					lw $t2, 12($sp)						#restaurando t2
					addi $sp, $sp, 16					#liberando espaco na pilha
					jr $ra 							#voltando pra ordenacao
	

#------------------------------------------------------------------------------
														# Prólogo
mostra_elemento_vetor:				addi		$sp, $sp, -28					# Aloca espaço para 7 palavras na pilha
						sw		$t0, 0 ($sp)					# Salva $t0, $t1, $t2, $t3, $t4, $t5, $t6 na pilha
						sw		$t1, 4 ($sp)
						sw		$t2, 8 ($sp)
						sw		$t3, 12 ($sp)
						sw		$t4, 16 ($sp)
						sw		$t5, 20 ($sp)
						sw		$t6, 24 ($sp)
														# Lê vetor[Índice] da memória
						la		$t0, vetor					# $t0 = endereço inicial de vetor na memória
						sll		$t1, $a0, 2					# $t1 = Índice * 4
						add		$t1, $t0, $t1					# $t1 = endereço de vetor[Índice] na memória
						lw		$t2, 0 ($t1)					# $t2 = vetor[Índice] (Índice da cor com que elemento é desenhado)
														# Lê escala_ azul[vetor[Índice]] da memória
						la		$t3, escala_azul				# $t3 = endereço inicial do vetor escala_ azul na memória
						sll		$t4, $t2, 2					# $t4 = vetor[Índice] * 4
						add		$t4, $t3, $t4					# $t4 = endereço de escala_ azul[vetor[Índice]] na memória
						lw		$t5, 0 ($t4)					# $t5 = escala_ azul[vetor[Índice]] (cor com que elemento é desenhado)
														# Calcula endereço no display onde elemento do vetor deve ser desenhado
						sll		$t6, $a0, 2					# $t6 = Índice * 4
						add		$t6, $gp, $t6					# $t6 = endereço inicial do display + Índice * 4
						sw		$t5, 0 ($t6)					# Escreve cor do elemento do vetor na Área de memória do display bitmap: mostrado no display
														# Epílogo
						lw		$t0, 0 ($sp)					# Restaura $t0, $t1, $t2, $t3, $t4, $t5, $t6 da pilha
						lw		$t1, 4 ($sp)
						lw		$t2, 8 ($sp)
						lw		$t3, 12 ($sp)
						lw		$t4, 16 ($sp)
						lw		$t5, 20 ($sp)
						lw		$t6, 24 ($sp)
						addi		$sp, $sp, 28					# Libera espaco de 7 palavras na pilha
						jr		$ra						# Retorna da rotina

#------------------------------------------------------------------------------
						.data								# Area de dados
#------------------------------------------------------------------------------
														# Variaveis e estruturas de dados do programa
n:						.word 16							# Numero de elementos do vetor (no maximo 16)
#n:						.word 6
#vetor:					.word 1 2 3 4 5 6
														# Vetor a ser ordenado (com 16 valores entre 0 e 15)
vetor:				.word 9 1 10 2 6 13 15 0 12 5 7 14 4 3 11 8
#vetor:				.word 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
#vetor:				.word 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0
#vetor:				.word 9 1 10 2 9 6 13 15 13 0 12 5 6 0 5 7
														# Strings para impressao de mensagens
msg1:					.asciiz "\ORDENA\n"
msg2:					.asciiz "Tecle enter"
														# Escala de 16 cores em azul
escala_azul:		.word 0x00CCFFFF, 0x00BEEEFB, 0x00B0DDF8, 0x00A3CCF4, 0x0095BBF1, 0x0088AAEE, 0x007A99EA, 0x006C88E7, 0x005F77E3, 0x005166E0, 0x004455DD, 0x003644D9, 0x002833D6, 0x001B22D2, 0x000D11CF, 0x000000CC
#------------------------------------------------------------------------------
