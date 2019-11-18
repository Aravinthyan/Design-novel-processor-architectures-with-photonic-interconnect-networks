	movi reg0, #0
	movi reg1, #10
	movi reg2, #10
	call test
	addi reg1, #10
test:
	addi reg1, #10
	subi reg2, #10
	return
