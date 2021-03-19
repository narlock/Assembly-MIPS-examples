#Fibonacci Series, write a program that computes terms of the Fibonacci series
#1,1,2,3,5,8,13,21,55 ...
#Put the result in $15
## Author: Anthony Narlock
## Prof: Robert Niemann
## Class: CSCI 2016 - CS Organization and Architecture
## Date: Mar 10th 2021

	.text
	.globl main
	
main:
	ori $8, $0, 0		#This will represent the previous addition term
	ori $9, $0, 1		#This will represent the current addition term
	ori $15, $0, 1		#This will represent the fibonacci number, the first one is 1
	
	ori $10, $0, 0		#This will represent the loop's counter
	ori $11, $0, 101	#The program will terminate after the 100th term
	
	loop:
	beq $10, $11, done
	addu $15, $8, $9	#the fibonacci number = previous + current
	or $8, $0, $9		#The new previous is now the old current
	or $9, $0, $15		#The new current is now the old fibbonacci number
	addiu $10, $10, 1	#Iterate the counter by 1
	j loop			#Iterate the loop
	sll $0, $0, 0

done:
	j done			#Runs when the 100th fibonacci number is in $15
	sll $0, $0, 0		#Is done.

	.data