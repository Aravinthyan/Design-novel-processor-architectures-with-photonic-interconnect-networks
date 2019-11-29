module comparator_tb_1;

	logic clk;
	logic in_1;
	logic in_2;
	logic result;

	comparator #(1) comp_test(in_1, in_2, result);

	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin
		in_1 = 1'b0;
		in_2 = 1'b0;
		#100ps;
		in_1 = 1'b0;
		in_2 = 1'b1;
		#100ps;
		in_1 = 1'b1;
		in_2 = 1'b0;
		#100ps;
		in_1 = 1'b1;
		in_2 = 1'b1;
		#100ps;
	end

endmodule
