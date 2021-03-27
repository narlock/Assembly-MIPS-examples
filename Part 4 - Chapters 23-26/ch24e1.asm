#Chapter 24, exercise 1 - String Length
#Author: Anthony Narlock
#Date: 3/23/2021

#Write a program that repeatedly asks the user for a string and then
#calculates and prints out the string length. Stop the program
#when the string is empty (when the user hits "enter" without anything else)

#Be sure to reserve enough memory in the .data for the string.
#Use indexed addressing to scan through the string
#Strings read in with the trap handler service include a '\n'
#character at the end, followed by the null termination

	.text
	.globl main

main:
	li $v0, 4		#Print the prompt
	la $a0, prompt		
	syscall
	
	li $v0, 8		#Read the string	
	la $a0, string		#Address of the buffer
	li $a1, 24		#a1 == buffer length
	syscall
	
	li $t1, 0		#Read first character in string
	lb $v0, string($t1)	# $v0 = string[$1]
	
	beq $v0, 10, done	#If character is '\n', jump to done
	
	li $v0, 4		#Print the prompt2
	la $a0, prompt2
	syscall
	
	la $a0, string		#Loads address of the beginning of the string
	move $s0, $a0		#Move data to $s0
	li $s7, 0
	
loop:	lb $a0, 0($s0)		#Load first char to $a0
	addi $s0, $s0 1		#increment index
	
	beq $a0, $zero, ldone	#If zero, done with loop
	add $s7, $s7, 1		#increment length
	lb $a0, 0($s0)
	j loop

ldone:	subi $s7, $s7, 1	#Decrement length
	move $a0, $s7		#Print the length
	li $v0, 1
	syscall
	j main

done:	li $v0, 4		#Print end
	la $a0, end
	syscall
	li $v0, 10
	syscall
	

	.data
prompt: .asciiz "\nEnter a string: "
string: .space 128
prompt2: .asciiz "String length: "
end:	.asciiz "Complete, program will end"