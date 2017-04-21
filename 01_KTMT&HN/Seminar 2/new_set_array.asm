	.data
array:	.space	40
msg1:	.asciiz	"Input the number of elements: "
msg2:   .asciiz "Output the number of elements:\n"
	
	.text
#output msg1
la	$a0, msg1
addi	$v0, $zero, 4
syscall
#input the number
addi	$v0, $zero, 5
syscall
addi	$s1, $v0, 0
la	$s0, array

#move s1 -> a0
add	$a0, $s1, $zero
jal set_array

#output msg2
la	$a0, msg1
addi	$v0, $zero, 4
syscall
#output "\n"
addi $v0, $0, 11
addi $a0, $0, 10
syscall
#print array
la	$s0, array
j print_array

#Function set_array
set_array:
	#push $ra, $a0 into stack
	addi	$sp, $sp, -8
	sw	$ra, ($sp)
	sw	$a0, 4($sp)
	
	addi	$t0, $zero, 0 #i
	addi	$t1, $zero, 10 # value 10 (i <10)
	Loop:
		beq	$t0, $t1, exit_set_array
		#make argument
		addi	$a0, $a0, 0 #int a
		addi	$a1, $t0, 0 #int b
		jal	compare
		sw	$v0, ($s0)	#array[i] = compare

		#increase $t0
		addi	$t0, $t0, 1
		addi	$s0, $s0, 4	#increase pointer
		j Loop
	exit_set_array:
		#pop $ra, $a0 from stack
		lw	$ra, ($sp)
		lw	$a0, 4($sp)
		addi	$sp, $sp, 8
		jr $ra
compare:
	#push $ra, $a0, $a1 into stack
	addi	$sp, $sp, -12
	sw	$ra, ($sp)
	sw	$a0, 4($sp)
	sw	$a1, 8($sp)
	#make argument
	addi	$a0, $a0, 0
	addi	$a1, $a1, 0
	jal sub
	#treatment
	slt	$t2, $v0, $zero #$v0<$zero -> $t2=1 : $t2=0
	beq	$t2, $zero, assign
	addi	$v0, $zero, 0
	j exit_compare
	assign:
		addi $v0, $zero, 1
	
	exit_compare:
		#pop stack
		lw	$ra, ($sp)
		lw	$a0, 4($sp)
		lw	$a1, 8($sp)
		addi	$sp, $sp, 12
	
		jr $ra
sub:
	#push $ra, $a0, $a1 into stack
	addi	$sp, $sp, -12
	sw	$ra, ($sp)
	sw	$a0, 4($sp)
	sw	$a1, 8($sp)
	#Calculate
	sub $v0, $a0, $a1
	
	j exit_sub
	
	exit_sub:
		lw	$ra, ($sp)
		lw	$a0, 4($sp)
		lw	$a1, 8($sp)
		addi	$sp, $sp, 12
	
		jr $ra

print_array:
	addi $t0, $0, 0
	add $t1, $0, $s0
loop_print:
	addi $v0, $0, 1
	lw $a0, ($t1)
	syscall
	addi $v0, $0, 11
	addi $a0, $0, 10
	syscall
	addi $t1, $t1, 4
	addi $t0, $t0, 1
	blt $t0, 10, loop_print
Exit:
	addi $v0, $0, 10
	syscall
	
