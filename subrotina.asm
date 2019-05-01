# t1 =	i
# t2 =	trocou
# t3 = 	limite
# t4 =  aux

#t5 = endereco
#t6 = v[i]
#t7 = v[i+1]
# s0 = n
# s1 = &vetor[0]

 	

main:  			la $t0, n		#t0 = &n
				lw $s0, 0($t0)	#t6 = n	

				la $s1, vetor	# s1 = & vetor[0]



bubbleSort:		addi $t2, $zero, 1     # trocou = TRUE
				addi $t3, $s0, -1	   # limite = n - 1

while:			slt $t4, $zero, $t3			  #inicio cond_while
				beq $t4, $zero, fim_while

				beq $t2, $zero, fim_while     #fim cond_while

				addi $t2, $zero, 0			#trocou = FALSE
				addi $t1, $zero, 0     		# i = 0

for:			slt $t4, $t1, $t3			# >
				beq $t4, $zero, fim_for     # i < limite ?

				add $t5, $zero, $t1			# t5 = i
				sll $t5, $t5, 2				# t5 *= 4

				add $t5, $t5, $s1			# t5 += end_ini

				lw $t6, 0($t5)				#t6 = v[i]
				lw $t7, 4($t5)				#t7 = v[i+1]

				slt $t4, $t7, $t6			# >
				beq $t4, $zero, fim_if	# if (v[i] > v[i+1])

				sw $t6, 4($t5)				# >
				sw $t7, 0($t5)				# swap

				addi $t2, $zero, 1			# trocou = TRUE


fim_if:			addi $t1, $t1, 1			#i++
				j for

fim_for:		addi $t3, $t3, -1          #limite--
				j while


fim_while:     	addi $v0, $zero, 10
				syscall

				

# ------------------------------------------------------------------
		.data
vetor:	.word   6 5 4 3 2 1
fodase:  .word   1
n: 		.word   6


