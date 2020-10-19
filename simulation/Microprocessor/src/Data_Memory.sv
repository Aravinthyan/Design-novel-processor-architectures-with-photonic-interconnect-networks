/***********************************************************************************
*	File name
				Data_Memory.sv
*	Description
				This module describes RAM.
*	Parameters
				WIDTH - This is the WIDTH of the input/output data and the address used to read/write.
*	Inputs
				clk - The clock for the system.

				memory_write_enable - This is a control signal that indicates if the data at the input should be written or not.

				address_rw - This is the address that is used to read/write.

				data_in - This is the data that will be written to the memory at the address given at the input.
*	Outputs	
				data_out - This is the data that is read from the address at the input.
*	Author
				Sreethyan Aravinthan (UCL)
**********************************************************************************/

module Data_Memory
#(
	parameter WIDTH = 1
)
(
	input logic clk,
	input logic memory_write_enable,
	input logic [WIDTH - 1:0]address_rw,
	input logic [WIDTH - 1:0]data_in,
	output logic [WIDTH - 1:0]data_out
);

	logic [WIDTH - 1:0]RAM[2**WIDTH - 1:0];

	always_comb
	begin
		data_out = RAM[address_rw];
	end

	always_ff@(posedge clk)
	begin
		if(memory_write_enable == 1'b1)
		begin
			RAM[address_rw] = data_in;
		end
	end

endmodule
