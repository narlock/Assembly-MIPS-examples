## Chapter 12, Problem 1A: Put the following bit pattern into register $1 : DEADBEEF
## Author: Anthony Narlock
## Prof: Robert Niemann
## Class: CSCI 2016 - CS Organization & Architecture
## Date: Feb 28th 2021

	.text
	.globl main
	
main:
	ori $1, $0, 0xDEAD
	sll $1, $1, 16
	ori $1, $1, 0xBEEF
	
	.data

## This represents the end of the program