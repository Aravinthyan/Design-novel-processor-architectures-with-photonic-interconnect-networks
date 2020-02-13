module data_plane_tb;
	
	logic clk;
	logic rst;
	logic [31:0] data_rx_packet;
	logic [15:0] node_id;
	logic gpp_rtr_signal;
	logic data_rx_complete_flag;
	logic [15:0] RAM_rx_data_out;
	logic gpp_tx_signal;
	logic [15:0] gpp_tx_data;
	logic data_tx_flag;
	logic data_tx_complete_flag;
	logic [31:0] data_tx_packet;
	logic [15:0] RAM_tx_data_out;
	logic [15:0] sp_tx_current;

	data_plane dut(clk,
		       rst,
		       data_rx_packet,
		       node_id,
		       gpp_rtr_signal,
		       data_rx_complete_flag,
		       RAM_rx_data_out,
		       gpp_tx_signal,
		       gpp_tx_data,
		       data_tx_flag,
		       data_tx_complete_flag,
		       data_tx_packet,
		       RAM_tx_data_out,
		       sp_tx_current);

	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin

	end

endmodule
