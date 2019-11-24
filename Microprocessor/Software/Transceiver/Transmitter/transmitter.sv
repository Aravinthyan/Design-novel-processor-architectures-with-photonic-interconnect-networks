module transmitter
#(
	parameter WIDTH = 1
)
(
	input logic [WIDTH - 1:0] tx_in,
	input logic control,
	output logic [WIDTH - 1:0] tx_out
);

	// index variable
	genvar i;
	generate
		for(i = 0; i < WIDTH; i++)
		begin : tx_tri_states
			// primitive type for tri state buffer
			bufif1 (tx_out[i], tx_in[i], control);
		end
	endgenerate

endmodule
