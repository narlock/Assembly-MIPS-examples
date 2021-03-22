# Chapter 22 exercise 1 - Miles Per Gallon
# Author: Anthony Narlock
# Date: 3/19/2021

#Write a program that repeatedly prompts the user for the number of miles traveled
#and the gallons of gasoline consumed, and then prints out the miles per gallon
#Use integer math. Exit when the user enters 0 for the number of miles

#Testing using: (10,10), (20,5), 0

	.text
	.globl main

main:	
	
	li	$v0, 4		#prints prompt 1
	la	$a0, prompt	#
	syscall
	li	$v0, 5		#Reads miles traveled
	syscall
	move $t0, $v0		#Move miles traveled to $t0
	
	beq $t0, 0, exit
	
	li	$v0, 4		#prints prompt
	la	$a0, prompt2	#
	syscall
	
	li	$v0, 5		#Reads gallons of gas
	syscall
	move $t1, $v0		#Moves gallons of gas to $t1
	
	
	#Calculate Miles Per Gallon
	div $t0, $t1
	mflo $a0		#divided number in $a0
	
	#Print out Miles Per Gallon
	li $v0, 1		#load syscall print into $v0
	syscall
	li $v0, 4
	la $a0, mpgout
	syscall
	
	j main
	
exit:	li $v0, 10
	syscall

	.data
prompt:	.asciiz "\nNumber of Miles Traveled: "
prompt2:.asciiz "Number of Gallons of Gas consumed: "
mpgout: .asciiz " = calculated Miles Per Gallon."