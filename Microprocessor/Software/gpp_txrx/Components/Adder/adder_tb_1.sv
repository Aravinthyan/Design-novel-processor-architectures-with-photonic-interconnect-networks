module adder_tb_1;

	logic clk;
	logic src_a;
	logic src_b;
	logic ALU_out;
	
	adder #(1) adder_test(src_a, src_b, ALU_out);

	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin
		src_a = 1'b0;
		src_b = 1'b0;
		#100ps;
	
		src_a = 1'b0;
		src_b = 1'b1;
		#100ps;

		src_a = 1'b1;
		src_b = 1'b0;
		#100ps;

		src_a = 1'b1;
		src_b = 1'b1;
		#100ps;
	end

endmodule
