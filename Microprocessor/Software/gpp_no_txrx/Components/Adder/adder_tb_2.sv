module adder_tb_2;

	logic clk;
	logic [1:0]src_a;
	logic [1:0]src_b;
	logic [1:0]ALU_out;
	
	adder #(2) adder_test(src_a, src_b, ALU_out);

	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin
		src_a = 2'b00;
		src_b = 2'b00;
		#100ps;
	
		src_a = 2'b00;
		src_b = 2'b01;
		#100ps;

		src_a = 2'b10;
		src_b = 2'b00;
		#100ps;

		src_a = 2'b01;
		src_b = 2'b01;
		#100ps;

		src_a = 2'b10;
		src_b = 2'b10;
		#100ps;

		src_a = 2'b11;
		src_b = 2'b11;
		#100ps;
	end

endmodule
