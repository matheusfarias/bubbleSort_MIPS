# t1 =	i
# t2 =	trocou
# t3 = 	limite
# t4 =  aux
#t5 = endereco
# s0 = n
 	
 	 	
main:		addi 	$t2, $zero, 1  	#trocou = 1
		addi    $t1, $zero, 0  	#i = 0
		addi    $t3, $s0, -1    # limite = n - 1
	
while:		slt	$t4, $zero, $t3
		beq	$t4, $zero, fim_while
		beq	$t2, $zero, fim_while
		
		addi	$t2, $zero, 0
		
for:		slt 	$t4, $t1, $t3
		beq 	$t4, $zero, fim_for
		slt	$t5, $t1, 2
		addi 	$t5, $t5, 
		
		
fim_for:






fim_while:
	
	  
	  
	  
	  
.data




