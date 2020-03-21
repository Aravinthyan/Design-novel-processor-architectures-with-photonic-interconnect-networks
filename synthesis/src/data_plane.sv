/***********************************************************************************
*	File name
				data_plane.sv
*	Description
				This module instantiates the data plane tx & rx.
*	Parameters
				NONE
*	Inputs
				clk - The clock for the system.

				rst - Signal to reset the system to the default values.

				data_rx_packet - This is the packet that is received on the data plane.

				node_id - This will be the id that will be given to the node in the system. NOTE: EACH NODE MUST HAVE A DIFFERENT ID OTHERWISE THERE WILL BE ISSUES IN TX/RX.

				gpp_rtr_dp - This is a control signal which indicates the data plane to modify the stack ponter. Since the values are stored in a stack data structure, the value at the top of the stack is sent to the GPP from the DP reciever.

				gpp_trf_dp - This is a control signal which tells the data plane transmitter that data is going to be transferred from the GPP to the DP transmitter.

				gpp_tx_data - This is the data that will be transferred from the GPP to the DP transmitter RAM.

				data_tx_flag - This is a flag which indicates if the node is transmitting data on the data plane.
*	Outputs	
				data_rx_complete_flag - This flag will reset the data_rx_flag. The value for this is sent from the data plane reciever.

				RAM_rx_data_out - This shows the data that is outputed from the data plane receiver. It will be connected to the RAM of the GPP via a multiplexer.

				data_tx_complete_flag - This flag will reset the data_tx_flag. The value for this is sent from the data plane transmitter.

				data_tx_packet - This is the packet that is transmitted on the data plane.

				RAM_tx_data_out - This input has the value equal to the top of the RAM of the data plane tx RAM.

				sp_tx_current - This has the value of the stack pointer from the data plane tx RAM. This is used to see if the data plane tx RAM is empty or not.
*	Author
				Sreethyan Aravinthan (UCL)
**********************************************************************************/

module data_plane
(
	// signals for the data plane rx
	
	input logic clk,
	input logic rst,
	input logic [31:0] data_rx_packet,
	input shortint node_id,
	input logic gpp_rtr_dp,
	output logic data_rx_complete_flag,	// ***
	output logic [15:0] RAM_rx_data_out,

	// signals for the data plane tx

	input logic gpp_trf_dp,
	input logic [15:0] gpp_tx_data,
	input logic data_tx_flag,	// ***
	output logic data_tx_complete_flag,	// ***
	output logic [31:0] data_tx_packet,
	output logic [15:0] RAM_tx_data_out,	// ***
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
