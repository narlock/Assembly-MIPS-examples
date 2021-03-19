## Chapter 13, Problem 2 - Shifting and adding
## Initilize the sum in register $8 to zero. Then add 4096(10) to $8 sixteen times.
## You don't know how to loop, yet, so do this by making 16 copies of the same instruction
## The value 4096(10) is 0x1000
##
## Next, initialize the register $9 to 4096(10). Shift $9 left by the correct number of positions
## so that registers $8 and $9 contain the same bit pattern.
## 
## Finally, initialize register $10 to 4096(10). add $10 to itself the correct number of times so that it
## contains the same bit pattern as the other two registers.
## -----------------
## Author: Anthony Narlock
## Prof: Robert Niemann
## Class: CSCI 2016 - CS Organization and Architecture
## Date: Feb 28th 2021

	
	.text
	.globl main
	
main:
	ori $8, $0, 0		# initialize sum in register $8 to zero
	
				#Add 4096(10) sixteen times
	addi $8, $8, 4096	#1
	addi $8, $8, 4096	#2
	addi $8, $8, 4096	#3
	addi $8, $8, 4096	#4
	addi $8, $8, 4096	#5
	addi $8, $8, 4096	#6
	addi $8, $8, 4096	#7
	addi $8, $8, 4096	#8
	addi $8, $8, 4096	#9
	addi $8, $8, 4096	#10
	addi $8, $8, 4096	#11
	addi $8, $8, 4096	#12
	addi $8, $8, 4096	#13
	addi $8, $8, 4096	#14
	addi $8, $8, 4096	#15
	addi $8, $8, 4096	#16
	
	ori $9, $0, 4096	#Initialize register $9 to 4096(10)
	sll $9, $9, 4		#Shifting register 9 by 4 so that $8 and $9 have identical bit pattern
	
	ori $10, $0, 4096	#intialize register $10 to 4096(10)
				#add $10 to itself until it has same pattern as $8 and $9
	add $10, $10, $10	
	add $10, $10, $10
	add $10, $10, $10
	add $10, $10, $10
	
	.data


#This marks the end of the program
