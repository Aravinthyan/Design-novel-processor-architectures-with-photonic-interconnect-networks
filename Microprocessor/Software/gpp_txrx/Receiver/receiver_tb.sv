module receiver_tb;

	logic clk;
	logic rst;
	logic [5:0] rx_in;
	logic [1:0] id;
	logic rtr_write_enable;
	logic [1:0] rx_addr;
	logic [1:0] flag_res;
	logic [1:0] data_out;
	

	receiver #(2, 2, 2) rx_test(clk, rst, rx_in, id, rtr_write_enable, rx_addr, flag_res, data_out);

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

		id = 2'b01;
		rx_addr = 2'b00;
		rx_in = 6'b001101;
		#100ps;	
		#100ps;
		rtr_write_enable = 1'b1;
		#100ps;
	end

endmodule
