module flags_register
(
	input logic clk,	// clock signal
	input logic rst,	// reset signal
	input logic flags_reg_write_enable,	// write enable signal
	input logic d[3:0],	// input signal
	output logic q[3:0]	// output signal
);

	logic zero[3:0];

	always_comb
	begin
		zero[3] = 0'b0;
		zero[2] = 0'b0;
		zero[1] = 0'b0;
		zero[0] = 0'b0;
	end

	// asynchronus register
	always_ff@(posedge clk, posedge rst)
	begin
		// if reset is 1 then set the output to 0
		if(rst == 1)
		begin
			q <= zero;
		end
		else if(flags_reg_write_enable == 1)	// else set the output to the input value
		begin
			q <= d; 
		end
	end

endmodule
