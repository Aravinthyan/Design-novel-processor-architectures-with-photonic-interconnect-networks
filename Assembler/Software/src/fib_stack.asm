	movi reg0, #0
	movi reg1, #0
	movi reg2, #1
loop:
	push reg2
	pop reg1
	addi reg2, #1
	jmp loop
