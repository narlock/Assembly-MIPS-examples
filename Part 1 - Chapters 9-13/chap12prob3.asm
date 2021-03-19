## Chapter 12, Problem 3: Start out with the instruction that puts a single one-bit into register one:
##	ori $1, $0, 0x01
## Now, by using only shift instructions and register logic instructions, put the pattern 0xFFFFFFF into $1
## Don't use another ori after the first. Need to use more registers than $1. See how few instructions you can do this in....
## -----------------
## Author: Anthony Narlock
## Prof: Robert Niemann
## Class: CSCI 2016 - CS Organization and Architecture
## Date: Feb 28th 2021

	
	.text
	.globl main
	
main:
	ori $1, $0, 0x1
	nor $8, $0, $1
	or $9, $1, $1
	or $1, $8, $9
	
	.data


#This marks the end of the program
