#MOSTRA VETOR

			.text

main:		la $s0, vetor

			jal mostra_vetor

			la $a0, msg3
			li $v0, 4
			syscall



#------------------------------------------------------------------------------
# ROTINA mostra_vetor
#		Mostra no display bitmap cor correspondente a todos os elementos de vetor
#		Possui chamada aninhada de rotina
# Algoritmo:
#		for j = 0 ; j < n ; j++
#			mostra_elemento_vetor(j)
# Uso dos registradores:
#		COMPLETAR
# salvar ra la pilha



mostra_vetor:													# COMPLETAR
				addi $sp, $sp, -4
				sw $ra, 0($sp)
				




#------------------------------------------------------------------------------
# ROTINA mostra_elemento_vetor(índice)
#		Mostra no display bitmap cor correspondente ao elemento vetor[índice]
# Algoritmo:
#		Salva registradores na pilha
#		Lê vetor[índice] da memória
#		Lê escala_ azul[vetor[índice]] da memória (cor com que elemento deve ser desenhado)
#		Calcula endereço no display onde elemento do vetor deve ser desenhado: endereço inicial do display + índice * 4
#		Escreve cor nessa posição do display
#		Restaura registradores da pilha
# Parâmetros:
#		$a0: índice  do elemento do vetor (entre 0 e n - 1, corresponde à coluna no display em que elemento é desenhado)
# Uso dos registradores:
#		$t0: endereço inicial de vetor na memória
#		$t1: endereço de vetor[índice] na memória
#		$t2: vetor[índice] (entre 0 e n - 1, corresponde ao índice da cor com que elemento é desenhado)
#		$t3: endereço inicial do vetor escala_ azul na memória
#		$t4: endereço de escala_ azul[vetor[índice]] na memória
#		$t5: escala_ azul[vetor[índice]] (cor com que elemento deve ser desenhado)
#		$t6: endereço no display onde elemento do vetor deve ser desenhado
#		$gp: endereço inicial do display

																	# Prólogo
mostra_elemento_vetor:	addi	$sp, $sp, -28			# Aloca espaço para 7 palavras na pilha
						sw		$t0, 0 ($sp)					# Salva $t0, $t1, $t2, $t3, $t4, $t5, $t6 na pilha
						sw		$t1, 4 ($sp)
						sw		$t2, 8 ($sp)
						sw		$t3, 12 ($sp)
						sw		$t4, 16 ($sp)
						sw		$t5, 20 ($sp)
						sw		$t6, 24 ($sp)
																	# Lê vetor[índice] da memória
						la		$t0, vetor						# $t0 = endereço inicial de vetor na memória
						sll	$t1, $a0, 2						# $t1 = índice * 4
						add	$t1, $t0, $t1					# $t1 = endereço de vetor[índice] na memória
						lw		$t2, 0 ($t1)					# $t2 = vetor[índice] (índice da cor com que elemento é desenhado)
																	# Lê escala_ azul[vetor[índice]] da memória
						la		$t3, escala_azul				# $t3 = endereço inicial do vetor escala_ azul na memória
						sll	$t4, $t2, 2						# $t4 = vetor[índice] * 4
						add	$t4, $t3, $t4					# $t4 = endereço de escala_ azul[vetor[índice]] na memória
						lw		$t5, 0 ($t4)					# $t5 = escala_ azul[vetor[índice]] (cor com que elemento é desenhado)
																	# Calcula endereço no display onde elemento do vetor deve ser desenhado
						sll	$t6, $a0, 2						# $t6 = índice * 4
						add	$t6, $gp, $t6					# $t6 = endereço inicial do display + índice * 4
						sw		$t5, 0 ($t6)					# Escreve cor do elemento do vetor na área de memória do display bitmap: mostrado no display
																	# Epílogo
						lw		$t0, 0 ($sp)					# Restaura $t0, $t1, $t2, $t3, $t4, $t5, $t6 da pilha
						lw		$t1, 4 ($sp)
						lw		$t2, 8 ($sp)
						lw		$t3, 12 ($sp)
						lw		$t4, 16 ($sp)
						lw		$t5, 20 ($sp)
						lw		$t6, 24 ($sp)
						addi	$sp, $sp, 28					# Libera espaço de 7 palavras na pilha
						jr		$ra								# Retorna da rotina
#------------------------------------------------------------------------------
						.data										# Área de dados
#------------------------------------------------------------------------------
																	# Variáveis e estruturas de dados do programa
#n:						.word 16									# Número de elementos do vetor (no máximo 16)
n:					.word	6

vetor:				.word	6 5 4 3 2 1								# Vetor a ser ordenado (com 16 valores entre 0 e 15)
#vetor:				.word 9 1 10 2 6 13 15 0 12 5 7 14 4 3 11 8
#vetor:				.word 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
#vetor:				.word 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0
#vetor:				.word 9 1 10 2 9 6 13 15 13 0 12 5 6 0 5 7
																	# Strings para impressão de mensagens
msg1:					.asciiz "\nOrdenação\n"
msg2:					.asciiz "Tecle enter"
msg3:					.asciiz "run ended"
																	# Escala de 16 cores em azul
escala_azul:		.word 0x00CCFFFF, 0x00BEEEFB, 0x00B0DDF8, 0x00A3CCF4, 0x0095BBF1, 0x0088AAEE, 0x007A99EA, 0x006C88E7, 0x005F77E3, 0x005166E0, 0x004455DD, 0x003644D9, 0x002833D6, 0x001B22D2, 0x000D11CF, 0x000000CC
#------------------------------------------------------------------------------
#-----------------------------------------------------------------------------
		
