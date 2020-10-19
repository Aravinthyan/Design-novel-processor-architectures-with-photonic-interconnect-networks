	movi reg0, #0
	movi reg1, #0
	movi reg2, #1
loop:
	push reg2
	add reg1, reg2
	pop reg1
	addi reg1, #0
	jmp loop
