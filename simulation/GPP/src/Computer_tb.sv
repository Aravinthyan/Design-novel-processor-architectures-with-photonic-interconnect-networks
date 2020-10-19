module Computer_tb;

	logic clk;
	logic rst;

	Computer dut(clk, rst);

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
	end

endmodule
