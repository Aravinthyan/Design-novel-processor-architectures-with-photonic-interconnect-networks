/***********************************************************************************
*	File name
				ALU_advanced.sv
*	Description
				This code will create an ALU which can take two inputs and add/sub/and/or them. The module set the following flags zero flag, carry flag, sign flag and overflow flag after the operation was carried out.
*	Parameters
				WIDTH - This is the width of the input and output data.
*	Inputs
				src_a - 1st input
				src_b - 2nd input
				ALU_control - Control signal which determins which operation to carry out (add/sub/and/or)
*	Outputs	
				ALU_out - The output result after applying the operation on the 2 inputs
				zero_flag - Indicates if the results was a zero
				carry_flag - Indicates if the carry took place
				sign_flag - Indicates if the Most Significant Bit (MSB) is set to 1
				overflow_flag - Indicates if an overflow took place
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

	// this holds the result after the operation, so that the carry flag can be set appropriately
	logic [WIDTH:0] result;
	
	// for all the operations set the zero and sign flag as follows
	assign zero_flag = ALU_out == 0;
	assign sign_flag = ALU_out[WIDTH - 1] == 1'b1;

	always_comb
	begin
		case(ALU_Control)
			2'b00 : // add
			begin
				ALU_out = src_a + src_b;
				
				/**Setting the carry flag**/

				result = {1'b0, src_a} + {1'b0, src_b};
				carry_flag = result[WIDTH];

				/**Setting the overflow flag**/
				
				// if the two numbers are positive
				if(src_a[WIDTH - 1] == 1'b0 && src_b[WIDTH - 1] == 1'b0)	
				begin
					// and if the result is negative
					if(ALU_out[WIDTH - 1] == 1'b1)	
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

				/**Setting the carry flag**/

				result = {1'b0, src_a} - {1'b0, src_b};
				carry_flag = result[WIDTH];
				
				/**Setting the overflow flag**/
				
				// if the value is +ve then -ve
				if(src_a[WIDTH - 1] == 1'b0 && src_b[WIDTH - 1] == 1'b1)	
				begin
					// and if the result is negative
					if(ALU_out[WIDTH - 1] == 1'b1)	
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

				/**Setting the carry flag**/
				carry_flag = 1'bx;

				/**Setting the overflow flag**/
				overflow_flag = 1'bx;
			end
			2'b11 : // or
			begin
				ALU_out = src_a | src_b;
				result = 'b0;

				/**Setting the carry flag**/
				carry_flag = 1'bx;

				/**Setting the overflow flag**/
				overflow_flag = 1'bx;
			end
		endcase
	end
endmodule
