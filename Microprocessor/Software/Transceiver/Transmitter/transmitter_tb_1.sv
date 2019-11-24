module transmitter_tb_1;
	
	logic clk;
	logic tx_in;
	logic control;
	logic tx_out;

	transmitter #(1) tx_test(tx_in, control, tx_out);

	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin
		control = 1'b0;
		tx_in = 1'b0;
		#100ps;

		control = 1'b0;
		tx_in = 1'b1;
		#100ps;
		
		control = 1'b1;
		tx_in = 1'b0;
		#100ps;
		
		control = 1'b1;
		tx_in = 1'b1;
		#100ps;
	end
	

endmodule
