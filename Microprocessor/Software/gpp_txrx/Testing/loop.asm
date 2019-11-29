	movi reg0, #0	; initiailse stack pointer
	movi reg1, #5
	movi reg2, #0
loop:
	subi reg1, #1
	cmp reg1, reg2
	jz loop
	addi reg1, #0
