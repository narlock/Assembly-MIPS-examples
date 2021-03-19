## Using X = 1, and Y = 2
## Author: Anthony Narlock
## Prof: Robert Niemann
## Class: CSCI 2016 - CS Organization and Architecture
## Date: Feb 28th 2021

	.text
	.globl main

main:
	
	ori $8, $0, 1		# This value represents 'X' as instructed
	ori $9, $0, 2		# This value represents 'Y' as instructed
	
	#Write program to evaluate 3x - 5y
	#If we do this algebraically, we should have 3(1) - 5(2) = 3-10 = -7
	
	#Getting 3x - by doing 1(given)+1+1 which is equivalent to 3*1
	addi $8, $8, 1
	addi $8, $8, 1
	
	#Getting 5y - by doing 2(given)+2+2+2+2 which is equivalent to 5*2
	addi $9, $9, 2
	addi $9, $9, 2
	addi $9, $9, 2
	addi $9, $9, 2
	
	#Now, $8 should have 3 and $9 should have 10
	sub $10, $8, $9
	
	.data

#This marks the end of the program