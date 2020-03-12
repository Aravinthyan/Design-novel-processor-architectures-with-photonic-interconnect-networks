/***********************************************************************************
*	File name
				ALU_advanced.sv
*	Description
				This code will create an ALU which can take two inputs and add/sub/
				and/or them. In addition to this the module produces the result 
*	Parameters
				WIDTH - This is the width of the input and output data.
*	Author
				Sreethyan Aravinthan (UCL)
**********************************************************************************/

module ALU_advanced
#(
	parameter WIDTH = 1
)
(
	input logic [WIDTH - 1:0]src_a,
	input logic [WIDTH - 1:0]src_b,
	input logic [1:0] ALU_Control,
	output logic [WIDTH - 1:0]ALU_out,
	output logic zero_flag,
	output logic carry_flag,
	output logic sign_flag,
	output logic overflow_flag
);

	logic [WIDTH:0] result;
	
	assign zero_flag = ALU_out == 0;
	assign sign_flag = ALU_out[WIDTH - 1] == 1'b1;

	// combinational logic
	always_comb
	begin
		case(ALU_Control)
			2'b00 : // add
			begin
				ALU_out = src_a + src_b;
				result = {1'b0, src_a} + {1'b0, src_b};
				// carry flag
				carry_flag = result[WIDTH];
				// overflow flag
				if(src_a[WIDTH - 1] == 1'b0 && src_b[WIDTH - 1] == 1'b0)	// if the two numbers are positive
				begin
					if(ALU_out[WIDTH - 1] == 1'b1)	// and if the result is negative
					begin
						// set the overflow flag to 1
						overflow_flag = 1'b1;
					end
					else
					begin
						// set the overflow flaf to 0
						overflow_flag = 1'b0;
					end
				end
				// if the two numbers that are being added -ve
				else if(src_a[WIDTH - 1] == 1'b1 && src_b[WIDTH - 1] == 1'b1)
				begin	
					// the result is positive
					if(ALU_out[WIDTH - 1] == 1'b0)
					begin
						// set overflow flag to 1
						overflow_flag = 1'b1;
					end
					else
					begin
						// set overflow flag to 0
						overflow_flag = 1'b0;
					end
				end
				// if one is +ve and the other is -ve
				else
				begin
					overflow_flag = 1'b0;
				end
			end
			2'b01 : // sub
			begin
				ALU_out = src_a - src_b;
				result = {1'b0, src_a} - {1'b0, src_b};
				// carry flag
				carry_flag = result[WIDTH];
				// overflow flag
				if(src_a[WIDTH - 1] == 1'b0 && src_b[WIDTH - 1] == 1'b1)	// if the value is +ve then -ve
				begin
					if(ALU_out[WIDTH - 1] == 1'b1)	// and if the result is negative
					begin
						// set the overflow flag to 1
						overflow_flag = 1'b1;
					end
					else
					begin
						// set the overflow flaf to 0
						overflow_flag = 1'b0;
					end
				end
				// if the value is -ve then +ve
				else if(src_a[WIDTH - 1] == 1'b1 && src_b[WIDTH - 1] == 1'b0)
				begin	
					// the result is positive
					if(ALU_out[WIDTH - 1] == 1'b0)
					begin
						// set overflow flag to 1
						overflow_flag = 1'b1;
					end
					else
					begin
						// set overflow flag to 0
						overflow_flag = 1'b0;
					end
				end
				// if one is +ve and the other is -ve
				else
				begin
					overflow_flag = 1'b0;
				end
			end
			2'b10 : // and
			begin
				ALU_out = src_a & src_b;
				result = 'b0;
				// carry flag
				carry_flag = 1'bx;
				// overflow flag
				overflow_flag = 1'bx;
			end
			2'b11 : // or
			begin
				ALU_out = src_a | src_b;
				result = 'b0;
				// carry flag
				carry_flag = 1'bx;
				// overflow flag
				overflow_flag = 1'bx;
			end
		endcase
	end

endmodule
