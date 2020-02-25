module data_memory_tb_2;

	logic clk;
	logic memory_write_enable;
	logic [1:0]address_rw;
	logic [1:0]data_in;
	logic [1:0]data_out;

	data_memory #(2) dm_test(clk, memory_write_enable, address_rw, data_in, data_out);

	
	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin
		memory_write_enable = 1'b1;
		
		address_rw = 2'b00;
		data_in = 2'b11;
		#100ps;
		
		address_rw = 2'b01;
		data_in = 2'b10;
		#100ps;
		
		address_rw = 2'b10;
		data_in = 2'b01;
		#100ps;
		
		address_rw = 2'b11;
		data_in = 2'b00;
		#100ps;

		memory_write_enable = 1'b0;
		
		address_rw = 2'b00;
		#100ps;
		
		address_rw = 2'b01;
		#100ps;
		
		address_rw = 2'b10;
		#100ps;

		address_rw = 2'b11;
		#100ps;
	end

endmodule
