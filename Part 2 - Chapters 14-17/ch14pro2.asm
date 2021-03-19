## Using X=1 as test value, do (3x+7)/(2x+8). Put result in $10
## Author: Anthony Narlock
## Prof: Robert Niemann
## Class: CSCI 2016 - CS Organization and Architecture
## Date: Mar 10th 2021

	.text
	.globl main
	
main:
	ori $8, $0, 1		#This represents X
	ori $9, $0, 3		#This represents the 3 in 3x
	mult $8, $9		#Multiplies 3 and x
	mflo $11		#$11 is the product of them, no quotient is recieved because multiplication
	addi $11, $11, 7 	#This represents adding 3x + 7
	
	ori $9, $0, 2		#Represents the 2 in 2x
	mult $8, $9		#Multiplies 2 and x
	mflo $12
	addi $12, $12, 8	#Represents adding 2x + 8
	
	div $11, $12		#Divides respectively (3x+7)/(2x+8)
	mflo $10		#Stores into $10
	mfhi $11		#Stores the remainder into $11
	
	#Note: In the example, when X=1, the remainder will be zero, but the quotient is stored into $10

	.data
	
#This marks the end of the program
