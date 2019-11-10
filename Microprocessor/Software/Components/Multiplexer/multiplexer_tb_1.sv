module multiplexer_tb_1;

	logic control_signals;
       	logic data[1:0];
	logic multiplexer_out;

	logic clk;

	// instantiate multipexer
	multiplexer #(1, 1) multiplexer_test(control_signals, data, multiplexer_out);

	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin
		data[0] = 1'b1;
		data[1] = 1'b0;
		control_signals = 0;
		#100ps;
		control_signals = 1;
		#100ps;
	end

endmodule
