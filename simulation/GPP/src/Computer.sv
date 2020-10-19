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
*	Outputs	
				NONE
*	Author
				Sreethyan Aravinthan (UCL)
**********************************************************************************/

`include "GPP.sv"
`include "Instruction_Memory.sv"
`include "Data_Memory.sv"

module Computer
(
	input logic clk,
	input logic rst
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

	GPP cpu(clk,
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

	Instruction_Memory #(16, 16, "test.mem") im_computer	(address_1,
															address_2,
															read_address_1,
															read_address_2);

	Data_Memory #(16) dm_computer(clk,
									memory_write_enable,
									address_rw,
									data_in,
									data_out);


endmodule
