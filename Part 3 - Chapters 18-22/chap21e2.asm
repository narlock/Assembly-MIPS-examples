# Chapter 21, exercise 2 - Pair-wise Addition
# Author: Anthony Narlock
# Date: 3/19/2021

#Initialize a base register for each array (use la instruction)
#Implement a loop that adds corresponding elements in the first two arrays
#and stores the result in the corresponding element of the result array.
#Do this by moving each of the three base registers to its next arrray element after each addition

#Psedo-instructions are turned ON

	.text
	.globl main
	
main:
	lw $t4, size		#Loads size to $t3
				#Treating the size as a counter
	
	la $t1, array1		#Loads array1 into $t1
	la $t2, array2		#Loads array2 into $t2
	la $t3, result		#Loads result into $t3
	
loop:	beq $t4, 0, done	#essentially for i=0, i<7, i++
	
	lw $a1, 0($t1)		#loads elemeent from array1
	lw $a2, 0($t2)		#loads from array2
	
	add $a3, $a1, $a2	#adds the elements together
	
	sw $a3, 0($t3)		#stores the sum into result array
	
	#Setting next element in array
	add $t1, $t1, 4
	add $t2, $t2, 4
	add $t3, $t3, 4
	
	sub $t4, $t4, 1		#Decrement size for loop to end
	
	j loop
	
done:	nop

	.data
size:    .word       7
array1:  .word     -30, -23, 56, -43, 72, -18, 71
array2:  .word      45,  23, 21, -23, -82,  0, 69
result:  .word       0,   0,  0,   0,   0,  0,  0