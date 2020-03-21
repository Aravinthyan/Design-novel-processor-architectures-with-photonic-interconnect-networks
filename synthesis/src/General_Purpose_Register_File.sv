/***********************************************************************************
*	File name
				General_Purpose_Register_File.sv
*	Description
				This module describes a register file.
*	Parameters
				ADDR_WIDTH_RF - This indicates the width of the address.

				DATA_WIDTH - This is the width of the data written or read.
*	Inputs
				clk - The clock for the system.

				general_register_write_enable - This control signal will write the data given by general_register_write_data at the address indicated by address_3 if set to 1 and it is the positive edge of the clock.

				stack_write_enable - This control signal will write the data given by stack_register_write_data at the address indicated by address_3 if set to 1 and it is the positive edge of the clock.

				address_1 - This indicates which register to be accesed in the register file. 

				address_2 - This indicates which register to be accesed in the register file.

				address_3 - This indicates which register to be accesed in the register file.

				general_register_write_data - This is the data that can be written to any register apart from the 1st register in the register file.

				stack_register_write_data - This is the data that can be written to only the 1st register in the register file.
*	Outputs	
				read_data_1 - This is the data that is read from the register file at address_1.

				read_data_2 - This is the data that is read from the register file at address_2.
*	Author
				Sreethyan Aravinthan (UCL)
**********************************************************************************/

module General_Purpose_Register_File
#(
	parameter ADDR_WIDTH_RF = 1,
	parameter DATA_WIDTH = 1
)
(
	input logic clk,
	input logic general_register_write_enable,
	input logic stack_write_enable,
	input logic [ADDR_WIDTH_RF - 1:0] address_1,
	input logic [ADDR_WIDTH_RF - 1:0] address_2,
	input logic [ADDR_WIDTH_RF - 1:0] address_3,
	input logic [DATA_WIDTH - 1:0] general_register_write_data,
	input logic [DATA_WIDTH - 1:0] stack_register_write_data,
	output logic [DATA_WIDTH - 1:0] read_data_1,
	output logic [DATA_WIDTH - 1:0] read_data_2
);

	// regsiter file
	logic [DATA_WIDTH - 1:0]registers[2**ADDR_WIDTH_RF - 1:0];

	// data read from address pointed by address_1 and address_2
	always_comb
	begin
		read_data_1 = registers[address_1];
		read_data_2 = registers[address_2];
	end

	// write data if enable signal is set and positive edge of the clock
	always_ff@(posedge clk)
	begin
		if(general_register_write_enable == 1'b1)
		begin
			registers[address_3] <= general_register_write_data;
		end
		if(stack_write_enable == 1'b1)
		begin
			registers[0] <= stack_register_write_data;
		end
	end	

endmodule
