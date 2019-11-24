module transmitter_tb_2;
	
	logic clk;
	logic [1:0] tx_in;
	logic control;
	logic [1:0] tx_out;

	transmitter #(2) tx_test(tx_in, control, tx_out);

	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin
		control = 1'b0;
		tx_in = 2'b00;
		#100ps;

		control = 1'b0;
		tx_in = 2'b01;
		#100ps;

		control = 1'b0;
		tx_in = 2'b10;
		#100ps;

		control = 1'b0;
		tx_in = 2'b11;
		#100ps;

		control = 1'b1;
		tx_in = 2'b00;
		#100ps;

		control = 1'b1;
		tx_in = 2'b01;
		#100ps;

		control = 1'b1;
		tx_in = 2'b10;
		#100ps;

		control = 1'b1;
		tx_in = 2'b11;
		#100ps;
	end
	

endmodule
