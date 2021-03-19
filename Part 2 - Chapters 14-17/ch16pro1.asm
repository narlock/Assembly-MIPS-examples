#Write a program that adds the values up, computes the average, and stores the result in a memory location
#Put the result in $10 in addition to storing in a memory location
## Author: Anthony Narlock
## Prof: Robert Niemann
## Class: CSCI 2016 - CS Organization and Architecture
## Date: Mar 10th 2021

	.text
	.globl main

main:
	lui $11 0x1001		#This marks the beginning of the data segment
	lbu $12, 0x0($11)
	or $13, $12, $0		#This will represent the running total, 12 is the first loaded byte, so 12+0
	
	lbu $12, 0x1($11)	#Will load 97
	add $13, $13, $12	#12 + 97 = 109
	
	lbu $12, 0x2($11)	#Will load 133
	add $13, $13, $12	#will add 109 + 133 = 242
	
	lbu $12, 0x3($11)	#Will load 82
	add $13, $13, $12	#242 + 82 = 324
	
	lbu $12, 0x4($11)	#Will load 236
	add $13, $13, $12	#final sum: 324 + 236 = 560
	
	#Calculating the average of the 5 numbers
	ori $8, $0, 5
	div $13, $8		#560/5 = 112, should be in lo
	
	mflo $10		#Moving our answer, 112, to $10 as instructed.

	.data
	.byte   12
   	.byte   97
        .byte  133
      	.byte   82
      	.byte  236
      
#This marks the end of the program
