module ALU
#(
	parameter WIDTH = 1
)
(
	input logic [WIDTH - 1:0]src_a,
	input logic [WIDTH - 1:0]src_b,
	input logic [1:0] ALU_Control,
	output logic [WIDTH - 1:0]ALU_out,
	output logic zero
);

	// combinational logic
	always_comb
	begin
		case(ALU_Control)
			2'b00 : // add
			begin
				ALU_out = src_a + src_b;
				if(ALU_out == 0)
				begin
					zero = 1;
				end
				else
				begin
					zero = 0;
				end
			end
			2'b01 : // sub
			begin
				ALU_out = src_a - src_b;
				if(ALU_out == 0)
				begin
					zero = 1;
				end
				else
				begin
					zero = 0;
				end
			end
			2'b10 : // and
			begin
				ALU_out = src_a & src_b;
				if(ALU_out == 0)
				begin
					zero = 1;
				end
				else
				begin
					zero = 0;
				end
			end
			2'b11 : // or
			begin
				ALU_out = src_a | src_b;
				if(ALU_out == 0)
				begin
					zero = 1;
				end
				else
				begin
					zero = 0;
				end
			end
		endcase
	end

endmodule
