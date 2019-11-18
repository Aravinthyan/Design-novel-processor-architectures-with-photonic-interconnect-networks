	movi reg1, #5
	movi reg2, #5
	cmp reg1, reg2
	subi reg1, #1
	cmp reg1, reg2
	jz same
	jmp not_same
same:
	addi reg1, #1
not_same:
	addi reg2, #2
