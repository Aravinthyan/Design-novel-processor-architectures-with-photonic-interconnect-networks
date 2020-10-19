	movi reg0, #0
	movi reg1, #10
	movi reg2, #2
	call division
	jmp end
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
	addi reg2, #0
	addi reg1, #0
	jmp end
