	movi reg1, #10
	movi reg0, #0
	movi reg2, #3
	call test
	subi reg1, #1
test:
	addi reg2, #0
	addi reg1, #1
	return
	add reg1, reg2
