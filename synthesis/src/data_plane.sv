module data_plane
(
	// signals for the data plane rx
	
	// the clock for this system
	input logic clk,
	// signal to reset the system
	input logic rst,
	// this is the packet that is recieved on the data plane
	input logic [31:0] data_rx_packet,
	// this will contain the node id
	input shortint node_id,
	// this is a control signal that comes from the gpp and it is set if
	// the gpp wants to retrive data from the RAM
	input logic gpp_rtr_dp,
	// this is a flag that is set for one clock cycle which will reset the
	// data_rx_flag on the control plane
	output logic data_rx_complete_flag,	// ***
	// this is the output of the RAM and it is connected to the gpp to
	// transfer the recevied data
	output logic [15:0] RAM_rx_data_out,

	// signals for the data plane tx
	
	// a control signal from the gpp to transfer data from the gpp RAM to
	// the data plane tx RAM
	// this will be a control signal and it will be part of an instruction
	input logic gpp_trf_dp,
	// this will be the data that will be written to the RAM
	input logic [15:0] gpp_tx_data,
	// this will be a flag from the control plane which indicates the data
	// plane for a transmission to happen
	input logic data_tx_flag,	// ***
	// this will be flag that will be sent from the data plane to the
	// control plane to indicate that the transmission has completed. Thus
	// reseting the flag at the control plane and allowing a new
	// transmission if needed
	output logic data_tx_complete_flag,	// ***
	// this is the data packet that is getting transmitted to the rx node
	// on the data plane
	output logic [31:0] data_tx_packet,
	// this holds the output of the RAM
	output logic [15:0] RAM_tx_data_out,	// ***
	// this will be the output value from the register
	output logic [15:0] sp_tx_current	// ***
);
	
	// data plane tx
	data_plane_tx dp_tx(clk,
			    rst,
			    gpp_trf_dp,
			    gpp_tx_data,
			    node_id,
			    data_tx_flag,
			    data_tx_complete_flag,
			    data_tx_packet,
			    RAM_tx_data_out,
			    sp_tx_current);

	// data plane rx
	data_plane_rx dp_rx(clk,
			    rst,
			    data_rx_packet,
			    node_id,
			    gpp_rtr_dp,
			    data_rx_complete_flag,
			    RAM_rx_data_out);
endmodule
