module register_tb;

	logic clk;
	logic rst;
	logic [1:0]d;
	logic [1:0]q;
	
	// instantiate module
	register #(2) register_test(clk, rst, d, q);

	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin
		rst = 1'b1;
		#100ps;
		rst = 1'b0;
		d = 2'b00;
		#100ps;
		d = 2'b01;
		#100ps;
		d = 2'b10;
		#100ps;	
		d = 2'b11;
		#100ps;
	end

endmodule
