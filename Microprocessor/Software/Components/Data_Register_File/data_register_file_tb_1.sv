module data_register_file_tb_1;

	logic clk;
	logic write_enable;
	logic address_1;
	logic address_2;
	logic write_data;
	logic read_data;

	data_register_file #(1, 1) rf_test(clk, write_enable, address_1, address_2, write_data, read_data);

	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin

		write_enable = 1'b1;
	
		address_1 = 1'b0;	
		write_data = 1'b1;
		#100ps;
		
		address_1 = 1'b1;	
		write_data = 1'b0;
		#100ps;

		write_enable = 1'b0;
		
		address_2 = 1'b0;
		#100ps;
		
		address_2 = 1'b1;
		#100ps;

	end

endmodule
