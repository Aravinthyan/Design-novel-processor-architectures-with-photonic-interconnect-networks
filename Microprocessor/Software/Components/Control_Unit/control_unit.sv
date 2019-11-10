module control_unit
(
	input logic [5:0]opcode,
	output logic stack_control,
	output logic pc_increment_control,
	output logic [1:0]pc_control,
	output logic general_register_write_enable,
	output logic stack_write_enable,
	output logic write_data_enable,
	output logic [1:0]ALU_soure_2,
	output logic [1:0]ALU_control,
	output logic branch,
	output logic memory_write_enable,
	output logic [1:0]general_register_result_select
);

	logic [14:0] controls;

	always_comb
	begin
		stack_control = controls[14];
		pc_increment_control = controls[13];	
		pc_control = controls[12:11];
		general_register_write_enable = controls[10];
		stack_write_enable = controls[9];
		write_data_enable = controls[8];
		ALU_soure_2 = controls[7:6];
		ALU_control = controls[5:4];
		branch = controls[3];
		memory_write_enable = controls[2];
		general_register_result_select = controls[1:0];
	end

	always_comb
	begin
		case(opcode)
			6'b000000:	// ld
			begin
				controls[14] = 1'b0;
				controls[13] = 1'b0;
				controls[12:11] = 2'b00;
				controls[10] = 1'b1;
				controls[9] = 1'b0;
				controls[8] = 1'b0;
				controls[7:6] = 2'bxx;
				controls[5:4] = 2'bxx;
				controls[3] = 1'b0;
				controls[2] = 1'b0;
				controls[1:0] = 2'b00;
			end
			6'b000001:	// str
			begin
				controls[14] = 1'b0;
				controls[13] = 1'b0;
				controls[12:11] = 2'b00;
				controls[10] = 1'b0;
				controls[9] = 1'b0;
				controls[8] = 1'b0;
				controls[7:6] = 2'bxx;
				controls[5:4] = 2'bxx;
				controls[3] = 1'b0;
				controls[2] = 1'b1;
				controls[1:0] = 2'bxx;
			end
			6'b000010:	// add
			begin
				controls[14] = 1'b0;
				controls[13] = 1'b0;
				controls[12:11] = 2'b00;
				controls[10] = 1'b1;
				controls[9] = 1'b0;
				controls[8] = 1'b0;
				controls[7:6] = 2'b00;
				controls[5:4] = 2'b00;
				controls[3] = 1'b0;
				controls[2] = 1'b0;
				controls[1:0] = 2'b01;
			end
			6'b000011:	// sub
			begin
				controls[14] = 1'b0;
				controls[13] = 1'b0;
				controls[12:11] = 2'b00;
				controls[10] = 1'b1;
				controls[9] = 1'b0;
				controls[8] = 1'b0;
				controls[7:6] = 2'b00;
				controls[5:4] = 2'b01;
				controls[3] = 1'b0;
				controls[2] = 1'b0;
				controls[1:0] = 2'b01;
			end
			6'b000100:	// and
			begin
				controls[14] = 1'b0;
				controls[13] = 1'b0;
				controls[12:11] = 2'b00;
				controls[10] = 1'b1;
				controls[9] = 1'b0;
				controls[8] = 1'b0;
				controls[7:6] = 2'b00;
				controls[5:4] = 2'b10;
				controls[3] = 1'b0;
				controls[2] = 1'b0;
				controls[1:0] = 2'b01;
			end
			6'b000101:	// or
			begin
				controls[14] = 1'b0;
				controls[13] = 1'b0;
				controls[12:11] = 2'b00;
				controls[10] = 1'b1;
				controls[9] = 1'b0;
				controls[8] = 1'b0;
				controls[7:6] = 2'b00;
				controls[5:4] = 2'b11;
				controls[3] = 1'b0;
				controls[2] = 1'b0;
				controls[1:0] = 2'b01;
			end	
			6'b000110:	// mov
			begin
				controls[14] = 1'b0;
				controls[13] = 1'b0;
				controls[12:11] = 2'b00;
				controls[10] = 1'b1;
				controls[9] = 1'b0;
				controls[8] = 1'b0;
				controls[7:6] = 2'bxx;
				controls[5:4] = 2'bxx;
				controls[3] = 1'b0;
				controls[2] = 1'b0;
				controls[1:0] = 2'b10;
			end
			6'b000111:	// cmp
			begin
				controls[14] = 1'b0;
				controls[13] = 1'b0;
				controls[12:11] = 2'b00;
				controls[10] = 1'b0;
				controls[9] = 1'b0;
				controls[8] = 1'b0;
				controls[7:6] = 2'b00;
				controls[5:4] = 2'b01;
				controls[3] = 1'b0;
				controls[2] = 1'b0;
				controls[1:0] = 2'bxx;
			end
			6'b001000:	// jz
			begin
				controls[14] = 1'b0;
				controls[13] = 1'b1;
				controls[12:11] = 2'b00;
				controls[10] = 1'b0;
				controls[9] = 1'b0;
				controls[8] = 1'b0;
				controls[7:6] = 2'bxx;
				controls[5:4] = 2'bxx;
				controls[3] = 1'b1;
				controls[2] = 1'b0;
				controls[1:0] = 2'bxx;
			end
			6'b001001:	// jmp
			begin
				controls[14] = 1'b0;
				controls[13] = 1'bx;
				controls[12:11] = 2'b01;
				controls[10] = 1'b0;
				controls[9] = 1'b0;
				controls[8] = 1'b0;
				controls[7:6] = 2'bxx;
				controls[5:4] = 2'bxx;
				controls[3] = 1'b0;
				controls[2] = 1'b0;
				controls[1:0] = 2'bxx;
			end
			6'b001010:	// movi
			begin
				controls[14] = 1'b0;
				controls[13] = 1'b1;
				controls[12:11] = 2'b00;
				controls[10] = 1'b1;
				controls[9] = 1'b0;
				controls[8] = 1'bx;
				controls[7:6] = 2'bxx;
				controls[5:4] = 2'bxx;
				controls[3] = 1'b0;
				controls[2] = 1'b0;
				controls[1:0] = 2'b11;
			end
			6'b001011:	// addi
			begin
				controls[14] = 1'b0;
				controls[13] = 1'b1;
				controls[12:11] = 2'b00;
				controls[10] = 1'b1;
				controls[9] = 1'b0;
				controls[8] = 1'bx;
				controls[7:6] = 2'b01;
				controls[5:4] = 2'b00;
				controls[3] = 1'b0;
				controls[2] = 1'b0;
				controls[1:0] = 2'b01;
			end
			6'b001100:	// subi
			begin
				controls[14] = 1'b0;
				controls[13] = 1'b1;
				controls[12:11] = 2'b00;
				controls[10] = 1'b1;
				controls[9] = 1'b0;
				controls[8] = 1'bx;
				controls[7:6] = 2'b01;
				controls[5:4] = 2'b01;
				controls[3] = 1'b0;
				controls[2] = 1'b0;
				controls[1:0] = 2'b01;
			end
			6'b001101:	// andi
			begin
				controls[14] = 1'b0;
				controls[13] = 1'b1;
				controls[12:11] = 2'b00;
				controls[10] = 1'b1;
				controls[9] = 1'b0;
				controls[8] = 1'bx;
				controls[7:6] = 2'b01;
				controls[5:4] = 2'b10;
				controls[3] = 1'b0;
				controls[2] = 1'b0;
				controls[1:0] = 2'b01;
			end
			6'b001110:	// ori
			begin
				controls[14] = 1'b0;
				controls[13] = 1'b1;
				controls[12:11] = 2'b00;
				controls[10] = 1'b1;
				controls[9] = 1'b0;
				controls[8] = 1'bx;
				controls[7:6] = 2'b01;
				controls[5:4] = 2'b11;
				controls[3] = 1'b0;
				controls[2] = 1'b0;
				controls[1:0] = 2'b01;
			end
			6'b001111:	// push
			begin
				controls[14] = 1'b0;
				controls[13] = 1'b0;
				controls[12:11] = 2'b00;
				controls[10] = 1'b0;
				controls[9] = 1'b1;
				controls[8] = 1'b0;
				controls[7:6] = 2'b10;
				controls[5:4] = 2'b00;
				controls[3] = 1'b0;
				controls[2] = 1'b1;
				controls[1:0] = 2'bxx;
			end
			6'b010000:	// pop
			begin
				controls[14] = 1'b1;
				controls[13] = 1'b0;
				controls[12:11] = 2'b00;
				controls[10] = 1'b1;
				controls[9] = 1'b1;
				controls[8] = 1'b0;
				controls[7:6] = 2'b10;
				controls[5:4] = 2'b01;
				controls[3] = 1'b0;
				controls[2] = 1'b0;
				controls[1:0] = 2'b00;
			end
			6'b010001:	// call
			begin
				controls[14] = 1'b0;
				controls[13] = 1'bx;
				controls[12:11] = 2'b01;
				controls[10] = 1'b0;
				controls[9] = 1'b1;
				controls[8] = 1'b1;
				controls[7:6] = 2'b10;
				controls[5:4] = 2'b00;
				controls[3] = 1'b0;
				controls[2] = 1'b1;
				controls[1:0] = 2'bxx;
			end
			6'b010010:	// return
			begin
				controls[14] = 1'b1;
				controls[13] = 1'bx;
				controls[12:11] = 2'b10;
				controls[10] = 1'b0;
				controls[9] = 1'b1;
				controls[8] = 1'bx;
				controls[7:6] = 2'b10;
				controls[5:4] = 2'b01;
				controls[3] = 1'b0;
				controls[2] = 1'b0;
				controls[1:0] = 2'b00;
			end
		endcase
	end

endmodule
