/***********************************************************************************
*	File name
				ALU.sv
*	Description
				This code will create an ALU which can take two inputs and add/sub/
				and/or them.
*	Parameters
				WIDTH - This is the width of the input and output data.
*	Inputs
				src_a - 1st input
				src_b - 2nd input
				ALU_control - Control signal which determins which operation to carry out (add/sub/and/or)
*	Outputs	
				ALU_out - The output result after applying the operation on the 2 inputs
*	Author
				Sreethyan Aravinthan (UCL)
**********************************************************************************/

module ALU
#(
	parameter WIDTH = 1
)
(
	input logic [WIDTH - 1:0]src_a,
	input logic [WIDTH - 1:0]src_b,
	input logic [1:0] ALU_Control,
	output logic [WIDTH - 1:0]ALU_out
);

	always_comb
	begin
		case(ALU_Control)
			2'b00 : // add
			begin
				ALU_out = src_a + src_b;
			end
			2'b01 : // sub
			begin
				ALU_out = src_a - src_b;
			end
			2'b10 : // and
			begin
				ALU_out = src_a & src_b;
			end
			2'b11 : // or
			begin
				ALU_out = src_a | src_b;
			end
		endcase
	end

endmodule
