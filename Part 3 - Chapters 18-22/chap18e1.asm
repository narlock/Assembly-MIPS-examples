#author: Anthony Narlock
#Date: 3/19/2021

#Chapter 18, Exercise 3
#How it works:
#Testing with temperature 30, will have final result of 1 in $3
#Test1 tests 20 <= temp <= 40, stores it's result in $4
#Test2 tests 60 <= temp <= 80, stores it's result in $5
#Compares the tests, stores in $3

	.text
	.globl main

main:	
	ori $4, $0, 1		#set to 1 (test 1's outcome)
	ori $5, $0, 1		#set to 1 (test 2's outcome)
	
	ori $3, $0, 1		#set to 1 (final comparison)

#Temperature set:
	ori $2, $0, 100		#Testing with 10
	
#Test 20 <= temp <= 40
test1:	
	sltiu	$8, $2, 41	# $8 = 1 if temp <= 40
	beq	$8, $0, out	# 0? out of range
	sll	$0, $0, 0	# required delay
	
	sltiu	$8, $2, 20	# $8 = 1 if temp < 20
	beq	$8, $0, cont	# 0? in range
	sll	$0, $0, 0	# required delay
	
	#If the temp < 20 is 1, then
	ori	$4, $0, 0
	j test2
	
#Test2: 60 <= temp <= 80 
test2:	
	sltiu	$8, $2,	81	# $8 = 1 if temp <= 80
	beq	$8, $0, out2	# 0? out of range
	sll	$0, $0, 0	# required delay
	
	sltiu	$8, $2, 60	# $8 = 1 if temp < 60
	beq	$8, $0, cont2	# 0? in range
	sll	$0, $0, 0
	
	#If the temp < 60 is 1, and 
	ori	$5, $0, 0
	j final

out: 	ori	$4, $0, 0	#clear flag to 0
cont: 	sll	$0, $0, 0	#target for the jump
	j test2
	
out2:	ori	$5, $0, 0	#clear flag to 0
cont2:	sll	$0, $0, 0	#target for jump
	j final
	
final:	or $3, $4, $5		#Compares the two conditions,
				#If one is met, temp is in at least
				#one of the ranges.

	.data
