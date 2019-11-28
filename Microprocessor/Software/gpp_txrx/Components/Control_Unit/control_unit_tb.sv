module control_unit_tb;

	logic clk;
	logic [5:0]opcode;
	logic pc_increment_control;
	logic [1:0] pc_control;
	logic general_register_write_enable;
	logic stack_write_enable;
	logic stack_control;
	logic write_data_enable;
	logic [1:0] ALU_soure_2;
	logic [1:0] ALU_control;
	logic flags_write_enable;
	logic jump_zero_control;
	logic jump_below_control;
	logic jump_below_equal_control;
	logic jump_above_control;
	logic jump_above_equal_control;
	logic jump_greater_control;
	logic jump_greater_equal_control;
	logic jump_less_control;
	logic jump_less_equal_control;
	logic memory_write_enable;
	logic [1:0] general_register_result_select;

	control_unit control_unit0(opcode, 
				   pc_increment_control,
				   pc_control,
				   general_register_write_enable,
				   stack_write_enable,
				   stack_control,
				   write_data_enable,
				   ALU_soure_2,
				   ALU_control,
				   flags_write_enable,
				   jump_zero_control,
				   jump_below_control,
				   jump_below_equal_control,
				   jump_above_control,
				   jump_above_equal_control,
				   jump_greater_control,
				   jump_greater_equal_control,
				   jump_less_control,
				   jump_less_equal_control,
				   memory_write_enable,
				   general_register_result_select);

	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin
		opcode = 6'b000000;
		#100ps;

		opcode = 6'b000001;
		#100ps;

		opcode = 6'b000010;
		#100ps;

		opcode = 6'b000011;
		#100ps;
		
		opcode = 6'b000100;
		#100ps;

		opcode = 6'b000101;
		#100ps;

		opcode = 6'b000110;
		#100ps;

		opcode = 6'b000111;
		#100ps;

		opcode = 6'b001000;
		#100ps;

		opcode = 6'b001001;
		#100ps;

		opcode = 6'b001010;
		#100ps;

		opcode = 6'b001011;
		#100ps;

		opcode = 6'b001100;
		#100ps;

		opcode = 6'b001101;
		#100ps;

		opcode = 6'b001110;
		#100ps;

		opcode = 6'b001111;
		#100ps;

		opcode = 6'b010000;
		#100ps;

		opcode = 6'b010001;
		#100ps;

		opcode = 6'b010010;
		#100ps;
		
		opcode = 6'b010011;
		#100ps;
	
		opcode = 6'b010100;
		#100ps;
		
		opcode = 6'b010101;
		#100ps;
		
		opcode = 6'b010110;
		#100ps;
		
		opcode = 6'b010111;
		#100ps;
	
		opcode = 6'b011000;
		#100ps;
		
		opcode = 6'b011001;
		#100ps;
		
		opcode = 6'b011010;
		#100ps;
	end

endmodule
