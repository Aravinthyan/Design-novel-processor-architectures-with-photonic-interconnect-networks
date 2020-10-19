	movi reg0, #0
	movi reg1, #10
	movi reg2, #11
	movi reg3, #12
	movi reg4, #13
	movi reg5, #4
	push reg5
	push reg4
	push reg3
	push reg2
	push reg1
	movi reg6, #0
	movi reg6, #0
	movi reg6, #0
	movi reg6, #0
	; compare the value to see if data cane be transferred
	cbt
	; if the result is not equal to zero then data cannot be transfered
	jz tranf
	jmp exit
	; transfer 5 packet data
tranf:
	trf
	trf
	trf
	trf
	trf
exit:
	movi reg6, #0