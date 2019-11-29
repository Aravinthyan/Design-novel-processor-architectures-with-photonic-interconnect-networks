`include "../ALU/ALU.sv"

module adder
#(
	parameter WIDTH = 1
)
(
	input logic [WIDTH - 1:0]src_a,
	input logic [WIDTH - 1:0]src_b,
	output logic [WIDTH - 1:0]adder_out
);
	
	ALU #(WIDTH) ALU_adder(src_a, src_b, 2'b00, adder_out);

endmodule
