module control_unit_tb;

	logic clk;
	logic [5:0]opcode;
	logic stack_control;
	logic pc_increment_control;
	logic [1:0]pc_control;
	logic general_register_write_enable;
	logic stack_write_enable;
	logic write_data_enable;
	logic [1:0]ALU_source_2;
	logic [1:0]ALU_control;
	logic branch;
	logic memory_write_enable;
	logic [1:0]general_register_result_select;

	control_unit control_unit0(opcode, 
				   stack_control,
				   pc_increment_control, 
				   pc_control, 
				   general_register_write_enable, 
				   stack_write_enable, 
				   write_data_enable, 
				   ALU_source_2, 
				   ALU_control, 
				   branch, 
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
	end

endmodule
