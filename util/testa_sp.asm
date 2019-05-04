		.text

main:			la $s0, n
				la $s1, vetor
				la $s2, msg1

				jal rotina_1

				li $v0,4
				la $a0,msg2
				syscall
				
				li $v0, 10
				syscall
				

rotina_1:		addi $sp, $sp, -4
				sw $ra, 0($sp)

				addi $t0, $zero, 0		# i = 0
				lw $t1, 0($s0)			# t1 = n
				
for:			slt $t2, $t0, $t1		#cond for
				beq $t2, $zero, fim_for

				add $t3, $zero, $t0		#t3 = i
				sll $t3, $t3, 2			#t3 *= 4
				add $t3, $t3, $s1		#t3 = &vetor[i]

				jal rotina_2

				addi $t0, $t0, 1
				j for

fim_for:		lw $ra, 0($sp)
				addi $sp, $sp, 4
				jr $ra



rotina_2:		li $v0, 1
				lw $a0, 0($t3)
				syscall

				li $v0,4
				la $a0, espaco
				syscall

				jr $ra




#--------------------------------------------------------
		.data 
n:		.word 5
vetor:	.word 1 2 3 4 5
msg1:	.asciiz "imprimindo vetor\n"
msg2:	.asciiz "\nTerminou\n"
espaco:	.asciiz "   "
