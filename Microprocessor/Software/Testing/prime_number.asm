	movi reg0, #0	; initalise the stack pointer
	movi reg5, #11	; value to determine if prime
	call check_prime
	jmp end
check_prime:
	movi reg6, #2	; this is the 1st number that will divide the to_be_prime_number
	movi reg7, #1	; move 1
	sub reg5, reg7	; this should hold the upper limit - which will basically be up to the to_be_prime_number being divided
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
