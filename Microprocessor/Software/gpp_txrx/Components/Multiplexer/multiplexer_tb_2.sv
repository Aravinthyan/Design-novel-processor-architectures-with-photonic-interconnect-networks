module multiplexer_tb_2;

	logic control_signals;
       	logic [1:0]data[1:0];
	logic [1:0]multiplexer_out;

	logic clk;

	// instantiate multipexer
	multiplexer #(1, 2) multiplexer_test(control_signals, data, multiplexer_out);

	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin
		data[0] = 2'b11;
		data[1] = 2'b10;
		control_signals = 0;
		#100ps;
		control_signals = 1;
		#100ps;
	end

endmodule
