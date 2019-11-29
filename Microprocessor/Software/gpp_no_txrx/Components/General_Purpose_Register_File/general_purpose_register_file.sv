module general_purpose_register_file
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
	output logic [DATA_WIDTH - 1:0] read_data_2,
	output logic [DATA_WIDTH - 1:0] id
);

	logic [DATA_WIDTH - 1:0]registers[2**ADDR_WIDTH_RF - 1:0];

	always_comb
	begin
		read_data_1 = registers[address_1];
		read_data_2 = registers[address_2];
		id = registers[1];
	end

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
