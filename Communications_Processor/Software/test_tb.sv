module test_tb;

	logic clk;
	logic rst;
	logic [7:0] out;

	test dut(clk, rst, out);

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
		#100ps;
	end


endmodule
