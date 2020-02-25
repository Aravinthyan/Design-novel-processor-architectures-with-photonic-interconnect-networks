module Multiplexer
#(
	parameter NUM_OF_CONTROL_SIGNALS = 1,	// number of control signals
	parameter WIDTH = 1		// number of bits for each input in the multiplexer
)
(
	input logic [NUM_OF_CONTROL_SIGNALS - 1:0]control_signals,
	input logic [WIDTH - 1:0]data[2**NUM_OF_CONTROL_SIGNALS - 1:0],	// set of inputs put sent into the multiplexer
	output logic [WIDTH - 1:0]multiplexer_out	// output data choosen from the set of inputs
);
	
	// combinational logic
	always_comb
	begin
		// select the correct data
		multiplexer_out = data[control_signals];
	end

endmodule
