module comparator_tb_2;

	logic clk;
	logic [1:0] in_1;
	logic [1:0] in_2;
	logic result;

	comparator #(2) comp_test(in_1, in_2, result);

	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin
		in_1 = 2'b00;
		in_2 = 2'b00;
		#100ps;
		in_1 = 2'b00;
		in_2 = 2'b01;
		#100ps;
		in_1 = 2'b00;
		in_2 = 2'b10;
		#100ps;
		in_1 = 2'b00;
		in_2 = 2'b11;
		#100ps;
		in_1 = 2'b01;
		in_2 = 2'b00;
		#100ps;
		in_1 = 2'b01;
		in_2 = 2'b01;
		#100ps;
		in_1 = 2'b01;
		in_2 = 2'b10;
		#100ps;
		in_1 = 2'b01;
		in_2 = 2'b11;
		#100ps;
		in_1 = 2'b10;
		in_2 = 2'b00;
		#100ps;
		in_1 = 2'b10;
		in_2 = 2'b01;
		#100ps;
		in_1 = 2'b10;
		in_2 = 2'b10;
		#100ps;
		in_1 = 2'b10;
		in_2 = 2'b11;
		#100ps;
		in_1 = 2'b11;
		in_2 = 2'b00;
		#100ps;
		in_1 = 2'b11;
		in_2 = 2'b01;
		#100ps;
		in_1 = 2'b11;
		in_2 = 2'b10;
		#100ps;
		in_1 = 2'b11;
		in_2 = 2'b11;
		#100ps;
	end

endmodule
