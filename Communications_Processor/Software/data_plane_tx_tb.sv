module data_plane_tx_tb;

	logic clk;
	logic rst;
	logic gpp_tx_signal;
	logic [15:0] gpp_tx_data;
	logic [15:0] node_id;
	logic data_tx_flag_out;
	logic tx_flag;
	logic [31:0] data_tx_packet;

	data_plane_tx dut(clk, rst, gpp_tx_signal, gpp_tx_data, node_id, data_tx_flag_out, tx_flag, data_tx_packet);

	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin
		rst = 1'b1;
		node_id = 16'h0001;
		gpp_tx_signal = 1'b0;
		gpp_tx_data = 16'h0000;
		data_tx_flag_out = 1'b0;
		#100ps;
		rst = 1'b0;
		#100ps;
		gpp_tx_signal = 1'b1;
		gpp_tx_data = 16'h000A;
		#100ps;
		gpp_tx_signal = 1'b1;
		gpp_tx_data = 16'h0005;
		#100ps;
		gpp_tx_signal = 1'b1;
		gpp_tx_data = 16'h0002;
		#100ps;
		gpp_tx_signal = 1'b1;
		gpp_tx_data = 16'h0008;
		#100ps;
		gpp_tx_signal = 1'b1;
		gpp_tx_data = 16'h0001;
		#100ps;
		gpp_tx_signal = 1'b0;
		#100ps;
		#100ps;
		data_tx_flag_out = 1'b1;
		#100ps;
	end

endmodule
