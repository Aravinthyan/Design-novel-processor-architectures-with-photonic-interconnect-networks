module instruction_memory_tb;

	logic clk; 
	logic [1:0]address_1;
	logic [1:0]address_2;
	logic [7:0]read_data_1;
	logic [7:0]read_data_2;

	instruction_memory #(2, 8, "test.mem") im_test(address_1, address_2, read_data_1, read_data_2);

	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin
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
