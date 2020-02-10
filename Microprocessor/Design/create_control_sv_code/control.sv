6'b000000:	// ld
begin
	controls[30]	=	1'b0;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b1;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b00;
	controls[18:17]	=	2'b00;
	controls[16]	=	1'b0;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b00;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b000001:	// str
begin
	controls[30]	=	1'b0;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b0;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b00;
	controls[18:17]	=	2'b00;
	controls[16]	=	1'b0;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b1;
	controls[5:4]	=	2'b00;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b000010:	// add
begin
	controls[30]	=	1'b0;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b1;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b00;
	controls[18:17]	=	2'b00;
	controls[16]	=	1'b1;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b01;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b000011:	// sub
begin
	controls[30]	=	1'b0;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b1;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b00;
	controls[18:17]	=	2'b01;
	controls[16]	=	1'b1;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b01;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b000100:	// and
begin
	controls[30]	=	1'b0;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b1;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b00;
	controls[18:17]	=	2'b10;
	controls[16]	=	1'b1;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b01;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b000101:	// or
begin
	controls[30]	=	1'b0;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b1;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b00;
	controls[18:17]	=	2'b11;
	controls[16]	=	1'b1;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b01;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b000110:	// mov
begin
	controls[30]	=	1'b0;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b1;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b00;
	controls[18:17]	=	2'b00;
	controls[16]	=	1'b0;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b10;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b000111:	// cmp
begin
	controls[30]	=	1'b0;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b0;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b00;
	controls[18:17]	=	2'b01;
	controls[16]	=	1'b1;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b00;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b001000:	// jz
begin
	controls[30]	=	1'b1;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b0;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b00;
	controls[18:17]	=	2'b00;
	controls[16]	=	1'b0;
	controls[15]	=	1'b1;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b00;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b001001:	// jmp
begin
	controls[30]	=	1'b0;
	controls[29:28]	=	2'b01;
	controls[27]	=	1'b0;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b00;
	controls[18:17]	=	2'b00;
	controls[16]	=	1'b0;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b00;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b001010:	// movi
begin
	controls[30]	=	1'b1;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b1;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b00;
	controls[18:17]	=	2'b00;
	controls[16]	=	1'b0;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b11;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b001011:	// addi
begin
	controls[30]	=	1'b1;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b1;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b01;
	controls[18:17]	=	2'b00;
	controls[16]	=	1'b1;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b01;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b001100:	// subi
begin
	controls[30]	=	1'b1;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b1;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b01;
	controls[18:17]	=	2'b01;
	controls[16]	=	1'b1;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b01;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b001101:	// andi
begin
	controls[30]	=	1'b1;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b1;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b01;
	controls[18:17]	=	2'b10;
	controls[16]	=	1'b1;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b01;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b001110:	// ori
begin
	controls[30]	=	1'b1;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b1;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b01;
	controls[18:17]	=	2'b11;
	controls[16]	=	1'b1;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b01;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b001111:	// push
begin
	controls[30]	=	1'b0;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b0;
	controls[26]	=	1'b1;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b10;
	controls[18:17]	=	2'b00;
	controls[16]	=	1'b0;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b1;
	controls[5:4]	=	2'b00;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b010000:	// pop
begin
	controls[30]	=	1'b0;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b1;
	controls[26]	=	1'b1;
	controls[25]	=	1'b1;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b10;
	controls[18:17]	=	2'b01;
	controls[16]	=	1'b0;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b00;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b010001:	// call
begin
	controls[30]	=	1'b0;
	controls[29:28]	=	2'b01;
	controls[27]	=	1'b0;
	controls[26]	=	1'b1;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b01;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b10;
	controls[18:17]	=	2'b00;
	controls[16]	=	1'b0;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b1;
	controls[5:4]	=	2'b00;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b010010:	// return
begin
	controls[30]	=	1'b0;
	controls[29:28]	=	2'b10;
	controls[27]	=	1'b0;
	controls[26]	=	1'b1;
	controls[25]	=	1'b1;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b10;
	controls[18:17]	=	2'b01;
	controls[16]	=	1'b0;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b00;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b010011:	// jb
begin
	controls[30]	=	1'b1;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b0;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b00;
	controls[18:17]	=	2'b00;
	controls[16]	=	1'b0;
	controls[15]	=	1'b0;
	controls[14]	=	1'b1;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b00;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b010100:	// jbe
begin
	controls[30]	=	1'b1;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b0;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b00;
	controls[18:17]	=	2'b00;
	controls[16]	=	1'b0;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b1;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b00;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b010101:	// ja
begin
	controls[30]	=	1'b1;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b0;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b00;
	controls[18:17]	=	2'b00;
	controls[16]	=	1'b0;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b1;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b00;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b010110:	// jae
begin
	controls[30]	=	1'b1;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b0;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b00;
	controls[18:17]	=	2'b00;
	controls[16]	=	1'b0;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b1;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b00;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b010111:	// jg
begin
	controls[30]	=	1'b1;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b0;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b00;
	controls[18:17]	=	2'b00;
	controls[16]	=	1'b0;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b1;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b00;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b011000:	// jge
begin
	controls[30]	=	1'b1;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b0;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b00;
	controls[18:17]	=	2'b00;
	controls[16]	=	1'b0;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b1;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b00;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b011001:	// jl
begin
	controls[30]	=	1'b1;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b0;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b00;
	controls[18:17]	=	2'b00;
	controls[16]	=	1'b0;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b1;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b00;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b011010:	// jle
begin
	controls[30]	=	1'b1;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b0;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b00;
	controls[18:17]	=	2'b00;
	controls[16]	=	1'b0;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b1;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b00;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b011011:	// cbt
begin
	controls[30]	=	1'b0;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b0;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b01;
	controls[20:19]	=	2'b10;
	controls[18:17]	=	2'b01;
	controls[16]	=	1'b1;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b00;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b011100:	// trf
begin
	controls[30]	=	1'b0;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b1;
	controls[26]	=	1'b1;
	controls[25]	=	1'b1;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b10;
	controls[18:17]	=	2'b01;
	controls[16]	=	1'b0;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b00;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b1;
end

6'b011101:	// pr
begin
	controls[30]	=	1'b0;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b0;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b00;
	controls[18:17]	=	2'b00;
	controls[16]	=	1'b0;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b00;
	controls[3]	=	1'b1;
	controls[2]	=	1'b1;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b011110:	// cbr
begin
	controls[30]	=	1'b0;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b0;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b10;
	controls[20:19]	=	2'b10;
	controls[18:17]	=	2'b01;
	controls[16]	=	1'b1;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b00;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

6'b011111:	// rtr
begin
	controls[30]	=	1'b0;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b0;
	controls[26]	=	1'b1;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b10;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b10;
	controls[18:17]	=	2'b00;
	controls[16]	=	1'b0;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b1;
	controls[5:4]	=	2'b00;
	controls[3]	=	1'b0;
	controls[2]	=	1'b0;
	controls[1]	=	1'b1;
	controls[0]	=	1'b0;
end

6'b100000:	// rr
begin
	controls[30]	=	1'b0;
	controls[29:28]	=	2'b00;
	controls[27]	=	1'b0;
	controls[26]	=	1'b0;
	controls[25]	=	1'b0;
	controls[24:23]	=	2'b00;
	controls[22:21]	=	2'b00;
	controls[20:19]	=	2'b00;
	controls[18:17]	=	2'b00;
	controls[16]	=	1'b0;
	controls[15]	=	1'b0;
	controls[14]	=	1'b0;
	controls[13]	=	1'b0;
	controls[12]	=	1'b0;
	controls[11]	=	1'b0;
	controls[10]	=	1'b0;
	controls[9]	=	1'b0;
	controls[8]	=	1'b0;
	controls[7]	=	1'b0;
	controls[6]	=	1'b0;
	controls[5:4]	=	2'b00;
	controls[3]	=	1'b1;
	controls[2]	=	1'b0;
	controls[1]	=	1'b0;
	controls[0]	=	1'b0;
end

