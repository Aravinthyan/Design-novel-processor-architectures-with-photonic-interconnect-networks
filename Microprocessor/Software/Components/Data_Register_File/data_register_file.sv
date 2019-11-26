module data_register_file
#(
	parameter ADDR_WIDTH_RF = 1,
	parameter DATA_WIDTH = 1
)
(
	input logic clk,
	input logic write_enable,
	input logic [ADDR_WIDTH_RF - 1:0] address_1,
	input logic [ADDR_WIDTH_RF - 1:0] address_2,
	input logic [DATA_WIDTH - 1:0] write_data,
	output logic [DATA_WIDTH - 1:0] read_data
);

	logic [DATA_WIDTH - 1:0]registers[2**ADDR_WIDTH_RF - 1:0];

	always_comb
	begin
		read_data = registers[address_2];
	end

	always_ff@(posedge clk)
	begin
		if(write_enable == 1'b1)
		begin
			registers[address_1] <= write_data;
		end
	end	

endmodule
