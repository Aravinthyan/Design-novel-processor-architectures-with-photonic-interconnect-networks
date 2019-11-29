module zero_register
(
	input logic clk,	// clock signal
	input logic rst,	// reset signal
	input logic write_enable,	// write enable signal
	input logic d,	// input signal
	output logic q	// output signal
);

	// asynchronus register
	always_ff@(posedge clk, posedge rst)
	begin
		// if reset is 1 then set the output to 0
		if(rst == 1)
		begin
			q <= 0;
		end
		else if(write_enable == 1)	// else set the output to the input value
		begin
			q <= d; 
		end
	end

endmodule
