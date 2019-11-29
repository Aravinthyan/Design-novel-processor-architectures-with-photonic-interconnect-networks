module computer_tb;

	logic clk;
	logic rst;

	computer computer_test(clk, rst);

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
                #100ps;
                #100ps;
                #100ps;
                #100ps;
	end


endmodule
