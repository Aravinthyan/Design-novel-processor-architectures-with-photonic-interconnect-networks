	movi reg1, #0
again:	
	movi reg2, #0
	movi reg3, #60000
	movi reg4, #0
	movi reg5, #60000
top:
	addi reg1, #1
delay:
	addi reg2, #1
	cmp reg2, reg3
	jz find
	jmp delay
find:
	addi reg4, #1
	cmp reg4, reg5
	jz again
	movi reg2, #0
	jmp delay
