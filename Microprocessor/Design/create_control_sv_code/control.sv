6'b000000:	// ld
begin
	controls[23] = 1'b0;
	controls[22:21] = 2'b00;
	controls[20] = 1'b1;
	controls[19] = 1'b0;
	controls[18] = 1'b0;
	controls[17] = 1'b0;
	controls[16:15] = 2'bxx;
	controls[14:13] = 2'bxx;
	controls[12] = 1'b0;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b0;
	controls[1:0] = 2'b00;
end

6'b000001:	// str
begin
	controls[23] = 1'b0;
	controls[22:21] = 2'b00;
	controls[20] = 1'b0;
	controls[19] = 1'b0;
	controls[18] = 1'b0;
	controls[17] = 1'b0;
	controls[16:15] = 2'bxx;
	controls[14:13] = 2'bxx;
	controls[12] = 1'b0;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b1;
	controls[1:0] = 2'bxx;
end

6'b000010:	// add
begin
	controls[23] = 1'b0;
	controls[22:21] = 2'b00;
	controls[20] = 1'b1;
	controls[19] = 1'b0;
	controls[18] = 1'b0;
	controls[17] = 1'b0;
	controls[16:15] = 2'b00;
	controls[14:13] = 2'b00;
	controls[12] = 1'b1;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b0;
	controls[1:0] = 2'b01;
end

6'b000011:	// sub
begin
	controls[23] = 1'b0;
	controls[22:21] = 2'b00;
	controls[20] = 1'b1;
	controls[19] = 1'b0;
	controls[18] = 1'b0;
	controls[17] = 1'b0;
	controls[16:15] = 2'b00;
	controls[14:13] = 2'b01;
	controls[12] = 1'b1;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b0;
	controls[1:0] = 2'b01;
end

6'b000100:	// and
begin
	controls[23] = 1'b0;
	controls[22:21] = 2'b00;
	controls[20] = 1'b1;
	controls[19] = 1'b0;
	controls[18] = 1'b0;
	controls[17] = 1'b0;
	controls[16:15] = 2'b00;
	controls[14:13] = 2'b10;
	controls[12] = 1'b1;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b0;
	controls[1:0] = 2'b01;
end

6'b000101:	// or
begin
	controls[23] = 1'b0;
	controls[22:21] = 2'b00;
	controls[20] = 1'b1;
	controls[19] = 1'b0;
	controls[18] = 1'b0;
	controls[17] = 1'b0;
	controls[16:15] = 2'b00;
	controls[14:13] = 2'b11;
	controls[12] = 1'b1;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b0;
	controls[1:0] = 2'b01;
end

6'b000110:	// mov
begin
	controls[23] = 1'b0;
	controls[22:21] = 2'b00;
	controls[20] = 1'b1;
	controls[19] = 1'b0;
	controls[18] = 1'b0;
	controls[17] = 1'b0;
	controls[16:15] = 2'bxx;
	controls[14:13] = 2'bxx;
	controls[12] = 1'b0;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b0;
	controls[1:0] = 2'b10;
end

6'b000111:	// cmp
begin
	controls[23] = 1'b0;
	controls[22:21] = 2'b00;
	controls[20] = 1'b0;
	controls[19] = 1'b0;
	controls[18] = 1'b0;
	controls[17] = 1'b0;
	controls[16:15] = 2'b00;
	controls[14:13] = 2'b01;
	controls[12] = 1'b1;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b0;
	controls[1:0] = 2'bxx;
end

6'b001000:	// jz
begin
	controls[23] = 1'b1;
	controls[22:21] = 2'b00;
	controls[20] = 1'b0;
	controls[19] = 1'b0;
	controls[18] = 1'b0;
	controls[17] = 1'b0;
	controls[16:15] = 2'bxx;
	controls[14:13] = 2'bxx;
	controls[12] = 1'b0;
	controls[11] = 1'b1;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b0;
	controls[1:0] = 2'bxx;
end

6'b001001:	// jmp
begin
	controls[23] = 1'bx;
	controls[22:21] = 2'b01;
	controls[20] = 1'b0;
	controls[19] = 1'b0;
	controls[18] = 1'b0;
	controls[17] = 1'b0;
	controls[16:15] = 2'bxx;
	controls[14:13] = 2'bxx;
	controls[12] = 1'b0;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b0;
	controls[1:0] = 2'bxx;
end

6'b001010:	// movi
begin
	controls[23] = 1'b1;
	controls[22:21] = 2'b00;
	controls[20] = 1'b1;
	controls[19] = 1'b0;
	controls[18] = 1'b0;
	controls[17] = 1'bx;
	controls[16:15] = 2'bxx;
	controls[14:13] = 2'bxx;
	controls[12] = 1'b0;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b0;
	controls[1:0] = 2'b11;
end

6'b001011:	// addi
begin
	controls[23] = 1'b1;
	controls[22:21] = 2'b00;
	controls[20] = 1'b1;
	controls[19] = 1'b0;
	controls[18] = 1'b0;
	controls[17] = 1'bx;
	controls[16:15] = 2'b01;
	controls[14:13] = 2'b00;
	controls[12] = 1'b1;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b0;
	controls[1:0] = 2'b01;
end

6'b001100:	// subi
begin
	controls[23] = 1'b1;
	controls[22:21] = 2'b00;
	controls[20] = 1'b1;
	controls[19] = 1'b0;
	controls[18] = 1'b0;
	controls[17] = 1'bx;
	controls[16:15] = 2'b01;
	controls[14:13] = 2'b01;
	controls[12] = 1'b1;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b0;
	controls[1:0] = 2'b01;
end

6'b001101:	// andi
begin
	controls[23] = 1'b1;
	controls[22:21] = 2'b00;
	controls[20] = 1'b1;
	controls[19] = 1'b0;
	controls[18] = 1'b0;
	controls[17] = 1'bx;
	controls[16:15] = 2'b01;
	controls[14:13] = 2'b10;
	controls[12] = 1'b1;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b0;
	controls[1:0] = 2'b01;
end

6'b001110:	// ori
begin
	controls[23] = 1'b1;
	controls[22:21] = 2'b00;
	controls[20] = 1'b1;
	controls[19] = 1'b0;
	controls[18] = 1'b0;
	controls[17] = 1'b0;
	controls[16:15] = 2'b01;
	controls[14:13] = 2'b11;
	controls[12] = 1'b1;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b0;
	controls[1:0] = 2'b01;
end

6'b001111:	// push
begin
	controls[23] = 1'b0;
	controls[22:21] = 2'b00;
	controls[20] = 1'b0;
	controls[19] = 1'b1;
	controls[18] = 1'b0;
	controls[17] = 1'b0;
	controls[16:15] = 2'b10;
	controls[14:13] = 2'b00;
	controls[12] = 1'b0;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b1;
	controls[1:0] = 2'bxx;
end

6'b010000:	// pop
begin
	controls[23] = 1'b0;
	controls[22:21] = 2'b00;
	controls[20] = 1'b1;
	controls[19] = 1'b1;
	controls[18] = 1'b1;
	controls[17] = 1'b0;
	controls[16:15] = 2'b10;
	controls[14:13] = 2'b01;
	controls[12] = 1'b0;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b0;
	controls[1:0] = 2'b00;
end

6'b010001:	// call
begin
	controls[23] = 1'bx;
	controls[22:21] = 2'b01;
	controls[20] = 1'b0;
	controls[19] = 1'b1;
	controls[18] = 1'b0;
	controls[17] = 1'b1;
	controls[16:15] = 2'b10;
	controls[14:13] = 2'b00;
	controls[12] = 1'b0;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b1;
	controls[1:0] = 2'bxx;
end

6'b010010:	// return
begin
	controls[23] = 1'bx;
	controls[22:21] = 2'b10;
	controls[20] = 1'b0;
	controls[19] = 1'b1;
	controls[18] = 1'b1;
	controls[17] = 1'bx;
	controls[16:15] = 2'b10;
	controls[14:13] = 2'b01;
	controls[12] = 1'b0;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b0;
	controls[1:0] = 2'b00;
end

6'b010011:	// jb
begin
	controls[23] = 1'b1;
	controls[22:21] = 2'b00;
	controls[20] = 1'b0;
	controls[19] = 1'b0;
	controls[18] = 1'b0;
	controls[17] = 1'b0;
	controls[16:15] = 2'bxx;
	controls[14:13] = 2'bxx;
	controls[12] = 1'b0;
	controls[11] = 1'b0;
	controls[10] = 1'b1;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b0;
	controls[1:0] = 2'bxx;
end

6'b010100:	// jbe
begin
	controls[23] = 1'b1;
	controls[22:21] = 2'b00;
	controls[20] = 1'b0;
	controls[19] = 1'b0;
	controls[18] = 1'b0;
	controls[17] = 1'b0;
	controls[16:15] = 2'bxx;
	controls[14:13] = 2'bxx;
	controls[12] = 1'b0;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b1;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b0;
	controls[1:0] = 2'bxx;
end

6'b010101:	// ja
begin
	controls[23] = 1'b1;
	controls[22:21] = 2'b00;
	controls[20] = 1'b0;
	controls[19] = 1'b0;
	controls[18] = 1'b0;
	controls[17] = 1'b0;
	controls[16:15] = 2'bxx;
	controls[14:13] = 2'bxx;
	controls[12] = 1'b0;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b1;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b0;
	controls[1:0] = 2'bxx;
end

6'b010110:	// jae
begin
	controls[23] = 1'b1;
	controls[22:21] = 2'b00;
	controls[20] = 1'b0;
	controls[19] = 1'b0;
	controls[18] = 1'b0;
	controls[17] = 1'b0;
	controls[16:15] = 2'bxx;
	controls[14:13] = 2'bxx;
	controls[12] = 1'b0;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b1;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b0;
	controls[1:0] = 2'bxx;
end

6'b010111:	// jg
begin
	controls[23] = 1'b1;
	controls[22:21] = 2'b00;
	controls[20] = 1'b0;
	controls[19] = 1'b0;
	controls[18] = 1'b0;
	controls[17] = 1'b0;
	controls[16:15] = 2'bxx;
	controls[14:13] = 2'bxx;
	controls[12] = 1'b0;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b1;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b0;
	controls[1:0] = 2'bxx;
end

6'b011000:	// jge
begin
	controls[23] = 1'b1;
	controls[22:21] = 2'b00;
	controls[20] = 1'b0;
	controls[19] = 1'b0;
	controls[18] = 1'b0;
	controls[17] = 1'b0;
	controls[16:15] = 2'bxx;
	controls[14:13] = 2'bxx;
	controls[12] = 1'b0;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b1;
	controls[4] = 1'b0;
	controls[3] = 1'b0;
	controls[2] = 1'b0;
	controls[1:0] = 2'bxx;
end

6'b011001:	// jl
begin
	controls[23] = 1'b1;
	controls[22:21] = 2'b00;
	controls[20] = 1'b0;
	controls[19] = 1'b0;
	controls[18] = 1'b0;
	controls[17] = 1'b0;
	controls[16:15] = 2'bxx;
	controls[14:13] = 2'bxx;
	controls[12] = 1'b0;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b1;
	controls[3] = 1'b0;
	controls[2] = 1'b0;
	controls[1:0] = 2'bxx;
end

6'b011010:	// jle
begin
	controls[23] = 1'b1;
	controls[22:21] = 2'b00;
	controls[20] = 1'b0;
	controls[19] = 1'b0;
	controls[18] = 1'b0;
	controls[17] = 1'b0;
	controls[16:15] = 2'bxx;
	controls[14:13] = 2'bxx;
	controls[12] = 1'b0;
	controls[11] = 1'b0;
	controls[10] = 1'b0;
	controls[9] = 1'b0;
	controls[8] = 1'b0;
	controls[7] = 1'b0;
	controls[6] = 1'b0;
	controls[5] = 1'b0;
	controls[4] = 1'b0;
	controls[3] = 1'b1;
	controls[2] = 1'b0;
	controls[1:0] = 2'bxx;
end

