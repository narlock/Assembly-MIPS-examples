# Author: Anthony Narlock
# Date: Mar 17. 2021

# Chapter 19, exercise 1
# Write a program that stores the number 0 in the first four byres of the .data section
# Then stores the number 1 in the next four bytes.
# Then stores the number 2 in the four bytes after that and so on
# Do this for 0 through 24

# (use a loop, obviously, the address in the data section is contained in a base register)
# (increment the base register each time a number is stored

	.text
	.globl main
	
main:
	ori $8, $0, 0		#This will represent the counter
	ori $9, $0, 25		#This will represent how many times our while loop will iterate
				#Since we are storing 0 through 24, a total of 4 times, we will need to store 100 times. (25 * 4) = 100
			
	lui $10, 0x1001		#This opens the data segment 
			
while:	beq $8, $9, done
	sll $0, $0, 0
	sw $8, 0($10)		#Stores the integer into the data
	sll $0, $0, 0
	addiu $8, $8, 1 	#Increments the counter
	addiu $10, $10, 4 	#Increments the memory address
	
	sll $0, $0, 0
	j while
	
done:	
	sll $0, $0, 0
	
	.data
array:	.space	100
