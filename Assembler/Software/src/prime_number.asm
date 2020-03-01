	movi reg0, #0	; initalise the stack pointer
	movi reg5, #4	; value to determine if prime
	call check_prime
	jmp end
check_prime:
	movi reg6, #2	; this is the 1st number that will divide the to_be_prime_number
	movi reg7, #1	; move 1
	sub reg5, reg7	; this should hold the upper limit
	movi reg8, #0
continue:
	mov reg5, reg1	; move dividend into reg1
	mov reg6, reg2	; move divisor into reg2
	call division	; divide
	cmp reg1, reg8	; check if remainder is 0
	jz not_prime	; if remainder is 0 then not a prime so flag output is 0
	addi reg6, #1	; increment for the next for the next divisor
	cmp reg6, reg5	; check if the divisor is equal to the dividend
	jz end_search	; if the above result is 0 then end the search and flag it as zero
	jmp continue	; else continue
not_prime:
	movi reg10, #0
	return
end_search:
	movi reg10, #1
	return
division:
	; pass into reg1 the dividend
	; pass into reg2 the divisor
	push reg3	; use reg3 as a check therefore save value
	push reg4	; reg4 will hold the quotient
	mov reg2, reg3	; move the divisor
	movi reg4, #0	; set the quotient to zero initially
divide:
	sub reg1, reg2	; dividend_cur(reg2) = dividend_prev(reg1) - divisor(reg2)
	mov reg2, reg1	; dividend_prev(reg1) = dividend_cur(reg2)
	mov reg3, reg2	; dividend_cur(reg2) = reg3
	addi reg4, #1	; increment quotient by 1
	cmp reg1, reg3	; compare reg1 to reg3
	jae divide	; if above or equal
	jmp divide_end	; else quit the sub routine
divide_end:
	mov reg4, reg2	; move the quotient into reg2
	; reg1 contains the remainder
	pop reg4
	pop reg3	; retrive old value of reg3
	return	
end:
	addi reg10, #0
	jmp end
