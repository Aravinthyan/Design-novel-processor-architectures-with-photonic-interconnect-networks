module sign_extension_tb_1;

	logic clk;
	logic [1:0] in;
	logic [3:0] out;

	sign_extension #(2, 4) se_test(in, out);

	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin
		in = 2'b00;
		#100ps;
		in = 2'b01;
		#100ps;
		in = 2'b10;
		#100ps;
		in = 2'b11;
		#100ps;
	end

endmodule
