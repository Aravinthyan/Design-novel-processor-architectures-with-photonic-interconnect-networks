/***********************************************************************************
*	File name
				Multiplexer.sv
*	Description
				This module describes how a multiplexer works.
*	Parameters
				NUM_OF_CONTROL_SIGNALS - Number of control signals

				WIDTH - Number of bits for each input in the multiplexer
*	Inputs
				control_signals - Used to select a certain input data.

				data - Set of inputs put sent into the multiplexer.
*	Outputs	
				multiplexer_out - Output data choosen from the set of inputs.
*	Author
				Sreethyan Aravinthan (UCL)
**********************************************************************************/

module Multiplexer
#(
	parameter NUM_OF_CONTROL_SIGNALS = 1,
	parameter WIDTH = 1
)
(
	input logic [NUM_OF_CONTROL_SIGNALS - 1:0]control_signals,
	input logic [WIDTH - 1:0]data[2**NUM_OF_CONTROL_SIGNALS - 1:0],
	output logic [WIDTH - 1:0]multiplexer_out
);
	
	// combinational logic
	always_comb
	begin
		// select the correct data
		multiplexer_out = data[control_signals];
	end

endmodule
