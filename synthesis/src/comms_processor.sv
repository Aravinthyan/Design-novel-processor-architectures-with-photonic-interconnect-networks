/***********************************************************************************
*	File name
				comms_processor.sv
*	Description
				This module instantiates the control plane and data plane. This will be connected to the GPP.
*	Parameters
				NONE
*	Inputs
				clk - The clock for the system.

				rst - Signal to reset the system to the default values.

				node_id - This will be the id that will be given to the node in the system. NOTE: EACH NODE MUST HAVE A DIFFERENT ID OTHERWISE THERE WILL BE ISSUES IN TX/RX.

				max_node - This shows the maximum number of nodes in the ring topology.

				control_rx_packet - This is the packet that will be recieved on the control plane.

				enable_rtr - This is a control signal that will allow the GPP to retrive data from the CP if it is possible.

				gpp_rtr_cp - This is a control signal that pauses rx from gpp so that gpp can retrive data from rx RAM.

				data_rx_packet - This is the packet that is received on the data plane.

				gpp_rtr_dp - This is a control signal which indicates the data plane to modify the stack ponter. Since the values are stored in a stack data structure, the value at the top of the stack is sent to the GPP from the DP reciever.

				gpp_trf_dp - This is a control signal which tells the data plane transmitter that data is going to be transferred from the GPP to the DP transmitter.

				gpp_tx_data - This is the data that will be transferred from the GPP to the DP transmitter RAM.
*	Outputs	
				control_tx_packet - This is the packet that is transmitted on the control plane.

				data_rx_node_id - This is the value that is sent to a control unit which sets the wavelength/spatial channel of the reciever.

				data_rx_flag - this is used to show the control plane if data is being received on the data plane. Thus the control plane will not say yes for another ping if set. This is also a flag that is used by the GPP to see if it can retrive data from the data plane receiver. This will be connected to the ALU_src_1.

				gpp_trf_cp - this is a flag that is used by the GPP to transfer data from the GPP RAM to the data plane transmitter RAM. This will be connected to the ALU_src_1.

				RAM_rx_data_out - This shows the data that is outputed from the data plane receiver. It will be connected to the RAM of the GPP via a multiplexer.

				data_tx_packet - This is the packet that is transmitted on the data plane.
*	Author
				Sreethyan Aravinthan (UCL)
**********************************************************************************/

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
	Control_Plane cp(clk,
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
