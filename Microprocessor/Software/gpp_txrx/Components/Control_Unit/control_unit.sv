module control_unit
(
	input logic [5:0] opcode,
	output logic pc_increment_control,
	output logic [1:0] pc_control,
	output logic general_register_write_enable,
	output logic stack_write_enable,
	output logic stack_control,
	output logic write_data_enable,
	output logic [1:0] ALU_soure_2,
	output logic [1:0] ALU_control,
	output logic flags_write_enable,
	output logic jump_zero_control,
	output logic jump_below_control,
	output logic jump_below_equal_control,
	output logic jump_above_control,
	output logic jump_above_equal_control,
	output logic jump_greater_control,
	output logic jump_greater_equal_control,
	output logic jump_less_control,
	output logic jump_less_equal_control,
	output logic memory_write_enable,
	output logic [1:0] general_register_result_select
);
	logic [23:0] controls;
	
	always_comb
	begin
		pc_increment_control = controls[23];
		pc_control = controls[22:21];
		general_register_write_enable = controls[20];
		stack_write_enable = controls[19];
		stack_control = controls[18];
		write_data_enable = controls[17];
		ALU_soure_2 = controls[16:15];
		ALU_control = controls[14:13];
		flags_write_enable = controls[12];
		jump_zero_control = controls[11];
		jump_below_control = controls[10];
		jump_below_equal_control = controls[9];
		jump_above_control = controls[8];
		jump_above_equal_control = controls[7];
		jump_greater_control = controls[6];
		jump_greater_equal_control = controls[5];
		jump_less_control = controls[4];
		jump_less_equal_control = controls[3];
		memory_write_enable = controls[2];
		general_register_result_select = controls[1:0];
	end

	always_comb
	begin
		case(opcode)
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
		endcase
	end

endmodule
