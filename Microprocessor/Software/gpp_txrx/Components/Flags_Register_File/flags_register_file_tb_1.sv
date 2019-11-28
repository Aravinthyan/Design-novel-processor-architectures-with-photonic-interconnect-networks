module flags_register_file_tb_1;

	logic clk;
	logic rx_write_enable;
	logic rtr_write_enable;
	logic address_1;
	logic address_2;
	logic address_3;
	logic read_data;

	flags_register_file #(1) rf_test(clk, rx_write_enable, rtr_write_enable, address_1, address_2, address_3, read_data);

	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin

		rx_write_enable = 1'b1;
		address_1 = 1'b0;
		#100ps;

		address_1 = 1'b1;
		#100ps;

		rx_write_enable = 1'b0;

		address_3 = 1'b0;
		#100ps;
		
		address_3 = 1'b1;
		#100ps;
	
		rtr_write_enable = 1'b1;
		address_2 = 1'b0;
		#100ps;

		address_2 = 1'b1;
		#100ps;

		rtr_write_enable = 1'b0;

		address_3 = 1'b0;
		#100ps;
		
		address_3 = 1'b1;
		#100ps;

	end

endmodule
