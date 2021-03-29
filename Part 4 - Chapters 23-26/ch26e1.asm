#Chapter 26, exercise 1 - Arithmetic Expression
#Author: Anthony Narlock
#Date: 3/29/2021

#Write a subroutine that takes three arguments, A, X, and Y.
#It computes A*X*Y and returns it.
#Use the subroutine to evaluate the following for various values of u and v
# 5u^2 - 12uv + 6v^2

         .text
         .globl  main
main:
         jal     pread            # read u integer
         nop                      #  
         move    $s0,$v0          # save it in $s0

         jal     pread            # read v integer
         nop                      #  
         move    $s1,$v0          # save it in $s1

	#todo:
	
    	
    	#Calculate term1 = store in some variable
    	jal term1
    	nop
    	move $t0, $v0
    	
    	#Calculatte term2 = store in some variable
    	jal term2
    	nop
    	move $t1, $v0
    	
    	#Calculate term3 = store in some variable
    	jal term3
    	nop
    	move $t2, $v0
    	
    	#Sum the terms
    	subu $t0, $t0, $t1
    	addu $s3, $t0, $t2	#stored in $s3
    	
done:	li $v0, 1		#Load syscall print into $v0
	move $a0, $s3
	syscall
	li $v0, 10	
	syscall
        
        li      $v0,10           # exit
        syscall
          
         .data 
        
 

# pread.asm -- prompt for and read an integer
# Essentially, the first run selects u, the second selects v

         .text
         .globl  pread
pread:   
         la    $a0,prompt        # print string
         li    $v0,4             # service 4
         syscall
        
         li    $v0,5             # read int into $v0
         syscall                 # service 5
        
         jr    $ra               # return
         nop                     #  
        
         .data
prompt:
         .asciiz "Enter an integer: "

# u = $s0
# v = $s1
# term1.asm -- gets 5*u*u

	.text
	.globl term1
term1:
	mul $t7, $s0, $s0
	mul $t7, $t7, 5
	la $v0, ($t7)
	
	jr $ra
	nop

# term2.asm -- gets 12*u*v
	.text
	.globl term2
term2:
	mul $t7, $s0, $s1
	mul $t7, $t7, 12
	la $v0, ($t7)
	
	jr $ra
	nop

# term3.asm -- gets 6vv
	.text
	.globl term3
term3:
	mul $t7, $s1, $s1
	mul $t7, $t7, 6
	la $v0, ($t7)
	
	jr $ra
	nop