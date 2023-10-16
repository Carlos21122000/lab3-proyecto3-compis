.data    
    prompt1:    .asciiz     "Enter the first number: "
    prompt2:	.asciiz     "\nEnter the second number: "
    resultText:	.asciiz		"Your final result is: "

.text	
.globl main
main:
	li $v0, 4     	#command for printing a string
	la $a0, prompt1 #loading the string to print into the argument to enable printing
	syscall      	#executing the command

	#the next block of code is for reading the first number provided by the user
	li $v0, 5    #command for reading an integer
	syscall      #executing the command for reading an integer
	move $t0, $v0     #moving the number read from the user input into the temporary register $t0

	#asking the user to provide the second number
	li $v0, 4    		#command for printing a string
	la $a0, prompt2   	#loading the string into the argument to enable printing
	syscall				#executing the command

	#reading the second number to be provided to the user
	li $v0, 5   	#command to read the number  provided by the user
	syscall      	#executing the command for reading an integer
	move $t1, $v0   #moving the number read from the user input into the temporary register $t1
	
	bgt $t1, $t0, change_order
	bge $t0, $t1, loop

loop:
	beqz $t1, end
	sub $t0, $t0, $t1
	bgt $t1, $t0, change_order
	j loop

end:
	li $v0, 4    		#this is the command for printing a string
    la $a0, resultText   #this loads the string to print into the argument $a0 for printing
    syscall      		#executes the command
    
    #the following line of code prints out the result of the addition computation
    li $v0, 1
    move $a0, $t0	
	syscall
	
	li $v0, 10
    syscall

change_order:
		
	move $t2, $t0	
	move $t0, $t1	
	move $t1, $t2
	
	j loop

	
	
	