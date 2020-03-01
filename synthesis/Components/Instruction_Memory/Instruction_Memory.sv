module Instruction_Memory
#(
	parameter ADDR_WIDTH_IM = 5,
	parameter INSTR_WIDTH = 16, 
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
