module multiplexer_tb_2_2;

	logic [1:0]control_signals;
       	logic [1:0]data[3:0];
	logic [1:0]multiplexer_out;

	logic clk;

	// instantiate multipexer
	multiplexer #(2, 2) multiplexer_test(control_signals, data, multiplexer_out);

	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin
		data[0] = 2'b11;
		data[1] = 2'b10;
		data[2] = 2'b01;
		data[3] = 2'b00;
		control_signals = 2'b00;
		#100ps;
		control_signals = 2'b01;
		#100ps;
		control_signals = 2'b10;
		#100ps;
		control_signals = 2'b11;
		#100ps;
	end

endmodule
