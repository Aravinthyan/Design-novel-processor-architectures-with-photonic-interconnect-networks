module transmitter_tb_1;
	
	logic clk;
	logic dest_id;
	logic data;
	logic src_id;
	logic enable;
	logic [2:0] tx_out;
	
	transmitter #(1, 1) tx_test(dest_id, data, src_id, enable, tx_out);

	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin
		enable = 1'b0;

		dest_id = 1'b0;
		data = 1'b0;
		src_id = 1'b0;
		#100ps;

		dest_id = 1'b1;
		data = 1'b0;
		src_id = 1'b1;
		#100ps;
		
		dest_id = 1'b1;
		data = 1'b1;
		src_id = 1'b0;
		#100ps;

		enable = 1'b1;

		dest_id = 1'b0;
		data = 1'b0;
		src_id = 1'b0;
		#100ps;

		dest_id = 1'b1;
		data = 1'b0;
		src_id = 1'b1;
		#100ps;
		
		dest_id = 1'b1;
		data = 1'b1;
		src_id = 1'b0;
		#100ps;
	end
	

endmodule
