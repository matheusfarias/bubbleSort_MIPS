
#subrotina troca elementos vetor[i] <<>> vetor[i+1]
#$a0 endereco de v[i] na memória
		.text

main:	la $a0, vetor

		





troca:	lw $t0, 0($a0)
			lw $t4, 4($a0)
			sw $t0, 4($a0)
			sw $t4, 0($a0)



#instruções de retorno:




# ------------------------------------------------------------------
			.data
vetor:	.word   6 5 4 3 2 1
n: 		.word   6

