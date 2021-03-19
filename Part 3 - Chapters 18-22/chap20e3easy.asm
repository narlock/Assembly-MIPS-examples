
# 0x20 represents a space character
# 0 represents the null character (the end of the string)

# Chapter 20, exercise 3 (Easy Version)
# Author: Anthony Narlock
# Date: 3/19/2021

#Note: Stores the new string without spaces starting in 0x10010060
#Note: psudeo-instructions are not allowed and not used.

	.text
	.globl main

main:
	ori $2, $0, 0			#Counter variable $2 = 1
	ori $4, $0, 0x20
	
	lui $8, 0x1001			#Load the starting value of the string "I"
	lui $9, 0x1001			#Load completed String string into 0x1001
	addiu $9, $9, 96		#loads 0x10010060 to store new string

loop:	lbu $3, 0($8)			#get character
	sll $0, $0, 0			#delay
	
	beq $3, $0, done		#If the character is null character, done
	sll $0, $0, 0			#delay
	
	beq $3, $4, skip		#If the character is a space, skip and don't add
	sll $0, $0, 0
	
	#add to new string
	sb $3, 0($9)
	
	#increment string and data value
	addiu $8, $8, 1			# Points to the next character
	addiu $9, $9, 1			# Points to the next storage location
	
	j loop
	
	
skip:	sll $0, $0, 0			#delay
	#increments the string value
	addiu $8, $8, 1			# Points to the next character
	
	j loop				#jump back to loop
	
done: 	sll $0, $0, 0

	.data
string:	.asciiz "Is  this a dagger    which I see before me?"