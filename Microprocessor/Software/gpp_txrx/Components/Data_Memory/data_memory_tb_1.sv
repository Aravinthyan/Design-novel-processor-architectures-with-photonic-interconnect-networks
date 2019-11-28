module data_memory_tb_1;

	logic clk;
	logic memory_write_enable;
	logic address_rw;
	logic data_in;
	logic data_out;

	data_memory #(1) dm_test(clk, memory_write_enable, address_rw, data_in, data_out);

	
	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin
		memory_write_enable = 1'b1;
		address_rw = 1'b0;
		data_in = 1'b1;
		#100ps;
		address_rw = 1'b1;
		data_in = 1'b0;
		#100ps;
		memory_write_enable = 1'b0;
		address_rw = 1'b0;
		#100ps;
		address_rw = 1'b1;
		#100ps;


	end

endmodule
