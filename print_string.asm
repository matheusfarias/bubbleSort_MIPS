#PRINT STRING 		


	.text
  
 
      la   $a0, head        # load address of print heading
      li   $v0, 4           # specify Print String service
      syscall               # print heading
      
      
      
      
      
      .data
head: .asciiz  "The Fibonacci numbers are:\n"