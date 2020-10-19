/***********************************************************************************
*	File name
				Flags_Register.sv
*	Description
				This module is a register with an enable signal. This is for the flags.
*	Parameters
				NONE
*	Inputs
				clk - The clock for the system.

				rst - Signal to reset the system to the default values.

				flags_reg_write_enable - This is an enable signal that allows the the contents of the register to be updated if this is set and it is the positive edge of the clock.

				d - This is the input data to the flags register.
*	Outputs	
				q - This is the output data to the flags register.
*	Author
				Sreethyan Aravinthan (UCL)
**********************************************************************************/

module Flags_Register
(
	input logic clk,
	input logic rst,
	input logic flags_reg_write_enable,
	input logic d[3:0],
	output logic q[3:0]
);

	logic zero[3:0];

	always_comb
	begin
		zero[3] = 1'b0;
		zero[2] = 1'b0;
		zero[1] = 1'b0;
		zero[0] = 1'b0;
	end

	// asynchronus register
	always_ff@(posedge clk, posedge rst)
	begin
		// if reset is 1 then set the output to 0
		if(rst == 1)
		begin
			q <= zero;
		end
		// else set the output to the input value
		else if(flags_reg_write_enable == 1)	
		begin
			q <= d; 
		end
	end

endmodule
