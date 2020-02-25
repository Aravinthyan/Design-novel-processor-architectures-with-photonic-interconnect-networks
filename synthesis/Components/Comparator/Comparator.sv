module Comparator
#(
	parameter WIDTH = 1
)
(
	input logic [WIDTH - 1:0] in_1,
	input logic [WIDTH - 1:0] in_2,
	output logic result
);
	
	always_comb
	begin
		if(in_1 == in_2)
		begin
			result = 1'b1;
		end
		else
		begin
			result = 1'b0;
		end
	end

endmodule
