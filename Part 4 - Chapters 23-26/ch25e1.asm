#Chapter 25, exercise 1 - Arithmetic Evaulation
#Author: Anthony Narlock
#Date: 3/29/2021

#Write a program to evaluate 3ab - 2bc - 5a + 20ac - 16
#Prompt the user for the values a, b, and c. Try to use a small number of registers.
#Use the stack to hold intermediate values.
#Write the final value to the monitor

#Note: Psudoinstructions are turned ON

	.text
	.globl main
	
main:
	li $v0, 4		#Print the prompt
	la $a0, prompta		#
	syscall
	
	li $v0, 5		#Read the word	
	syscall
	move $t0, $v0		#Move a into $t0
	
	li $v0, 4		#Print the prompt
	la $a0, promptb		#
	syscall
	
	li $v0, 5		#Read the word
	syscall
	move $t1, $v0		#Move b into $t1
	
	li $v0, 4		#Print the prompt
	la $a0, promptc		#
	syscall
	
	li $v0, 5		#Read the word
	syscall
	move $t2, $v0		#Move b into $t1
	
	#calculate 3ab - 2bc - 5a + 20ac - 16 with stack
	
	#Push 3ab to stack
	li $a1, 3		#Loading constant
	mul $t3, $t0, $t1	#Multiply ab, store $t3
	mul $t3, $t3, $a1	#Now it's 3ab in $t3
	subu $sp, $sp, 4	#Push 3ab onto stack
	sw $t3, ($sp)
	
	#Push -2bc to stack
	li $a1, -2		#Loading constant
	mul $t3, $t1, $t2	#Multiply bc, store $t3
	mul $t3, $t3, $a1	#Now it's -2bc
	subu $sp, $sp, 4	#Push -2bc onto stack
	sw $t3, ($sp)
	
	#Push -5a to stack
	li $a1, -5		#Loading constant
	mul $t3, $t0, $a1	#Mulitply -5a
	subu $sp, $sp, 4	#Push -5a onto stack
	sw $t3, ($sp)
	
	#Push 20ac to stack
	li $a1, 20		#Loading constant
	mul $t3, $t0, $t2	#Multiply ac
	mul $t3, $t3, $a1	#Now it's 20ac
	subu $sp, $sp, 4	#Push 20ac onto stack
	sw $t3, ($sp)
	
	#Init sum to -16
	li $t4, -16		#Init -16
	
	#Pop 20ac
	lw $t5, ($sp)		#Pop 20ac
	addu $sp, $sp, 4
	addu $t4, $t5, $t4	#20ac - 16
	
	#Pop -5a
	lw $t5, ($sp)		#Pop -5a + 20ac - 16
	addu $sp, $sp, 4
	addu $t4, $t5, $t4
	
	#Pop -2bc
	lw $t5, ($sp)		#Pop -2bc -5a + 20ac - 16
	addu $sp, $sp, 4
	addu $t4, $t5, $t4
	
	#Pop3ab
	lw $t5, ($sp)		#Pop 3a -2bc -5a + 20ac - 16
	addu $sp, $sp, 4
	addu $t4, $t5, $t4
	
	#output prompt
done:	li $v0, 1		#Load syscall print into $v0
	move $a0, $t4
	syscall
	li $v0, 10	
	syscall

	.data
prompta: .asciiz "Enter value for a: "
promptb: .asciiz "Enter value for b: "
promptc: .asciiz "Enter value for c: "