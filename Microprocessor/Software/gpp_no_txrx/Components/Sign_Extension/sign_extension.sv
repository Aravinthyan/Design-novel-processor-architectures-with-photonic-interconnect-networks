module sign_extension
#(
	parameter IN_WIDTH = 1,
	parameter OUT_WIDTH = 1
)
(
	input logic [IN_WIDTH - 1:0] in,
	output logic [OUT_WIDTH - 1:0] out
);

	always_comb
	begin
		out = {{OUT_WIDTH - IN_WIDTH{in[IN_WIDTH - 1]}}, in};
	end

endmodule