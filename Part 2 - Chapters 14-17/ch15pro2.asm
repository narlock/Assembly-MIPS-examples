## Using X=0 and Y=1 evaluate: 17xy - 12x - 6y + 12, store the answer in $10
## Author: Anthony Narlock
## Prof: Robert Niemann
## Class: CSCI 2016 - CS Organization and Architecture
## Date: Mar 10th 2021

	.text
	.globl main
	
main:
	ori $8, $0, 0 			#Loading X = 0
	ori $9, $0, 1			#Loading Y = 1
	
	mult $8, $9
	mflo $11			#x*y in register 11
	ori $12, $0, 17			#Loading 17 for 17xy
	mult $11, $12
	mflo $11			#17xy is in $11
	
	ori $12, $0, 12			#Loading 12 for 12x
	mult $12, $8			#Multiply 12 by x
	mflo $12			#12x is stored in $12
	
	ori $13, $0, 6			#Storing 6 in for 6y
	mult $13, $9			#multiply 6 and y
	mflo $13			#6y is in $12
	
	#Now, 17xy is in $11
	#     12x is in $12,
	# and 6y is in $13.
	
	sub $10, $11, $12		#17xy - 12x
	sub $10, $10, $13		#(17xy - 12x) - 6y
	addi $10, $10, 12		#((17xy - 12x) - 6y) + 12, store final in $10
	
	.data

#This marks the end of the program