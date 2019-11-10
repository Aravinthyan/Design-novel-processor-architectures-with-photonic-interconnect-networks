module register_file_tb_1;

	logic clk;
	logic general_register_write_enable;
	logic stack_write_enable;
	logic [1:0]address_1;
	logic [1:0]address_2;
	logic [1:0]address_3;
	logic general_register_write_data;
	logic stack_register_write_data;
	logic read_data_1;
	logic read_data_2;

	register_file #(2, 1) rf_test(clk, general_register_write_enable, stack_write_enable, address_1, address_2, address_3, general_register_write_data, stack_register_write_data, read_data_1, read_data_2);

	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin

		general_register_write_enable = 1'b1;
		stack_write_enable = 1'b1;
		
		stack_register_write_data = 1'b0;
		#200ps;

		address_3 = 2'b01;
		general_register_write_data = 1'b1;
		#100ps;

		address_3 = 2'b10;
		general_register_write_data = 1'b1;
		#100ps;
	
		address_3 = 2'b11;
		general_register_write_data = 1'b0;
		#100ps;

		general_register_write_enable = 1'b0;
		stack_write_enable = 1'b0;
		
		address_1 = 2'b00;
		address_2 = 2'b00;
		#100ps;
		
		address_1 = 2'b01;
		address_2 = 2'b01;
		#100ps;

		address_1 = 2'b10;
		address_2 = 2'b10;
		#100ps;
		
		address_1 = 2'b11;
		address_2 = 2'b11;
		#100ps;

	end

endmodule
