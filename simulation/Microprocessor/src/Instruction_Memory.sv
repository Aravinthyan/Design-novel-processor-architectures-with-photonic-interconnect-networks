/***********************************************************************************
*	File name
				Instruction_Memory.sv
*	Description
				This module describes a 2-port ROM.
*	Parameters
				ADDR_WIDTH_IM - This is the width of the address field.

				INSTR_WIDTH - This is the width of the instruction.

				FILE_NAME - This is the name of the file that will be loaded and set as default values.
*	Inputs
				address_1 - This is the address that is wished to be accessed.

				address_2 - This is the address that is wished to be accessed.
*	Outputs	
				read_data_1 - This is the value at address_1.

				read_data_2 - This is the value at address_2.
*	Author
				Sreethyan Aravinthan (UCL)
**********************************************************************************/

module Instruction_Memory
#(
	parameter ADDR_WIDTH_IM = 1,
	parameter INSTR_WIDTH = 1, 
	parameter FILE_NAME = "out.mem"
)
(
	input logic [ADDR_WIDTH_IM - 1:0]address_1,
	input logic [ADDR_WIDTH_IM - 1:0]address_2,
	output logic [INSTR_WIDTH - 1:0]read_data_1,
	output logic [INSTR_WIDTH - 1:0]read_data_2
);
	
	logic [INSTR_WIDTH - 1:0]ROM[2**ADDR_WIDTH_IM - 1:0];

	initial
	begin
		$readmemb(FILE_NAME, ROM);	
	end
	
	always_comb
	begin
		read_data_1 = ROM[address_1];
		read_data_2 = ROM[address_2];
	end

endmodule
