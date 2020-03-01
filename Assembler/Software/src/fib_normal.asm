	movi reg1, #0
	movi reg2, #1
loop:
	mov reg2, reg3
	add reg1, reg2 # reg2 = reg1 + reg2
	mov reg3, reg1
	jmp loop
	# if result goes above a certain value x then reset and start again
