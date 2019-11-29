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

	// combinational logic
	always_comb
	begin
		case(ALU_Control)
			2'b00 : // add
			begin
				ALU_out = src_a + src_b;
				result = {1'b0, src_a} + {1'b0, src_b};
				// zero flag
				if(ALU_out == 0)	
				begin
					zero_flag = 1;
				end
				else
				begin
					zero_flag = 0;
				end
				// carry flag
				carry_flag = result[WIDTH];
				// sign_flag
				if(ALU_out[WIDTH - 1] == 1'b0)
				begin
					sign_flag = 1'b0;
				end
				else
				begin
					sign_flag = 1'b1;
				end
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
				// zero flag
				if(ALU_out == 0)	
				begin
					zero_flag = 1;
				end
				else
				begin
					zero_flag = 0;
				end
				// carry flag
				carry_flag = result[WIDTH];
				// sign_flag
				if(ALU_out[WIDTH - 1] == 1'b0)
				begin
					sign_flag = 1'b0;
				end
				else
				begin
					sign_flag = 1'b1;
				end
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
				// zero flag
				if(ALU_out == 0)	
				begin
					zero_flag = 1;
				end
				else
				begin
					zero_flag = 0;
				end
				// carry flag
				carry_flag = 1'bx;
				// sign_flag
				if(ALU_out[WIDTH - 1] == 1'b0)
				begin
					sign_flag = 1'b0;
				end
				else
				begin
					sign_flag = 1'b1;
				end
				// overflow flag
				overflow_flag = 1'bx;
			end
			2'b11 : // or
			begin
				ALU_out = src_a | src_b;
				// zero flag
				if(ALU_out == 0)	
				begin
					zero_flag = 1;
				end
				else
				begin
					zero_flag = 0;
				end
				// carry flag
				carry_flag = 1'bx;
				// sign_flag
				if(ALU_out[WIDTH - 1] == 1'b0)
				begin
					sign_flag = 1'b0;
				end
				else
				begin
					sign_flag = 1'b1;
				end
				// overflow flag
				overflow_flag = 1'bx;
			end
		endcase
	end

endmodule
