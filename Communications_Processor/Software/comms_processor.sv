`include "control_plane.sv"
`include "data_plane.sv"

module comms_processor
(
	// commons signals
	input logic clk,
	input logic rst,
	input shortint node_id,
	// control signals 
	input shortint max_node,
	input logic [31:0] control_rx_packet,
	input logic enable_rtr,	// cu
	input logic gpp_rtr_cp, // cu
	output logic [31:0] control_tx_packet,
	output logic [15:0] data_rx_node_id,
	output logic data_rx_flag, // gpp
	output logic gpp_trf_cp, // gpp
	// data signals
	input logic [31:0] data_rx_packet,
	input logic gpp_rtr_dp, // cu
	output logic [15:0] RAM_rx_data_out, // gpp
	input logic gpp_trf_dp, // cu
	input logic [15:0] gpp_tx_data, // gpp
	output logic [31:0] data_tx_packet
);

	// connected signals
	logic data_rx_complete_flag;	
	logic data_tx_complete_flag;	
	logic [15:0] RAM_tx_data_out;	
	logic [15:0] sp_tx_current;	
	logic data_tx_flag;	
	
	// instantiate control plane
	control_plane cp(clk,
			 rst,
			 node_id,
			 max_node,
			 data_rx_complete_flag,	// ***
			 control_rx_packet,
			 data_tx_complete_flag,	// ***
			 RAM_tx_data_out,	// ***
			 sp_tx_current,	// ***
			 enable_rtr,
			 gpp_rtr_cp, 
			 control_tx_packet,
			 data_rx_node_id,
			 data_tx_flag,	// ***
			 data_rx_flag,
			 gpp_trf_cp);

	// instantiate data plane
	data_plane dp(clk,
		      rst,
		      data_rx_packet,
		      node_id,
		      gpp_rtr_dp,
		      data_rx_complete_flag,	// ***
		      RAM_rx_data_out,
		      gpp_trf_dp,
		      gpp_tx_data,
		      data_tx_flag,	// ***
		      data_tx_complete_flag,	// ***
		      data_tx_packet,
		      RAM_tx_data_out,	// ***
		      sp_tx_current);	// ***

endmodule
