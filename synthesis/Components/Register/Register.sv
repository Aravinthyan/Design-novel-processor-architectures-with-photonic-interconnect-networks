module Register
#(
	parameter WIDTH = 1
)
(
	input logic clk,	// clock signal
	input logic rst,	// reset signal
	input logic [WIDTH - 1:0] d,	// input signal
	output logic [WIDTH -1:0] q	// output signal
);

	// asynchronus register
	always_ff@(posedge clk, posedge rst)
	begin
		// if reset is 1 then set the output to 0
		if(rst == 1)
		begin
			q <= 0;
		end
		else	// else set the output to the input value
		begin
			q <= d; 
		end
	end

endmodule
