module transmitter_tb_2;
	
	logic clk;
	logic [1:0] dest_id;
	logic [1:0] data;
	logic [1:0] src_id;
	logic enable;
	logic [5:0] tx_out;
	
	transmitter #(2, 2) tx_test(dest_id, data, src_id, enable, tx_out);

	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin
		enable = 1'b0;

		dest_id = 2'b00;
		data = 2'b00;
		src_id = 2'b00;
		#100ps;
		
		dest_id = 2'b01;
		data = 2'b01;
		src_id = 2'b10;
		#100ps;
		
		dest_id = 2'b10;
		data = 2'b10;
		src_id = 2'b01;
		#100ps;
		
		dest_id = 2'b11;
		data = 2'b11;
		src_id = 2'b11;
		#100ps;
		
		enable = 1'b1;
		
		dest_id = 2'b00;
		data = 2'b00;
		src_id = 2'b00;
		#100ps;
		
		dest_id = 2'b01;
		data = 2'b01;
		src_id = 2'b10;
		#100ps;
		
		dest_id = 2'b10;
		data = 2'b10;
		src_id = 2'b01;
		#100ps;
		
		dest_id = 2'b11;
		data = 2'b11;
		src_id = 2'b11;
		#100ps;
	end
	

endmodule
