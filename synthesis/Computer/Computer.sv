/***********************************************************************************
*	File name
				Computer.sv
*	Description
				This module instantiates all the modules needed and creates the microprocessor.
*	Parameters
				NONE
*	Inputs
				clk - The clock for the system.

				rst - Signal to reset the system to the default values.

				node_id - This will be the id that will be given to the node in the system. NOTE: EACH NODE MUST HAVE A DIFFERENT ID OTHERWISE THERE WILL BE ISSUES IN TX/RX.

				max_node - This shows the maximum number of nodes in the ring topology.

				control_rx_packet - This is the packet that will be recieved on the control plane.

				data_rx_packet - This is the packet that is received on the data plane.
*	Outputs	
				control_tx_packet - This is the packet that is transmitted on the control plane.

				data_rx_node_id - This is the value that is sent to a control unit which sets the wavelength/spatial channel of the reciever.

				data_tx_packet - This is the packet that is transmitted on the data plane.
*	Author
				Sreethyan Aravinthan (UCL)
**********************************************************************************/

module Computer
(
	input logic clk,
	input logic rst,
	input shortint node_id,
	// control plane signals 
	input shortint max_node,
	input logic [31:0] control_rx_packet,
	output logic [31:0] control_tx_packet,
	output logic [15:0] data_rx_node_id,
	// data plane signals
	input logic [31:0] data_rx_packet,
	output logic [31:0] data_tx_packet
);

	// Instruction memory
	logic [15:0]address_1;
	logic [15:0]address_2;
	logic [15:0]read_address_1;
	logic [15:0]read_address_2;
	// Data memory
	logic [15:0]address_rw;
	logic [15:0]data_in;
	logic [15:0]data_out;
	// Control Signals
	logic memory_write_enable;
	logic enable_rtr;
	logic gpp_rtr_cp;
	logic gpp_rtr_dp;
	logic gpp_trf_dp;
	// Communications Processor Signals
	logic [15:0] RAM_rx_data_out; // gpp
	logic data_rx_flag; // gpp
	logic gpp_trf_cp; // gpp
	logic [15:0] gpp_tx_data; // gpp

	gpp cpu(clk,
        	rst,
        	address_1,
        	address_2,
        	read_address_1,
        	read_address_2,
        	address_rw,
        	data_in,
        	data_out,
			memory_write_enable,
			enable_rtr,
			gpp_rtr_cp,
			gpp_rtr_dp,
			gpp_trf_dp,
			RAM_rx_data_out, // gpp
			data_rx_flag, // gpp
			gpp_trf_cp, // gpp
			gpp_tx_data); // gpp

	comms_processor cp	(clk,
						rst,
						node_id,
						max_node,
						control_rx_packet,
						enable_rtr,	// cu
						gpp_rtr_cp, // cu
						control_tx_packet,
						data_rx_node_id,
						data_rx_flag, // gpp
						gpp_trf_cp, // gpp
						data_rx_packet,
						gpp_rtr_dp, // cu
						RAM_rx_data_out, // gpp
						gpp_trf_dp, // cu
						gpp_tx_data, // gpp
						data_tx_packet);

	instruction_memory #(16, 16, "test.mem") im_computer	(address_1,
															address_2,
															read_address_1,
															read_address_2);

	data_memory #(16) dm_computer(clk,
									memory_write_enable,
									address_rw,
									data_in,
									data_out);


endmodule
